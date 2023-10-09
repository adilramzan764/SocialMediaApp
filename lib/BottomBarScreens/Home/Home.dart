import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../BottomNavigationBar/BotttomBar_Widget.dart';
import '../../BottomNavigationBar/MyBottomNavigationBar.dart';
import '../../Chat screens/CallBalance.dart';
import '../../Chat screens/MainChatScreens.dart';
import '../../Chat screens/NotificationScreen.dart';
import '../../Chat screens/PhoneTab.dart';
import '../../Controllers/ProfileController.dart';
import '../../CreatePost/CreatePost.dart';
import '../../Drawer/CustomDrawer.dart';
import '../../Utils/MyTabBar.dart';
import '../../Utils/PicPost_Widget.dart';
import '../Profile/ProfileWidgets.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ProfileController controller = Get.put(ProfileController());
  int _currentIndex = 0;
  bool isDrawerOpen = false;


  final List<Widget> _screens = [
    HomeScreenContent(scaffoldKey: _scaffoldKey,),
    MainChatScreens(),
    PhoneTab(),
  ];

  List<String> profileIcons = [
    "assets/Iconly-Bulk-Profile.svg",
    "assets/Bookmark.svg",
    "assets/Setting.svg",
    "assets/Bulk-Wallet.svg",
  ];

  List<String> names = ["View Profile", "Saved", "Setting and privacy", "Wallet"];

  @override
  Widget build(BuildContext context) {

    final userProfile = controller.userProfile.value;

    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      bottomNavigationBar:  _currentIndex!=2 ? CustomBottomNavigationBar(currentIndex: _currentIndex, onTap: (int ) {   setState(() {
        _currentIndex = int;
      }); },): SizedBox(),
      body:_screens[_currentIndex],
    );
  }
}




class HomeScreenContent extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  HomeScreenContent({required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) => IconButton(
                    onPressed: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                    icon: SvgPicture.asset('assets/profile.svg',
                        color: Colors.black),
                  ),
                ),
                Text(
                  'Explore',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset('assets/search.svg',
                          height: 23, width: 23, color: Colors.black),
                      onPressed: () {},
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(NotificationScreen());
                      },
                      icon: SvgPicture.asset('assets/notification.svg',
                          height: 23, width: 23, color: Colors.black),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(child: MyTabBar()),
          ],
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.1))),
            backgroundColor: Color(0xffAC83F6),
            foregroundColor: Colors.white,
            onPressed: () {
              Get.to(CreatePost());
            },
            child: Icon(Icons.add, size: 30),
          ),
        ),
      ],
    );
  }
}