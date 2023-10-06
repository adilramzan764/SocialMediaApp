

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Balance_Sheets/CurrentBalance.dart';
import '../BottomBarScreens/Home/Home.dart';
import '../BottomBarScreens/Profile/Profile.dart';
import '../Chat screens/BottomNavigationBar_Chat.dart';
import '../CreatePost/UploadFeed_Dialog.dart';

class BottomNavBarV2 extends StatefulWidget {
  @override
  _BottomNavBarV2State createState() => _BottomNavBarV2State();
}

class _BottomNavBarV2State extends State<BottomNavBarV2> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          if (currentIndex == 0) Home(),
          if (currentIndex == 1) MyBottomNavigation_Chat(),
          if (currentIndex == 2) CurrentBalance(),

          if (currentIndex == 3) Profile(otherUserProfile: false,),
          if(currentIndex!=1)
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: 70,
                child: Stack(
                  // overflow: Overflow.visible,
                  children: [
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: BNBCustomPainter(),
                    ),
                    Center(
                      widthFactor: 7,
                      heightFactor: 0.5,
                      child: FloatingActionButton(
                        backgroundColor: Colors.blue,
                        child: Icon(
                          CupertinoIcons.add,
                          color: Colors.white,
                        ),
                        shape: CircleBorder(),
                        // Use CircleBorder to make it circular
                        elevation: 0.1,
                        onPressed: () async {
                          await showDialog<String>(
                            context: context,
                            builder: (BuildContext context) {
                              return UploadFedd_Dialog();
                            },
                          );                      },
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: SvgPicture.asset('assets/home.svg',
                                color:
                                currentIndex == 0 ? Color(0xff3EA7FF) : null),
                            onPressed: () {
                              setBottomBarIndex(0);
                            },
                            splashColor: Colors.white,
                          ),
                          IconButton(
                              icon: SvgPicture.asset('assets/Chat.svg',
                                  color: currentIndex == 1
                                      ? Color(0xff3EA7FF)
                                      : null),

                              // Icon(
                              //   Icons.restaurant_menu,
                              //   color: currentIndex == 1 ? Colors.orange : Colors.grey.shade400,
                              // ),
                              onPressed: () {
                                setBottomBarIndex(1);
                              }),
                          Container(
                            width: size.width * 0.20,
                          ),
                          IconButton(
                              icon: SvgPicture.asset('assets/wallet.svg',
                                  color: currentIndex == 2
                                      ? Color(0xff3EA7FF)
                                      : null),
                              onPressed: () {
                                setBottomBarIndex(2);
                              }),
                          IconButton(
                              icon: SvgPicture.asset('assets/profile.svg',
                                  color: currentIndex == 3
                                      ? Color(0xff3EA7FF)
                                      : null),
                              onPressed: () {
                                setBottomBarIndex(3);
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.55, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.55, 0, size.width * 0.60, 0);
    path.quadraticBezierTo(size.width * 0.75, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}