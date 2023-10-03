import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final Widget prefixIcon;
  final String hintText;
  final TextEditingController controller;
  final VoidCallback? onTap;

  CustomTextField({
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
        color: Color(0xffF0F3F6),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border: Border.all(color: Color(0xffF0F3F6)),
      ),
      child: TextFormField( // Use TextFormField instead of TextField
        controller: controller,
        decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30)),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)), // Remove border for read-only field
          prefixIcon: prefixIcon,
        ),
        onTap: onTap,
      ),
    );
  }
}
