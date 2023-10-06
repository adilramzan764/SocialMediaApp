import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/MyTabBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {

                },
                icon: SvgPicture.asset('assets/profile.svg',
                    color: Colors.black),
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
                    onPressed: () {},
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
          MyTabBar()
        ],
      ),
    );
  }
}
