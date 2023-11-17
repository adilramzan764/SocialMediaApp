import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../View/BottomBarScreens/Profile/Profile.dart';
import 'GetuserdataDataController.dart';

class ProfileEditController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController dOBController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  GetUserDataController getUserDataController =
      Get.put(GetUserDataController());

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  RxBool isUploading = false.obs;

  Future<void> updateProfileHandler({
    userName,
    userDOB,
    userLocation,
    userBio,
  }) async {
    if (nameController.text.isNotEmpty &&
        dOBController.text.isNotEmpty &&
        locationController.text.isNotEmpty &&
        bioController.text.isNotEmpty) {
      try {
        await uploadProfileImageToFirebaseStorage(
          profileImage: selectedProfileImage.value,
          coverImage: selectedCoverImage.value,
          userName: userName,
          userDOB: userDOB,
          userLocation: userLocation,
          userBio: userBio,
        );
      } on FirebaseAuthException catch (e) {
        Get.snackbar('Error', e.toString());
      }
    } else {
      Get.snackbar('Required', 'All fields are Required');
    }
  }

  Future<void> updateUserData({
    profileImage,
    backgroundImage, // Corrected parameter name
    userName,
    userDOB,
    userBio,
    userLocation,
  }) async {
    final dataToUpdate = {
      'photoUrl': profileImage,
      'backgroundImage': backgroundImage, // Corrected parameter name
      'name': userName,
      "userBio": userBio,
      "userLocation": userLocation,
      'dob': userDOB,
    };
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .update(dataToUpdate)
        .then(
      (value) {
        getUserDataController.getUserData();
        Get.snackbar('Success', 'User Update Successfully.');
        log("User Updated");
      },
    ).catchError((error) {
      log("Failed to add user: $error");
    });
  }

  Future<void> uploadProfileImageToFirebaseStorage({
    profileImage,
    coverImage,
    userName,
    userDOB,
    userBio,
    userLocation,
  }) async {
    try {
      final storage = FirebaseStorage.instance;
      String? profileImageUrl;
      String? backgroundImage;

      if (profileImage != null && coverImage == null) {
        final fileProfileName = '${auth.currentUser!.uid}_image.jpg';
        final Reference storageProfileRef =
            storage.ref().child('profile_images_folder/$fileProfileName');
        await storageProfileRef.putFile(profileImage);

        profileImageUrl = await storageProfileRef.getDownloadURL();
        log('Download URL for $fileProfileName: $profileImageUrl');

        await updateUserData(
          profileImage: profileImageUrl,
          userName: userName,
          userBio: userBio,
          userLocation: userLocation,
          userDOB: userDOB,
          backgroundImage:
              getUserDataController.getUserDataRxModel.value!.backgroundImage,
        );
      } else if (profileImage == null && coverImage != null) {
        final fileCoverName = '${auth.currentUser!.uid}_background_image.jpg';
        final Reference storageCoverRef =
            storage.ref().child('background_images_folder/$fileCoverName');
        await storageCoverRef.putFile(coverImage);

        backgroundImage = await storageCoverRef.getDownloadURL();
        log('Download URL for $fileCoverName: $backgroundImage');

        await updateUserData(
          profileImage:
              getUserDataController.getUserDataRxModel.value!.profileimage,
          userName: userName,
          userBio: userBio,
          userLocation: userLocation,
          userDOB: userDOB,
          backgroundImage: backgroundImage,
        );
      } else if (selectedProfileImage.value != null &&
          selectedCoverImage.value != null) {
        final fileProfileName = '${auth.currentUser!.uid}_image.jpg';
        final Reference storageProfileRef =
            storage.ref().child('profile_images_folder/$fileProfileName');
        await storageProfileRef.putFile(profileImage);

        profileImageUrl = await storageProfileRef.getDownloadURL();
        log('Download URL for $fileProfileName: $profileImageUrl');

        final fileCoverName = '${auth.currentUser!.uid}_background_image.jpg';
        final Reference storageCoverRef =
            storage.ref().child('background_images_folder/$fileCoverName');
        await storageCoverRef.putFile(coverImage);

        backgroundImage = await storageCoverRef.getDownloadURL();
        log('Download URL for $fileCoverName: $backgroundImage');

        await updateUserData(
          profileImage: profileImageUrl,
          userName: userName,
          userBio: userBio,
          userLocation: userLocation,
          userDOB: userDOB,
          backgroundImage: backgroundImage,
        );
      } else if (selectedProfileImage.value == null &&
          selectedCoverImage.value == null) {
        await updateUserData(
          profileImage:
              getUserDataController.getUserDataRxModel.value!.profileimage,
          userName: userName,
          userBio: userBio,
          userLocation: userLocation,
          userDOB: userDOB,
          backgroundImage:
              getUserDataController.getUserDataRxModel.value!.backgroundImage,
        );
      }
    } catch (e) {
      log('Error uploading images to Firebase Storage: $e');
    }
  }

  var selectedCoverImage = Rx<File?>(null);
  var selectedProfileImage = Rx<File?>(null);

  selectDOB(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      String formattedDate = DateFormat('dd MMM yyyy').format(picked);
      dOBController.text = formattedDate.toString();
    }
  }

  coverPickedImage() async {
    final picker = ImagePicker();
    try {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedCoverImage.value = File(pickedFile.path);
        log(selectedCoverImage.value.toString());
      } else {
        Get.snackbar("No Image", "Please Select Image");
      }
    } catch (e) {
      Get.snackbar("An Error", " ${e.toString()}");
    }
  }

  profilePickedImage() async {
    final picker = ImagePicker();
    try {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedProfileImage.value = File(pickedFile.path);
        log(selectedProfileImage.value.toString());
      } else {
        Get.snackbar("No Image", "Please Select Image");
      }
    } catch (e) {
      Get.snackbar("An Error", " ${e.toString()}");
    }
  }
}
