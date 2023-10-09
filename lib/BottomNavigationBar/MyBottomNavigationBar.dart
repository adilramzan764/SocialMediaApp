import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socialmediaapp/Balance_Sheets/bottom%20navigation%20%20bar.dart';

import '../BottomBarScreens/Home/Home.dart';
import '../BottomNavigationBar/MyBottomNavigationBar.dart';
import '../Chat screens/CallBalance.dart';
import '../Chat screens/MainChatScreens.dart';
import 'BotttomBar_Widget.dart';


class BottomNavBarV2 extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<BottomNavBarV2> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Home(),
    MainChatScreens(),
    CallBalance(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: _screens[_currentIndex],
      bottomNavigationBar: _currentIndex != 0
          ? Padding(
        padding: const EdgeInsets.only(bottom: 20.0,left: 10,right: 10),
        child: CustomBottomNavigationBar(currentIndex: _currentIndex, onTap: (int ) {   setState(() {
          _currentIndex = int;
        }); },)
        ,
      )
          : SizedBox(),
    );
  }
}


// Container(
// height: 50, // Set your desired height here
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(32),
// boxShadow: [
// BoxShadow(
// color: Colors.grey,
// blurRadius: 2.5,
// ),
// ],
// color: Colors.white,
// ),
// child: ClipRRect(
// borderRadius: BorderRadius.circular(32),
// child: BottomNavigationBar(
// showSelectedLabels: false,
// showUnselectedLabels: false,
// selectedItemColor: Color(0xffAC83F6),
// selectedLabelStyle: TextStyle(fontSize: 0),
// currentIndex: _currentIndex,
// onTap: (int index) {
// setState(() {
// _currentIndex = index;
// });
// },
// items: [
// BottomNavigationBarItem(
// icon: Container(
// height: 35,width: 35,decoration: BoxDecoration(shape: BoxShape.circle,color: _currentIndex == 0? Color(0xffAC83F6).withOpacity(0.3):null),
// child: Center(
// child: SvgPicture.asset("assets/home.svg",color: _currentIndex == 0
// ? Color(0xffAC83F6)
//     : null,width: 20,height:20),
// ),
// ),
// label: '',
// ),
// BottomNavigationBarItem(
// icon: Container(
// height: 35,width: 35,decoration: BoxDecoration(shape: BoxShape.circle,color: _currentIndex == 1? Color(0xffAC83F6).withOpacity(0.3):null),
// child: Center(
// child: SvgPicture.asset("assets/Chat.svg",color: _currentIndex == 1
// ? Color(0xffAC83F6)
//     : null,width: 20,height:20),
// ),
// ),
// label: '',
// ),
// BottomNavigationBarItem(
// icon: Container(
// height: 35,width: 35,decoration: BoxDecoration(shape: BoxShape.circle,color: _currentIndex == 2? Color(0xffAC83F6).withOpacity(0.3):null),
// child: Center(
// child: SvgPicture.asset("assets/callto.svg",color: _currentIndex == 2
// ? Color(0xffAC83F6)
//     : null,width: 20,height:20),
// ),
// ),
// label: '',
// ),
// ],
// ),
// ),
// )




