import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReceiverMessage extends StatelessWidget {
  final String message;

  ReceiverMessage(this.message);

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
        child: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}