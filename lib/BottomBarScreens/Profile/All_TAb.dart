import 'package:flutter/cupertino.dart';

import '../../Models/ProfileModel.dart';
import '../../Utils/PicPost_Widget.dart';

class All_Tab extends StatelessWidget {
  ProfileModel userprofile;

  All_Tab({Key? key, required this.userprofile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate the height based on the number of items in the list
    double gridHeight = (userprofile.posts.length / 2).ceil() * 170.0; // Assuming 2 items per row and each item has a height of 170.0

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        // height: gridHeight, // Use the calculated height
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 5.0, // Spacing between columns
            mainAxisSpacing: 8.0, // Spacing between rows
          ),
          scrollDirection: Axis.vertical,
          itemCount: userprofile.posts.length,
          // Total number of grid items
          itemBuilder: (BuildContext context, int index) {
            // Replace this with the content you want to display for each grid item
            print(userprofile.posts[index]);
            return CreatePostPicWidget(userprofile.posts[index], 150, true);
          },
        ),
      ),
    );
  }
}
