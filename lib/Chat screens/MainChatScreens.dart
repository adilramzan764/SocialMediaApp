import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'CallBalance.dart';
import 'NotificationScreen.dart';
import 'ProfileChatScreen.dart';

class MainChatScreens extends StatefulWidget {
  @override
  State<MainChatScreens> createState() => _MainChatScreensState();
}

class _MainChatScreensState extends State<MainChatScreens> {
  // Sample data
  final List<Map<String, dynamic>> data = [
    {
      'image': 'assets/SMALLPROFILE.png',
      'name': 'Anna Bella',
      'description': 'Great! Thank you soo much',
      'time': '11:54 PM',
      'messages': '1',
    },
    {
      'image': 'assets/profileboy.png',
      'name': 'Zeeshan',
      'description': "Hey! Bro what's Going on",
      'time': '11:54 PM',
      'messages': '2',
    },
    {
      'image': 'assets/smallmen.png',
      'name': 'Zeeshan',
      'description': "Great! Thank you soo much",
      'time': '11:54 PM',
      'messages': '2',
    },
    {
      'image': 'assets/smalllarka.png',
      'name': 'Zeeshan',
      'description': "Hey! Bro what's Going on",
      'time': '11:54 PM',
      'messages': '2',
    },
    {
      'image': 'assets/smallyoung.png',
      'name': 'Zeeshan',
      'description': "Great! Thank you soo much",
      'time': '11:54 PM',
      'messages': '2',
    },
    {
      'image': 'assets/profileboy.png',
      'name': 'Zeeshan',
      'description': "Hey! Bro what's Going on",
      'time': '11:54 PM',
      'messages': '2',
    },

    // Add more data items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 0.5)
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.06),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios,
                          color: Colors.black, size: 16),
                    ),
                    Image.asset("assets/SMALLPROFILE.png"),
                    SizedBox(width: 5),
                    Text(
                      "   Anna Bella",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 1)
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search here",
                          hintStyle:
                          TextStyle(color: Color(0xffD8D8D8), fontSize: 12),
                          contentPadding: EdgeInsets.all(8),
                          prefixIcon: Transform.scale(
                            scale: 0.3,
                            child: SvgPicture.asset('assets/Bulk-Search.svg'),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(30)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileChatScreen()),
                      );
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1,
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: ListTile(
                        leading: Image.asset(data[index]['image']),
                        title: Text(data[index]['name'],
                            style:
                            TextStyle(fontSize: 12, color: Colors.black)),
                        subtitle: Text(data[index]['description'],
                            style: TextStyle(color: Colors.black, fontSize: 9)),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(data[index]['time'],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 9)),
                            Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                    child: Text(data[index]['messages'],
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black)))),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // TextButton(
          //   onPressed: () {
          //     // Your onPressed logic here
          //   },
          //   child: Container(
          //     height: 40,
          //     width: MediaQuery.of(context).size.width,
          //     decoration: BoxDecoration(
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey,
          //           blurRadius: 2.5,
          //         ),
          //       ],
          //       color: Colors.white,
          //       borderRadius: BorderRadius.all(Radius.circular(20)),
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         IconButton(
          //           onPressed: () {
          //             Get.to(() => NotificationScreen());
          //           },
          //           icon: Image.asset("assets/Home.png"),
          //         ),
          //         IconButton(
          //           onPressed: () {
          //             // Navigator.push(
          //             //   context,
          //             //   MaterialPageRoute(builder: (context) => ProfileChatScreen()),
          //             // );
          //           },
          //           icon: Image.asset("assets/colorchat.png"),
          //         ),
          //         IconButton(
          //           onPressed: () {
          //             Get.to(() => CallBalance());
          //           },
          //           icon: Image.asset("assets/Call.png"),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}