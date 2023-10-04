import 'package:flutter/material.dart';

import '../BottomNavigationBar/MyBottomNavigationBar.dart';
import 'CallBalance.dart';
import 'MainChatScreens.dart';

class MyBottomNavigation_Chat extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigation_Chat> {
  int _currentIndex = 1;

  final List<Widget> _screens = [
    BottomNavBarV2(),
    MainChatScreens(),
    CallBalance(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_currentIndex],
      bottomNavigationBar: _currentIndex != 0
          ? Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
// height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.5,
              ),
            ],
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: _currentIndex,
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset("assets/Home.png"),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/colorchat.png"),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/Call.png"),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      )
          : SizedBox(),
    );
  }
}






