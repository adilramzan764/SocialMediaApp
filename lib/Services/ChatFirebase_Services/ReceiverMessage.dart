import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ImageWidget.dart';

class ReceiverMessage extends StatelessWidget {
  final String message;
  final String imageUrl; // Add this property

  ReceiverMessage(this.message, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 5, bottom: 5, right: 80),
        decoration: BoxDecoration(
          color: Color(0XFFAC83F6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            ImageWidget(imageUrl), // Display the image using ImageWidget
          ],
        ),
      ),
    );
  }
}
