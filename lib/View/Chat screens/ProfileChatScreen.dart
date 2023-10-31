import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controllers/ProfileChatCamera.dart';
import '../../Services/ChatFirebase_Services/ChatMessage_Model.dart';
import '../../Services/ChatFirebase_Services/Firebase_Service.dart';
import '../../Services/ChatFirebase_Services/ImageWidget.dart';
import '../../Services/ChatFirebase_Services/ReceiverMessage.dart';
import '../../Services/ChatFirebase_Services/SenderMessage.dart';
import 'PhoneTab.dart';


class ProfileChatScreen extends StatefulWidget {
  final String userId;
  final String receiverId;

  const ProfileChatScreen({Key? key, required this.userId, required this.receiverId}) : super(key: key);



  @override
  State<ProfileChatScreen> createState() => _ProfileChatScreenState();
}

class _ProfileChatScreenState extends State<ProfileChatScreen> {
  final FirebaseService _firebaseService = FirebaseService();


  Stream<List<Message>> getMessageStream(String userId) {
    return FirebaseFirestore.instance
        .collection('messages')
        .where('participants', arrayContains: userId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      List<Message> messages = [];
      snapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        // Retrieve imageUrl from the data
        String imageUrl = data['imageUrl'] ?? ''; // Use the actual field name from your Firestore document

        messages.add(Message(
          id: doc.id,
          senderId: data['senderId'],
          receiverId: data['receiverId'],
          content: data['content'],
          timestamp: data['timestamp'].toDate(),
          imageUrl: imageUrl,
        ));
      });
      return messages;
    });
  }



  late Future<CameraController> _controllerFuture;
  late CameraController _controller;
  TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];

  @override
  void initState() {
    super.initState();
    _controllerFuture = _initializeCameraController();
  }

  Future<CameraController> _initializeCameraController() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.medium);
    await _controller.initialize();
    return _controller;
  }

  void _onCapturePressed(String imagePath) {
    // Handle the captured image path here, for example, upload to Firebase Storage
    _uploadImageToFirebaseStorage(imagePath);
  }


  void _uploadImageToFirebaseStorage(String imagePath) async {
    try {
      File imageFile = File(imagePath);

      // Reference to Firebase Storage
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      // Upload the image to Firebase Storage
      UploadTask uploadTask = storageReference.putFile(imageFile);

      // Wait for the upload to complete
      await uploadTask.whenComplete(() {
        print('Image uploaded to Firebase Storage'); // Print this message after successful upload
      });
    } catch (e) {
      print("Error occurred while uploading photo to Firebase Storage: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error uploading photo to Firebase Storage. Please try again.'),
      ));
    }
  }




  void _sendMessage(String message) {
    if (message.trim().isNotEmpty) {
      // Update local list with sent message
      setState(() {
        _messages.add(message);
      });

      // Send message to Firebase
      _firebaseService.sendMessage(
        widget.userId,
        widget.receiverId,
        message,
      );

      // Clear the message input field
      _messageController.clear();
    }
  }


  @override
  Widget build(BuildContext context) {
    String userId = widget.userId;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0), // here the desired height
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
                // Added spacing between back button and profile image
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/model1.jpg"),
                ),
                SizedBox(width: 12),
                // Added spacing between profile image and text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [SizedBox(height: Get.height * 0.025,),
                    Text(
                      'Rana Zeeshan',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(height: Get.height * 0.008,),
                    Text(
                      'Active 5 minutes ago',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 8),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                // Expanded to push icons to the right
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Show a dialog when the phone icon button is pressed
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25
                                  ), // Set circular border radius here
                                ),
                                title: SvgPicture.asset("assets/dilog.svg"),
                                content: Text(
                                    "       Top Up your account to make Calls ",
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
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width / 2.5,
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
                                                SvgPicture.asset(
                                                  "assets/Iconly-Light-Arrow - Right.svg",)
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
                      icon: Transform.scale(scale: 0.7,
                          child: SvgPicture.asset(
                              "assets/Call.svg", color: Color(0XFF3EA7FF))),
                    ),
                    IconButton(
                      onPressed: () {
                        // Show a dialog when the video icon button is pressed
                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     // Your dialog content here
                        //   },
                        // );
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
            SizedBox(height: 10,),
            Text(
              "Today",
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: StreamBuilder<List<Message>>(
                stream: _firebaseService.getMessageStream(widget.userId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No Messages'));
                  } else {
                    List<Message> messages = snapshot.data!;
                    return ListView.builder(
                      reverse: true, // Yeh property list ko reverse order mein display karega
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        Message message = messages[index];
                        bool isSender = message.senderId == userId;
                        return isSender
                            ? SenderMessage(message.content)
                            : Column(
                          children: [
                            ReceiverMessage(message.content, message.imageUrl),
                            ImageWidget(message.imageUrl),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 45,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                ),
                child: FutureBuilder<CameraController>(
                  future: _controllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      final controller = snapshot.data!;
                      return TextField(
                        controller: _messageController,
                        onChanged: (text) {
                          // Update the controller's value as text changes
                          _messageController.text = text;
                        },
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
                                onPressed: ()async {
                                  final imagePath = await Navigator.push<String>(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CameraScreen(_controller),
                                    ),
                                  );
                                  if (imagePath != null) {
                                    _onCapturePressed(imagePath);
                                  }
                                },
                              ),
                              IconButton(
                                icon: SvgPicture.asset(
                                    "assets/Bold-Voice 2.svg"),
                                onPressed: () {
                                  // Handle voice icon tap
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  _sendMessage(_messageController.text);
                                },
                                child: Icon(Icons.send),
                              )

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
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

}



