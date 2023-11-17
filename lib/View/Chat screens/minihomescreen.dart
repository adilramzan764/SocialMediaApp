import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth if not imported
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../Controllers/GetuserdataDataController.dart';
import 'ChatRoomScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with WidgetsBindingObserver{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore =FirebaseFirestore.instance;
  late Map<String, dynamic> userMap = {};
  bool isloading = false;
  final TextEditingController _search = TextEditingController();
  GetUserDataController getUserDataController =
  Get.put(GetUserDataController());


  @override
  void initState (){
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setStatus("Online");
  }
  void setStatus(String status) async{
    await _firestore.collection("users").doc(_auth.currentUser?.uid).update({
      "status":status,
    });
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    if(state ==AppLifecycleState.resumed){
//online
      setStatus("Online");
    }else {
      //offline
      setStatus("Offine");
    }
  }


  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  Future<void> onSearch() async {
    try {
      setState(() {
        isloading = true;
      });

      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection("users")
          .where("email", isEqualTo: _search.text)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          userMap = querySnapshot.docs[0].data() ?? {}; // Check for null
          isloading = false;
        });

        // Update status
        setStatus("Online");

        print("UserMap: $userMap");
      } else {
        setState(() {
          userMap = {}; // No matching user found
          isloading = false;
        });
        print("No user found");
      }
    } catch (e) {
      setState(() {
        userMap = {}; // Handle the error case
        isloading = false;
      });
      print("Error: $e");
    }
  }



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Email Account"),
      ),
      body: isloading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Column(
        children: [
          SizedBox(
            height: size.height / 20,
          ),
          Center(
            child: Container(
              height: size.height / 14,
              width: size.width / 1.15,
              child: TextField(
                controller: _search,
                decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height / 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: onSearch,
            child: Text(
              "Search",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: size.height / 20),
          userMap != null
              ? ListTile(
            onTap: () {
              if (userMap != null &&
                  userMap["name"] != null &&
                  userMap["email"] != null) {
                String roomId = chatRoomId(
                    getUserDataController.getUserDataRxModel.value!.name,
                    userMap["name"] ?? "N/A");


                log(roomId);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatRoom(
                      chatRoomId: roomId,
                      userMap: userMap,
                    ),
                  ),
                );
              } else {
                // Handle the case where required fields are missing or null
                print("User data is incomplete");
              }
            },

            leading: CircleAvatar(
              backgroundImage: NetworkImage(userMap["photoUrl"] ?? ""),
            ),
            title: Text(userMap["name"] ?? "N/A",
                style:  TextStyle(color: Colors.black)),
            subtitle: Text(userMap["email"] ?? "N/A",
                style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.chat, color: Colors.black),
          )
              : Container(),

        ],
      ),
      floatingActionButton:FloatingActionButton(
        child:  Icon(Icons.group),
        onPressed: () {

        },
      ) ,
    );
  }
}
