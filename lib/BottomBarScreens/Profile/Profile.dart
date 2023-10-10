import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:socialmediaapp/BottomBarScreens/Profile/Profile%20Edit/Profile_Edit.dart';

import '../../Controllers/ProfileController.dart';
import '../../Models/ProfileModel.dart';
import '../../Utils/CustomButton.dart';
import '../../Utils/PicPost_Widget.dart';
import '../Home/PostsFeedScreen.dart';
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
              leading:
              otherUserProfile ?

              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 29),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      CupertinoIcons.left_chevron,
                      color: Colors.black,
                    )),
              ) :
              SizedBox(),
              automaticallyImplyLeading: false,
              expandedHeight: 400,
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
                    return Stack(
                      children: [
                        Container(
                          height: 170,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/model1.jpg'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25))),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 60),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          Profile_MoreButton(
                                            otherUserProfile: otherUserProfile,
                                          ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: ProfilePicWidget(
                                      userProfile.profileimage,
                                      95,
                                      95,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0, right: 20),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text(
                                          userProfile.name,
                                          style: TextStyle(
                                            color: Color(0xff3EA7FF),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        if (otherUserProfile)
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                height: 30,
                                                width: 95,
                                                child: CustomButton(
                                                  text: 'Message',
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (otherUserProfile)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Container(
                                              height: 30,
                                              width: 80,
                                              child: CustomButton(
                                                text: 'Follow',
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        if (!otherUserProfile)
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                height: 30,
                                                width: 120,
                                                child: CustomButton(
                                                  text: 'Edit Profile',
                                                  onPressed: () {Get.to(ProfileEdit());},
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      userProfile.bio,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                              ],
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
                            SizedBox(height: 60),
                            if (otherUserProfile) SizedBox(height: 20),
                          ],
                        ),
                      ],
                    );
                  }),
                ),
              ),
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: TextStyle(fontSize: 14),
                indicatorColor: Color(0xffAC83F6),
                padding: EdgeInsets.symmetric(horizontal: 40),
                indicatorWeight: 3,
                tabs: [
                  Tab(text: 'Post'),
                  Tab(text: 'Media'),
                  Tab(text: 'Like'),
                ],
              ),
            ),
          ],
          body: Container(
            height: 175 * controller.userProfile.value.posts.length.toDouble(),
            child: TabBarView(
              children: [
                PostFeedScreen(saved_posts_Screen: false, ispersonalpost: !otherUserProfile,),

                All_Tab(userprofile: controller.userProfile.value),
                Center(child: Text('Likes')),],
            ),
          ),
        ),
      ),
    );
  }
}