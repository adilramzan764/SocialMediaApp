import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../../ViewModels/signUpViewModel.dart';
import '../../Widgets/CustomButton.dart';
import 'UsernameCreation.dart';

class PickProfilePicture extends StatelessWidget {
  PickProfilePicture({Key? key}) : super(key: key);
  final registerVM = Get.put(RegisterViewModel());
  final ImagePicker _picker = ImagePicker();
  Rx<File?> _pickedImage = Rx<File?>(null);

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        _pickedImage.value = File(pickedFile.path);
        print("Image Path: ${_pickedImage.value!.path}");
      }
    } catch (e) {
      print("Error picking image: $e");
      // Handle errors here
    }
  }

  Future<String?> _uploadImageToFirebase(File? imageFile) async {
    try {
      if (imageFile != null) {
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('images/$fileName');
        UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
        TaskSnapshot taskSnapshot = await uploadTask;
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        // Now you can use 'downloadUrl' where you want in your code
        print("Image URL from Firebase Storage: $downloadUrl");
        return downloadUrl;
      } else {
        print("No image picked to upload.");
        return null;
      }
    } catch (e) {
      print("Error uploading image to Firebase Storage: $e");
      // Handle errors here
      return null;
    }
  }

  Future<void> _saveImageUrlToFirestore(String imageUrl) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId = user.uid;
        await FirebaseFirestore.instance.collection('users').doc(userId).set({
          'profileImageUrl': imageUrl,
        }, SetOptions(merge: true));
        print("Image URL saved in Firestore: $imageUrl");
      }
    } catch (e) {
      print("Error saving image URL to Firestore: $e");
      // Handle errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.1),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "  Pick a Profile picture",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.01),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Have a favorite Selfie? Upload it now",
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ),
            SizedBox(height: Get.height * 0.06),
            GestureDetector(
              onTap: _pickImage,
              child: Obx(() {
                return Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        spreadRadius: 0.5,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ],
                  ),
                  child: _pickedImage.value != null
                      ? Image.file(_pickedImage.value!, fit: BoxFit.cover)
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/Camera.svg', height: 50, width: 50),
                      SizedBox(height: 15),
                      Text(
                        "Upload",
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                      ),
                    ],
                  ),
                );
              }),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
              child: CustomButton(
                text: 'Skip for now',
                onPressed: () {
                  // Handle skip button action
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
              child: CustomButton(
                text: 'Next',
                onPressed: (){
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UsernameCreation(),
                          ),
                        );
                },
                // onPressed: () async {
                //   String? imageUrl = await _uploadImageToFirebase(_pickedImage.value);
                //   if (imageUrl != null) {
                //     await _saveImageUrlToFirestore(imageUrl);
                //   }
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => UsernameCreation(),
                //     ),
                //   );
                // },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
