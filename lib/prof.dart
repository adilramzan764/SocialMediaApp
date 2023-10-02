// SingleChildScrollView(
//   child: Column(
//     children: [
//       Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             // color: Colors.black,
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(30)),
//             boxShadow: [
//               BoxShadow(
//                   spreadRadius: 1, color: Colors.grey.withOpacity(0.3))
//             ]),
//         child: Column(children: [
//           SizedBox(
//             height: 60,
//           ),
//           Align(
//             alignment: Alignment.centerRight,
//             child: IconButton(onPressed: (){},icon: Icon(Icons.more_vert),),
//           ),
//           SizedBox(height: 10,),
//           Center(
//             child: ProfilePicWidget(userProfile.profileimage, 110, 110),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             userProfile.name,
//             style: TextStyle(
//                 color: Color(0xff3EA7FF),
//                 fontWeight: FontWeight.w500,
//                 fontSize: 14),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Text(
//             userProfile.bio,
//             style: TextStyle(color: Colors.black, fontSize: 12),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                   child: Accountdata_Widget(
//                       "Post", userProfile.numberOfPosts)),
//               Expanded(
//                   child: Accountdata_Widget(
//                       "Follwers", userProfile.numberOfFollowers)),
//               Expanded(
//                   child: Accountdata_Widget(
//                       "Following", userProfile.numberOfFollowings)),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           if (widget.otherUserProfile == true)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                       flex: 1,
//                       child:
//                           CustomButton(text: 'Follow', onPressed: () {})),
//                   SizedBox(width: 10),
//                   Expanded(
//                       flex: 1,
//                       child: CustomButton(
//                           text: 'Send Message', onPressed: () {})),
//                 ],
//               ),
//             ),                if (widget.otherUserProfile == true)
//
//             SizedBox(
//             height: 20,
//           ),
//         ]),
//       ),
//       Profile_TabBar(
//         userprofile: userProfile,
//       )
//     ],
//   ),
// ),




// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../Models/ProfileModel.dart';
// import 'All_TAb.dart';
// import '../Home/PostsFeedScreen.dart';
//
// class Profile_TabBar extends StatelessWidget {
//   ProfileModel userprofile;
//
//   Profile_TabBar({Key? key, required this.userprofile}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: DefaultTabController(
//         length: 3,
//         child: Column(
//           children: [
//             TabBar(
//               indicatorSize: TabBarIndicatorSize.tab,
//               labelStyle: TextStyle(fontSize: 16),
//               // indicatorSize: TabBarIndicatorSize.label,
//
//               indicatorColor: Color(0xffAC83F6),
//               padding: EdgeInsets.symmetric(horizontal: 40),
//               indicatorWeight: 3,
//               tabs: [
//                 Tab(text: 'All'), // First tab
//                 Tab(text: 'Images'), // Second tab
//                 Tab(text: 'Videos'), // Second tab
//               ],
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 height: 170 * 5,
//                 child: TabBarView(
//                   children: [
//                     // Content for Tab 1
//                     All_Tab(
//                       userprofile: userprofile,
//                     ),
//
//                     // Content for Tab 2
//                     Center(child: Text('Images')),
//                     Center(child: Text('Vedios')),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
