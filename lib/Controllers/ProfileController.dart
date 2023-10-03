import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Models/ProfileModel.dart';

class ProfileController extends GetxController {
  // Define your ProfileModel as an observable object
  final Rx<ProfileModel> userProfile = ProfileModel(
    profileimage: 'assets/profilepic.png',
    name: "Minha Anjum",
    bio: "Graphic Designer/\nAnimator/Vediographer",
    numberOfPosts: "1458",
    numberOfFollowers: "321",
    numberOfFollowings: "154",
    posts: [
      "assets/profilepic.png",
      "assets/model1.jpg",
      "assets/model2.jpg",
      'assets/model3.jpg',
      'assets/model4.jpg',
      'assets/model4.jpg',
      'assets/model4.jpg',
      'assets/model4.jpg',
      'assets/model4.jpg',
      'assets/model4.jpg',
      "assets/model2.jpg",
      "assets/model2.jpg",

    ],
  ).obs;

  @override
  void onInit() {
    super.onInit();
  }
}
