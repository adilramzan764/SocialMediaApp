import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'PhoneTab.dart';


class ProfileChatScreen extends StatefulWidget {
  const ProfileChatScreen({Key? key}) : super(key: key);

  @override
  State<ProfileChatScreen> createState() => _ProfileChatScreenState();
}

class _ProfileChatScreenState extends State<ProfileChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: Get.height * 0.15,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
                Image.asset("assets/avatar.jpg"),
                Column(
                  children: [
                    SizedBox(height: Get.height * 0.05),
                    Text('Rana Zeeshan',
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                    SizedBox(height: Get.height * 0.005),
                    Text('Active 5 minutes ago',
                        style: TextStyle(color: Colors.black, fontSize: 8)),
                  ],
                ),
                // SizedBox(width:20),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset("assets/Bold-Delete.svg"))),
                // SizedBox(width: 10), // Adjust the width as needed
                IconButton(
                  onPressed: () {
                    // Show a dialog when the phone icon button is pressed
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: AlertDialog(
                            title: SvgPicture.asset("assets/dilog.svg"),
                            content: Text("       Top Up your account to make Calls ",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            actions: <Widget>[
                              SizedBox(height: 10),
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Get.to(() => PhoneTab());
                                  },
                                  child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2.5,
                                        ),
                                      ],
                                      color: Color(0xffAC83F6),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "   Top Up",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                           SvgPicture.asset("assets/Iconly-Light-Arrow - Right.svg",)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  icon: SvgPicture.asset("assets/phonebold.svg"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Today",
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2, // Number of chat messages
              itemBuilder: (BuildContext context, int index) {
                // You can use different logic to determine if the message is from the sender or receiver
                bool isSender = index % 2 == 0;

                return ListTile(
                  leading: isSender
                      ? Image.asset("assets/avatar.jpg")
                      : SizedBox(width: Get.width*0.1), // Empty space for receiver
                  trailing: isSender
                      ? SizedBox(width: Get.width*0.1) // Empty space for sender
                      : Image.asset("assets/avator1.jpg"),
                  title: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isSender ? Color(0XFF3EA7FF) : Color(0XFFAC83F6),
                      // Color for sender and receiver
                      borderRadius: isSender
                          ? BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )
                          : BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                    ),
                    child: Text(
                      'Lorem ipsum dolor sit amet, adipiscing elit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10 // Text color for sender and receiver
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
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Type your message",
                  hintStyle: TextStyle(
                    fontSize: 12,
                  ),
                  contentPadding: EdgeInsets.all(8),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     SvgPicture.asset("assets/Bold-Camera.svg"),

                      IconButton(
                        icon: SvgPicture.asset("assets/Bold-Voice 2.svg"),
                        onPressed: () {
                          // Handle voice icon tap
                        },
                      ),
                    ],
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topRight: Radius.circular(20)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
