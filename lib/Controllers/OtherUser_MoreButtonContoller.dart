
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:socialmediaapp/BottomBarScreens/Profile/Profile%20Edit/Profile_Edit.dart';
import 'package:socialmediaapp/CreatePost/CreatePost.dart';

import '../BottomBarScreens/Home/SharePost.dart';
import '../ProfileMenuButton_Screens/SavedPosts.dart';
import '../Utils/CustomDialog.dart';


class Otheruser_MoreButtonController extends GetxController {
  // Add your controller logic here
  // For example, you can handle tap actions and update the UI
  void handleTapAction(int index,BuildContext context) {
    switch (index) {
      case 0:
      // Handle the "Saved" action
      print("pressed");
        CustomDialog.showcustomDialog(context,"Are you sure you want to Report?","Report","Cancel");


        break;
      case 1:
      // Handle the "Archive" action
        CustomDialog.showcustomDialog(context,"Are you sure you want to Block?","Block","Cancel");

        break;
      case 2:
      // Handle the "Hide Likes" action
        CustomDialog.showcustomDialog(context,"Are you sure you want to Unfollow?","Unfollow","Cancel");

        break;
      case 3:
      // Handle the "Turn off comments" action

        break;
      case 4:
      // Handle the "Report Post" action
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreatePost()),
        );
        break;
      case 5:
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => MyBottomSheet(),
        );
    // Add more cases as needed
    }
  }
}
