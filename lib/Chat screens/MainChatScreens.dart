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
  final List<Map<String, dynamic>> data = [
    {
      'image': 'assets/model2.jpg',
      'name': 'Anna Bella',
      'description': 'Great! Thank you soo much',
      'time': '11:54 PM',
      'messages': '1',
    },
    {
      'image': 'assets/model2.jpg',
      'name': 'Zeeshan',
      'description': "Hey! Bro what's Going on",
      'time': '11:54 PM',
      'messages': '2',
    },
    {
      'image': 'assets/model3.jpg',
      'name': 'Zeeshan',
      'description': "Great! Thank you soo much",
      'time': '11:54 PM',
      'messages': '2',
    },
    {
      'image': 'assets/h1.jpg',
      'name': 'Imran',
      'description': "Hey! Bro what's Going on",
      'time': '11:54 PM',
      'messages': '2',
    },
    {
      'image': 'assets/h3.jpg',
      'name': 'Usman',
      'description': "Great! Thank you soo much",
      'time': '11:54 PM',
      'messages': '2',
    },
    // Add more data items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2), spreadRadius: 0.5)
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
                        SvgPicture.asset("assets/1.svg"),
                        SizedBox(width: 5),
                        Text(
                          "   Anna Bella",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        SizedBox(
                          width: Get.width * 0.35,
                        ),
                        Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                            child: Text("Calls",
                                style: TextStyle(color: Color(0xffAC83F6))),
                          ),
                        )
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
                              hintStyle: TextStyle(
                                  color: Color(0xffD8D8D8), fontSize: 12),
                              contentPadding: EdgeInsets.all(8),
                              prefixIcon: Transform.scale(
                                scale: 0.3,
                                child: SvgPicture.asset('assets/search.svg',
                                    color: Colors.grey.withOpacity(0.5)),
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
                            leading: Container(
                              height: Get.height*0.10,
                              width: Get.width*0.10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Color(0xffAC83F6)),
                                  image: DecorationImage(
                                      image: AssetImage(data[index]["image"]),fit: BoxFit.cover
                                  )),
                            ),
                            title: Text(data[index]['name'],
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            subtitle: Text(data[index]['description'],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 9)),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(data[index]['time'],
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 9)),
                                SizedBox(
                                  height: Get.height * 0.003,
                                ),
                                Container(
                                    height: 16,
                                    width: 16,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Center(
                                        child: Text(data[index]['messages'],
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white)))),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
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
                // Handle FAB tap event
              },
              child: Icon(Icons.add,size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
