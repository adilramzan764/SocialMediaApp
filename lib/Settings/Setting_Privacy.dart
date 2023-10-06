import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:socialmediaapp/BottomBarScreens/Profile/Profile%20Edit/Profile_Edit.dart';

import '../Utils/CustomDialog.dart';
import 'BlockSetting.dart';

class SettingPrivacy extends StatefulWidget {
  const SettingPrivacy({Key? key}) : super(key: key);

  @override
  State<SettingPrivacy> createState() => _SettingPrivacyState();
}

class _SettingPrivacyState extends State<SettingPrivacy> {
  final RxBool notificationSwitchValue = true.obs;
  final RxBool soundNotificationSwitchValue = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 6, // Updated to 6 items
        itemBuilder: (context, index) {
          if (index == 0) {
            // First item
            return Column(
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 14,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 110.0),
                        child: Text(
                          "Setting Privacy",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
              ],
            );
          } else if (index == 1) {
            // Second item
            return ListTile(
              leading: SvgPicture.asset("assets/Square.svg"),
              title: Text("Edit Profile",style: TextStyle( color: Colors.black,fontSize: 12)),
              onTap: (){
                Get.to(ProfileEdit());
              },
            );
          } else if (index == 2) {
            // Third item with notification switch
            return ListTile(
              leading: SvgPicture.asset("assets/Notification.svg"),
              title: Text("Notifications", style: TextStyle(color: Colors.black,fontSize: 12)),
              trailing: Transform.scale(scale: 0.8,
                child: Obx(() => Switch(
                  value: notificationSwitchValue.value,
                  onChanged: (newValue) {
                    notificationSwitchValue.value = newValue;
                    // Perform any other operations based on the switch value here
                  },
                  inactiveTrackColor: Colors.white,
                  activeColor: Colors.blue,
                )),
              ),
            );
          } else if (index == 3) {
            // Fourth item with sound notification switch
            return ListTile(
              leading: SvgPicture.asset("assets/Notification.svg"),
              title: Text("Sound Notifications", style: TextStyle(color: Colors.black,fontSize: 12)),
              trailing: Transform.scale(scale: 0.8,
                child: Obx(() => Switch(
                  value: soundNotificationSwitchValue.value,
                  onChanged: (newValue) {
                    soundNotificationSwitchValue.value = newValue;
                    // Perform any other operations based on the switch value here
                  },
                  activeColor: Colors.white,inactiveThumbColor: Colors.blue,inactiveTrackColor: Colors.white,
                )),
              ),
            );
          } else if (index == 4) {
            // Fifth item (Block option)
            return ListTile(
              leading: Icon(Icons.block, color: Colors.blue),
              title: Text("Block", style: TextStyle(color: Colors.black,fontSize: 12)),
              onTap: () {
                Get.to(()=>BlockSetting());
              },
            );
          } else {
            // Sixth item (Logout option)
            return ListTile(
              leading: SvgPicture.asset("assets/logout.svg"),
              title: Text("Log Out", style: TextStyle(color: Colors.black,fontSize: 12)),
              onTap: () {
                // Show a dialog when the phone icon button is pressed
                CustomDialog.showcustomDialog(context,"Are you sure you want to Log out?","LogOut","Cancel");

              },
            );
          }
        },
      ),
    );
  }
}
