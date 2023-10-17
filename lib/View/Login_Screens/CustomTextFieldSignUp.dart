import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final validation;
  CustomTextField({
    this.validation,
    required this.hintText,
    required this.controller,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,

              ),
            ],
            color: const Color(0xffF0F3F6),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            border: Border.all(color: const Color(0xffF0F3F6)),
          ),
          child: TextFormField(
            validator: validation,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
              hintText: hintText,
              hintStyle:  TextStyle(
                color: Color(0xff707070),
                fontSize: 10,
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              // Remove border for read-only field

            ),
          ),
        ),
        // if (validator != null && validator!(controller.text) != null)
        //   Padding(
        //     padding: EdgeInsets.only(top: 5,left: 10),
        //     child: Text(
        //       validator!(controller.text)!, // Display the validation error text
        //       style: TextStyle(color: Colors.red,fontSize: 12),
        //
        //     ),
        //   ),
      ],
    );
  }
}
