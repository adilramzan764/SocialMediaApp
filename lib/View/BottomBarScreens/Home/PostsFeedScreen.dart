import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


import '../../../Controllers/Post_Controller.dart';
import '../../../Models/postModel.dart';
import '../../../Widgets/PostCard_Widget.dart';
import '../Profile/Profile.dart';
import 'FeedPost_MoreButton.dart';
import 'SharePost.dart';

// Define the PostController and Post classes here (same as in your code)

class PostFeedScreen extends StatefulWidget {
  bool saved_posts_Screen;
  final bool ispersonalpost;

  PostFeedScreen({required this.saved_posts_Screen,required this.ispersonalpost});

  @override
  State<PostFeedScreen> createState() => _PostFeedScreenState();
}

class _PostFeedScreenState extends State<PostFeedScreen> {
  // Create a list of posts (you can replace this with actual data)
  final List<PostModel> posts = [
    PostModel(
      name: 'John Doe',
      post: 'Lorem ipsum dolor sit amet...',
      profilepic: 'assets/profilepic.png',
      postpic: 'assets/model1.jpg',
      caption: '"Lost in the beauty of natures embrace. 🌿🌄',
      timestamp: '10 min ago',
      likes: '2555',
      comeents: '2',
      postsaved: true,
      hashtags: ['nature', 'sunset'],
    ),
    PostModel(
      name: 'Jane Smith',
      post: 'Sed ut perspiciatis unde omnis iste...',
      profilepic: 'assets/profilepic.png',
      postpic: 'assets/model4.jpg',
      caption: 'Exploring new places!',
      timestamp: '15 min ago',
      likes: '10',
      comeents: '3',
      postsaved: true,

      hashtags: ['travel', 'adventure'],
    ),
    PostModel(
      name: 'Jane Smith',
      post: 'Sed ut perspiciatis unde omnis iste...',
      profilepic: 'assets/profilepic.png',
      postpic:'assets/model2.jpg',
      caption: 'Exploring new places!',
      timestamp: '15 min ago',
      likes: '10',
      comeents: '3',
      postsaved: false,

      hashtags: ['travel', 'adventure'],
    ),
    PostModel(
      name: 'Jane Smith',
      post: 'Sed ut perspiciatis unde omnis iste...',
      profilepic: 'assets/profilepic.png',
      postpic: 'assets/model3.jpg',

      caption: 'Exploring new places!',
      timestamp: '15 min ago',
      likes: '10',
      comeents: '3',
      postsaved: false,

      hashtags: ['travel', 'adventure'],
    ),
    // Add more posts as needed
  ];

  bool ispressed = false;

  // Color of the SVG image
  @override
  Widget build(BuildContext context) {
    // Filter posts based on saved_posts_Screen value
    final filteredPosts = widget.saved_posts_Screen
        ? posts.where((post) => post.postsaved).toList()
        : posts;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: filteredPosts.length,
        itemBuilder: (context, index) {
          final post = filteredPosts[index];

          return PostCard(post: post, ispersonalpost: widget.ispersonalpost,);
        },
      ),
    );
  }

}
