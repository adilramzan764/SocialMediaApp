import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'CustomTextFieldSignUp.dart';
import 'Sign_In.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController Idnumber = TextEditingController();
  final TextEditingController passwordname = TextEditingController();
  DateTime? _selectedDate; // Store the selected date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/Group 12241.png",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                prefixIcon: Transform.scale(
                  scale: 0.4,
                  child: SvgPicture.asset('assets/Iconly-Bulk-Profile.svg'),
                ),
                hintText: "Muniba Imtiaz",
                controller: firstname,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                prefixIcon: Transform.scale(
                  scale: 0.4,
                  child: SvgPicture.asset('assets/Iconly-Bulk-Message.svg'),
                ),
                hintText: "F2021218054",
                controller: Idnumber,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                prefixIcon: Transform.scale(
                  scale: 0.4,
                  child: SvgPicture.asset('assets/Lock.svg'),
                ),
                hintText: '........',
                controller: passwordname,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                prefixIcon: Transform.scale(
                  scale: 0.4,
                  child: SvgPicture.asset('assets/Iconly-Bold-Calendar.svg'),
                ),
                hintText: "date",
                controller: TextEditingController(
                  text: _selectedDate != null
                      ? "${_selectedDate?.day}-${_selectedDate?.month}-${_selectedDate?.year}"
                      : "",
                ),
                onTap: () async {
                  DateTime initialDate = _selectedDate ?? DateTime.now();
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: initialDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          primaryColor: Colors.blue,
                          colorScheme: ColorScheme.light(primary: Colors.blue),
                          buttonTheme: ButtonThemeData(
                            textTheme: ButtonTextTheme.primary,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedDate != null && pickedDate != _selectedDate) {
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                prefixIcon: Transform.scale(
                  scale: 0.4,
                  child: SvgPicture.asset('assets/Iconly-Bulk-Profile.svg'),
                ),
                hintText: "About Yourself",
                controller: TextEditingController(),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Handle sign-up logic
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.5,
                      ),
                    ],
                    color: Color(0xffAC83F6),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle login navigation
                    },
                    child: Text(
                      'Already have an account?',
                      style: TextStyle(color: Color(0xff707070)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                     Get.to(()=>SignIn());
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
