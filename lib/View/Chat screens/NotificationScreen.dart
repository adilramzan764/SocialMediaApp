
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/PicPost_Widget.dart';
import 'ModelNotification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  final List<NotificationModel> notifications = [
    NotificationModel(
      // name: 'Minha Anjum',
      notification: 'Minha Anjum @Arslan284 mentioned you in a post',
      hasMentioned: false,
      time: '2023-09-28 10:30:00', // Replace with your actual time
    ),
    NotificationModel(
      // name: 'Furqan26',
      notification: 'Furqan26 has accepted your request',
      isRequestAccepted: true,
      time: '2023-09-27 14:15:00', // Replace with your actual time
    ),
    NotificationModel(
      // name: 'Furqan26',
      notification: 'Furqan26 like your story',
      isRequestAccepted: true,
      time: '2023-09-27 14:15:00', // Replace with your actual time
    ),
    NotificationModel(
      // name: 'ZEESHAN',
      notification: 'zeeshan like your story',
      isRequestAccepted: true,
      time: '2023-10-27 14:15:00', // Replace with your actual time
    ),

    // Add more notifications here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 14,
                    ),
                  ),
                  Text(
                    "Notifications",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 40,width: 40,)
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Container(
                  // height: 110,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0 ||
                            !_isSameDay(
                                notifications[index - 1].time, notification.time))
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              _getFormattedDate(notification.time ?? ""),
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ListTile(
                          leading: ProfilePicWidget("assets/model1.jpg",40,40),
                          title: Text(""),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(notification.notification,style: TextStyle(fontSize: 12)),
                              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("+1 Mutual",style: TextStyle(fontSize: 12)),
                                  if (notification.isRequestAccepted) ...[
                                    Container(
                                      height: 25,
                                      width: 70,
                                      child: TextButton(
                                        onPressed: () {
                                          // Handle button click action here
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                        ),
                                        child: Text(
                                          notification.hasLiked ? "Reply" : "Message",
                                          style: TextStyle(color: Colors.white, fontSize: 8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                              Text("10 min ago",style:TextStyle(color: Color(0xff7F7F7F), fontSize: 10)),


                            ],

                          ),

                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  bool _isSameDay(String? date1, String? date2) {
    // Compare two dates to check if they are the same day
    // You can implement this logic based on your date format
    return date1 == date2;
  }

  String _getFormattedDate(String? time) {
    if (time == null) return '';

    final dateTime = DateTime.tryParse(time);
    if (dateTime == null) return ''; // Handle invalid date format

    final today = DateTime.now();

    if (_isSameDay(
        '${dateTime.year}-${dateTime.month}-${dateTime.day}',
        '${today.year}-${today.month}-${today.day}')) {
      return 'Today';
    } else if (_isSameDay(
        '${dateTime.year}-${dateTime.month}-${dateTime.day}',
        '${today.year}-${today.month}-${today.day - 1}')) {
      return 'Yesterday';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }

}

void main() {
  runApp(MaterialApp(
    home: NotificationScreen(),
  ));
}
