import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Controllers/ProfileChatCamera.dart';
import '../../Services/ChatFirebase_Services/ChatMessage_Model.dart';
import '../../Services/ChatFirebase_Services/Firebase_Service.dart';
import '../../Services/ChatFirebase_Services/ImageWidget.dart';
import '../../Services/ChatFirebase_Services/ReceiverMessage.dart';
import '../../Services/ChatFirebase_Services/SenderMessage.dart';
import 'PhoneTab.dart';

class ProfileChatScreen extends StatefulWidget {
  final String userId;

  const ProfileChatScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<ProfileChatScreen> createState() => _ProfileChatScreenState();
}

class _ProfileChatScreenState extends State<ProfileChatScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize your variables or resources here if needed
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
                SizedBox(width: 6),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/model1.jpg"),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.025),
                    Text(
                      'Rana Zeeshan',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(height: Get.height * 0.008),
                    Text(
                      'Active 5 minutes ago',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 8),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Handle phone icon tap
                        // Add your phone functionality here
                      },
                      icon: Transform.scale(
                          scale: 0.7,
                          child: SvgPicture.asset(
                              "assets/Call.svg", color: Color(0XFF3EA7FF))),
                    ),
                    IconButton(
                      onPressed: () {
                        // Handle video icon tap
                        // Add your video functionality here
                      },
                      icon: Icon(Icons.videocam_rounded, color: Colors.blue),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            Text(
              "Today",
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            SizedBox(
              height: 10,
            ),
            // Add your message list widget here
            // For example, you can use ListView.builder to display messages
            Expanded(
              child: ListView.builder(
                itemCount: /* Your message count */ 0,
                itemBuilder: (context, index) {
                  // Return your message widgets based on index
                  // You can create SenderMessage and ReceiverMessage widgets
                  // based on the message type and return them here
                  return /* Your message widget */;
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                ),
                child: TextField(
                  // Add your text input controller here
                  // controller: yourTextController,
                  decoration: InputDecoration(
                    hintText: "Type your message",
                    hintStyle: TextStyle(
                      fontSize: 12,
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset("assets/Bold-Camera.svg"),
                          onPressed: () {
                            // Handle camera icon tap
                            // Add your camera functionality here
                          },
                        ),
                        IconButton(
                          icon: SvgPicture.asset("assets/Bold-Voice 2.svg"),
                          onPressed: () {
                            // Handle voice icon tap
                            // Add your voice functionality here
                          },
                        ),
                        InkWell(
                          onTap: () {
                            // Handle send button tap
                            // Add your send functionality here
                          },
                          child: Icon(Icons.send),
                        ),
                      ],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
