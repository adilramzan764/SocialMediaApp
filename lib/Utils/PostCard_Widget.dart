import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socialmediaapp/BottomBarScreens/Home/SharePost.dart';
import 'package:socialmediaapp/BottomBarScreens/Profile/Profile.dart';

import '../BottomBarScreens/Home/FeedPost_MoreButton.dart';
import '../BottomBarScreens/Profile/PersnonalPosts_MoreButton.dart';
import '../Controllers/Post_Controller.dart';
import 'PicPost_Widget.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final bool ispersonalpost;

  PostCard({required this.post,required this.ispersonalpost});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0.2,
      child: Padding(
        padding: EdgeInsets.all(16.0),
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
                  child: ProfilePicWidget(post.profilepic, 50, 50),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      post.timestamp,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
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
                          context: context,
                          builder: (BuildContext context) =>
                              FeedPost_MoreButton(),
                        );}
                        else{
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) =>
                                PersonalPosts_MoreButton(),
                          );}
                      },
                      icon: Icon(Icons.more_vert),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Stack(
              children: [
                Container(
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
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
                      child: Center(
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
            SizedBox(height: 10),
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
                SizedBox(width: 5),
                Text(
                  post.likes,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                SizedBox(width: 10),
                SvgPicture.asset(
                  'assets/comment.svg',
                  height: 20,
                  width: 20,
                ),
                SizedBox(width: 5),
                Text(
                  post.comeents,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
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
                SizedBox(width: 10),
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
            SizedBox(height: 10),
            Text(
              post.caption,
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 3.0),
            Wrap(
              children: post.hashtags
                  .map((hashtag) => Text(
                '#$hashtag ',
                style: TextStyle(color: Color(0xff7F7F7F)),
              ))
                  .toList(),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}