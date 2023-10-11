import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Widget prefixIcon;
  final String hintText;
  final TextEditingController controller;
  final VoidCallback? onTap;
  String? Function(String?)? validator;

  CustomTextField({
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    this.onTap,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
            color: const Color(0xffF0F3F6),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            border: Border.all(color: const Color(0xffF0F3F6)),
          ),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              // Remove border for read-only field
              prefixIcon: prefixIcon,
            ),
            validator: validator,
            onTap: onTap,
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
