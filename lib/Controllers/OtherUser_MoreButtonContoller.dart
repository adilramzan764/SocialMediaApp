
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:socialmediaapp/BottomBarScreens/Profile/Profile%20Edit/Profile_Edit.dart';
import 'package:socialmediaapp/CreatePost/CreatePost.dart';

import '../BottomBarScreens/Home/SharePost.dart';
import '../BottomBarScreens/Profile/Copy_URL.dart';
import '../ProfileMenuButton_Screens/SavedPosts.dart';
import '../Utils/CustomDialog.dart';


class Otheruser_MoreButtonController extends GetxController {
  // Add your controller logic here
  // For example, you can handle tap actions and update the UI
  void handleTapAction(int index,BuildContext context) {
    switch (index) {
      case 0:
      // Handle the "report" action
        print("pressed");
        CustomDialog.showcustomDialog(context,"Are you sure you want to Report?","Report","Cancel");


        break;
      case 1:
      // Handle the "block" action
        CustomDialog.showcustomDialog(context,"Are you sure you want to Block?","Block","Cancel");

        break;
      case 2:
      // Handle the "unfollow" action
        CustomDialog.showcustomDialog(context,"Are you sure you want to Unfollow?","Unfollow","Cancel");

        break;
      case 3:
      // Handle the "send message" action

        break;
      case 4:
      // Handle the "copy profile URL" action

        showCopyURLDialog(context); // Call the function to show the dialog
        break;
      case 5:
      // Handle the "Share the Profile" action

        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => MyBottomSheet(),
        );
    // Add more cases as needed
    }
  }
}
