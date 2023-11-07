import 'package:get/get.dart';
import '../Models/ProfileModels.dart';
import '../Utis/firebase.dart'; // Import the Firebase instance

class ProfileController extends GetxController {
  // Define your ProfileModel as an observable object
  final Rx<ProfileModel> userProfile = ProfileModel(
    profileimage: 'assets/profilepic.png',
    name: "Minha Anjum",
    dob: "29/6/2002",
    location: 'Lahore',
    bio: "Graphic Designer/\nAnimator/Videographer",
    numberOfPosts: "1458",
    numberOfFollowers: "321",
    numberOfFollowings: "154",
    posts: [
      "assets/profilepic.png",
      "assets/model1.jpg",
      "assets/model2.jpg",
      'assets/model3.jpg',
      'assets/model4.jpg',
      // ... add more images
    ],
  ).obs;

  @override
  void onInit() {
    super.onInit();

    // Fetch user profile data from Firestore (replace 'users' and 'user_id' with your collection and document ID).
    firestore.collection('users').doc('o8MQacbDnUcwWdwQbBKojAXM8rV2').get().then((documentSnapshot) {
      if (documentSnapshot.exists) {
        // Update the userProfile properties and trigger reactivity using .value.
        userProfile.update((val) {
          val?.name = documentSnapshot['name'];
          val?.bio = documentSnapshot['bio'];
          // Add more fields as needed.
        });
      }
    });
  }
}
