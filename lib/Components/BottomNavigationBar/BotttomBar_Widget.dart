import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.07, // Set your desired height here
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
          selectedItemColor: Color(0xffAC83F6),
          selectedLabelStyle: TextStyle(fontSize: 0),
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            _buildNavItem("assets/home.svg", currentIndex, 0),
            _buildNavItem("assets/Chat.svg", currentIndex, 1),
            _buildNavItem("assets/callto.svg", currentIndex, 2),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(String iconPath, int currentIndex, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentIndex == index ? Color(0xffAC83F6).withOpacity(0.3) : null,
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            color: currentIndex == index ? Color(0xffAC83F6) : null,
            width: 20,
            height: 20,
          ),
        ),
      ),
      label: '',
    );
  }
}