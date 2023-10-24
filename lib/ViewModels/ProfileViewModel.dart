import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Models/ProfileModels.dart';

class ProfileViewModel extends GetxController {

  final profile = ProfileModel(
    profileimage: '',
    name: '',
    dob: '',
    bio: '',
    location: '',
    numberOfPosts: '',
    numberOfFollowers: '',
    numberOfFollowings: '',
    posts: [],
  ).obs;

  // Method to fetch user data from Firebase Firestore and map it to ProfileModel
  Future<void> fetchUserData() async {
    try {
      var userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc('gFgJ5m3GoaPpZiB9bKW5VEe8Kdf1')
          .get();

      if (userDoc.exists) {


        // Map the data to a ProfileModel
        profile.value = ProfileModel(
          profileimage: userDoc['profileImage'] ??"",
          name: userDoc['name']??" ",
          dob : userDoc['dob'] ?? "",
          location:  userDoc['location'] ?? " ",
          bio: userDoc['bio'] ?? "",
          numberOfPosts: userDoc['numberOfPosts'] ?? "",
          numberOfFollowers: userDoc['numberOfFollowers'] ?? " ",
          numberOfFollowings: userDoc['numberOfFollowings'] ?? "",
          posts: List<String>.from(userDoc['posts']),
        );
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  // Method to update user data in Firebase Firestore
  Future<void> updateUserData() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('your_user_id')
          .update({
        // 'name': name.value,
        // 'date_of_birth': dateOfBirth.value,
        // 'location': location.value,
        // 'bio': bio.value,
      });
      print('User data saved successfully');
    } catch (e) {
      print('Error saving user data: $e');
    }
  }
}
