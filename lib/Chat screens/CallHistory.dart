import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallHistory extends StatefulWidget {
  const CallHistory({Key? key}) : super(key: key);

  @override
  State<CallHistory> createState() => _CallHistoryState();
}

class _CallHistoryState extends State<CallHistory> {
  List<String> chatHistory = [
    "Chat Item 1",
    "Chat Item 2",
    "Chat Item 3",
  ]; // List to store chat history items

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
                    size: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 110.0),
                  child: Text(
                    "Call history",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
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
                  subtitle: Text(
                    "10 min ago",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  leading: Image.asset("assets/callprofile.png"),
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: Image.asset("assets/IconCall.png"),
                  ),
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}
