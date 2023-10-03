import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Balance_Sheets/Payment Method.dart';
import '../Settings/Setting_Privacy.dart';
import 'CallHistory.dart';

class CallBalance extends StatefulWidget {
  const CallBalance({Key? key}) : super(key: key);

  @override
  State<CallBalance> createState() => _CallBalanceState();
}

class _CallBalanceState extends State<CallBalance> {
  List<String> chatHistory = [
    "Minha Anjum",
    "Farhan Arif",
    "Aniqa Sulman",
    "Farhan Arif",
    "Aniqa Sulman",
    "Aniqa Sulman",
  ]; // List to store chat history items
  List<String> profileImages = [
    "assets/profile1.png",
    "assets/profile2.png",
    "assets/profile3.png",
    "assets/profile4.png",
    "assets/profile3.png",
    "assets/profile3.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          Container(
            height: 80,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 14,
                  ),
                ),
                 Text(
                    "Call",
                    style: TextStyle(color: Colors.black),
                  ),

                IconButton(
                  onPressed: () {
                    Get.to(()=>CallHistory());
                  },
                  icon: Image.asset("assets/history.png")
                ),
                
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Align(alignment: Alignment.topLeft,
                child: Text("Current Balance",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),)),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: 90,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration( color: Color(0xff3EA7FF),
                  borderRadius: BorderRadius.circular(20)),

              child: ListTile(
                dense: true,
                leading: SvgPicture.asset("assets/increase-up-profit-icon.svg"),
                title: Text(
                  "2.71%",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '21,554.80\$',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                trailing: Image.asset(
                  "assets/Group 10492.png",
                  fit: BoxFit.cover,
                  width: 50,
                  height: 150,
                ),
                onTap: () {},
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextButton(
              onPressed: () {
                // Get.to(()=>PaymentMethod());
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width/1.4,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.5,
                    ),
                  ],
                  color: Color(0xffAC83F6),
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "      Top Up",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      IconButton(onPressed: () {
                        // Get.to(()=>PaymentMethod());
                      }, icon: Image.asset("assets/Arrow - Right.png")),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("Make Calls",style: TextStyle( color: Colors.black,fontWeight: FontWeight.w400)),
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemCount: chatHistory.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    chatHistory[index],
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  leading: Image.asset(profileImages[index]), // Use the corresponding profile image for each chat item
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: Image.asset("assets/IconCall.png"),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              // Your onPressed logic here
            },
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.5,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      // Get.to(()=>CallBalance());
                    },
                    icon: Image.asset("assets/Home.png"),
                  ),
                  IconButton(
                    onPressed: () {
                      // Get.to(()=>ProfileChatScreen());
                    },
                    icon: Image.asset("assets/simpleChat.png"),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(()=>SettingPrivacy());
                    },
                    icon: Image.asset("assets/Call.png",color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
