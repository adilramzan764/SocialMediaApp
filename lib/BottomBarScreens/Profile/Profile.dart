import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package


import '../../Controllers/ProfileController.dart';
import '../../Models/ProfileModel.dart';
import '../../Utils/CustomButton.dart';
import '../../Utils/PicPost_Widget.dart';
import 'All_Tab.dart';
import 'ProfileWidgets.dart';
import 'Profile_MoreButton.dart';
import 'Profile_TabBar.dart';



class Profile extends StatelessWidget {
  final bool otherUserProfile;
  final ProfileController controller = Get.put(ProfileController());

  Profile({Key? key, required this.otherUserProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: otherUserProfile ? 450 : 400,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ],
                  ),
                  child: Obx(() {
                    final userProfile = controller.userProfile.value;
                    return Column(
                      children: [
                        SizedBox(height: 60),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(

                                context: context,
                                builder: (BuildContext context) => Profile_MoreButton(otherUserProfile: otherUserProfile,),
                              );
                            },
                            icon: Icon(Icons.more_vert),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: ProfilePicWidget(
                            userProfile.profileimage,
                            110,
                            110,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          userProfile.name,
                          style: TextStyle(
                            color: Color(0xff3EA7FF),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          userProfile.bio,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Accountdata_Widget(
                                "Post",
                                userProfile.numberOfPosts,
                              ),
                            ),
                            Expanded(
                              child: Accountdata_Widget(
                                "Followers",
                                userProfile.numberOfFollowers,
                              ),
                            ),
                            Expanded(
                              child: Accountdata_Widget(
                                "Following",
                                userProfile.numberOfFollowings,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        if (otherUserProfile)
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: CustomButton(
                                    text: 'Follow',
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  flex: 1,
                                  child: CustomButton(
                                    text: 'Send Message',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (otherUserProfile) SizedBox(height: 20),
                      ],
                    );
                  }),
                ),
              ),
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: TextStyle(fontSize: 16),
                indicatorColor: Color(0xffAC83F6),
                padding: EdgeInsets.symmetric(horizontal: 40),
                indicatorWeight: 3,
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Images'),
                  Tab(text: 'Videos'),
                ],
              ),
            ),
          ],
          body: Center(
            child: Container(
              height: 170 * controller.userProfile.value.posts.length.toDouble(),
              child: TabBarView(
                children: [
                  All_Tab(userprofile: controller.userProfile.value),
                  Center(child: Text('Images')),
                  Center(child: Text('Videos')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
