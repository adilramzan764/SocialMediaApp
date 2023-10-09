import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../BottomBarScreens/Profile/Profile.dart';
import '../BottomBarScreens/Profile/ProfileWidgets.dart';
import '../Utils/PicPost_Widget.dart';

class MyDrawer extends StatelessWidget {
  final List<String> profileIcons = [
    "assets/Iconly-Bulk-Profile.svg",
    "assets/Bookmark.svg",
    "assets/Setting.svg",
    "assets/Bulk-Wallet.svg",
  ];

  final List<String> names = ["View Profile", "Saved", "Setting and privacy", "Wallet"];

  // You can pass any required data through the constructor

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(140),
        ),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20.0),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ProfilePicWidget("assets/model1.jpg", 80, 80),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Minha Anjum"),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Accountdata_Widget("Post", "1458"), // Replace 100 with actual number
                  Accountdata_Widget("Followers", "321"), // Replace 200 with actual number
                  Accountdata_Widget("Following", "154"), // Replace 300 with actual number
                ],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: profileIcons.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: SvgPicture.asset(profileIcons[index]),
                    title: Text(names[index]),
                    onTap: () {
                      if(index==0){
                        Profile(otherUserProfile: false,);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
