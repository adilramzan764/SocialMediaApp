import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../BottomBarScreens/Home/PostsFeedScreen.dart';

class Saved_Posts extends StatelessWidget {
  const Saved_Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // SizedBox(height: 60,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
              border: Border.all(color: Colors.grey.withOpacity(0.3))
            ),
            child: Column(
              children: [
                SizedBox(height: 60,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(CupertinoIcons.left_chevron)),
                    Text(
                      "Saved",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(height: 40, width: 40,)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TabBar(
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
                  // Remove the fixed height for TabBarView
                  Expanded(
                    child: TabBarView(
                      children: [
                        PostFeedScreen(saved_posts_Screen: true,),
                        Center(child: Text('Images')),
                        Center(child: Text('Videos')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
