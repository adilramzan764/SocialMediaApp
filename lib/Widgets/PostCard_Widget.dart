import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:socialmediaapp/View/BottomBarScreens/Home/FeedPost_MoreButton.dart';
import 'package:socialmediaapp/View/BottomBarScreens/Home/SharePost.dart';
import 'package:socialmediaapp/View/BottomBarScreens/Profile/PersnonalPosts_MoreButton.dart';
import 'package:socialmediaapp/View/BottomBarScreens/Profile/Profile.dart';
import '../Controllers/GetuserdataDataController.dart';
import '../Controllers/Post_Controller.dart';
import '../Models/postModel.dart';
import 'PicPost_Widget.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  final bool ispersonalpost;

  PostCard({required this.post,required this.ispersonalpost});

  @override
  Widget build(BuildContext context) {
    GetUserDataController getUserDataController =
    Get.put(GetUserDataController());
    return Card(
      color: Colors.white,
      elevation: 0.2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(otherUserProfile: !ispersonalpost), // Replace SecondScreen with the screen you want to navigate to.
                      ),
                    );
                  },
                  child: ProfilePicWidget(
                      picType: 'network',
                      getUserDataController.getUserDataRxModel.value!.profileimage, 45, 45),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      post.timestamp,
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        if(!ispersonalpost){

                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(
                                    25)), // Set circular border radius here
                          ),
                          context: context,
                          builder: (BuildContext context) =>
                              FeedPost_MoreButton(),
                        );}
                        else{
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  topLeft: Radius.circular(
                                      25)), // Set circular border radius here
                            ),
                            context: context,
                            builder: (BuildContext context) =>
                                PersonalPosts_MoreButton(),
                          );}
                      },
                      icon: const Icon(Icons.more_vert),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Stack(
              children: [
                Container(
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(25),
                    ),
                    image: DecorationImage(
                      image: AssetImage(                      post.postpic,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 20,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          '3/10',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/like.svg',
                    height: 20,
                    width: 20,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  post.likes,
                  style: const TextStyle(fontWeight: FontWeight.w300),
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  'assets/comment.svg',
                  height: 20,
                  width: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  post.comeents,
                  style: const TextStyle(fontWeight: FontWeight.w300),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(
                                    25)), // Set circular border radius here
                          ),
                          context: context,
                          builder: (BuildContext context) => MyBottomSheet(),
                        );
                      },
                      child: SvgPicture.asset(
                        'assets/send.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    // Toggle the postsaved state
                  },
                  child: post.postsaved
                      ? SvgPicture.asset(
                    'assets/save_blue.svg',
                    height: 20,
                    width: 20,
                  )
                      : SvgPicture.asset(
                    'assets/save.svg',
                    height: 20,
                    width: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              post.caption,
              style: const TextStyle(fontSize: 13.0),
            ),
            const SizedBox(height: 3.0),
            Wrap(
              children: post.hashtags
                  .map((hashtag) => Text(
                '#$hashtag ',
                style: const TextStyle(color: Color(0xff7F7F7F),fontSize: 13),
              ))
                  .toList(),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}