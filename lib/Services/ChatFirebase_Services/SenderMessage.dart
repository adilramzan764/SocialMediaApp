import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SenderMessage extends StatelessWidget {
  final String message;

  SenderMessage(this.message);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 5, bottom: 5, left: 80),
        decoration: BoxDecoration(
          color: Color(0XFF3EA7FF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}