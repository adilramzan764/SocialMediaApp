import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../BottomBarScreens/Home/PostsFeedScreen.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelStyle: TextStyle(fontSize: 16),
            indicatorColor: Color(0xffAC83F6),
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: 'News Feed'), // First tab
              Tab(text: 'Friends Feed'), // Second tab
            ],
          ),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height*0.7,
              child: TabBarView(
                children: [
                  // Content for Tab 1
                  PostFeedScreen(saved_posts_Screen: false, ispersonalpost: false,),

                  // Content for Tab 2
                  PostFeedScreen(saved_posts_Screen: false, ispersonalpost: false,)

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
