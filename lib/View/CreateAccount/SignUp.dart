import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../StarterScreens/ContinueWithGoogle.dart';
import '../Login_Screens/CustomTextFieldSignUp.dart';
import '../Login_Screens/Sign_In.dart';
import 'VerificationCode.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController datename = TextEditingController();
  DateTime? _selectedDate; // Store the selected date
GlobalKey<FormState>  _globalKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Form(key: _globalKey,
            child: Column(
              children: [    SizedBox(
                height: Get.height * 0.08,
              ),
                Align(alignment: Alignment.centerLeft,
                  child: InkWell(onTap: () {
                    Navigator.pop(context);
                  },
                      child: Icon(Icons.arrow_back_ios_new,size: 15,))
                ),
                SizedBox(
                  height: Get.height*0.01,
                ),

                Center(
                  child: SvgPicture.asset(
                    "assets/signup.svg",

                  ),
                ),
                SizedBox(
                  height: Get.height * 0.06,
                ),
                Align(alignment: Alignment.centerLeft,
                  child: Text(
                    'Create your account',
                    style: TextStyle(
                      color: Colors.black,fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height*0.02,
                ),
                CustomTextField(

                  hintText: "   Name",
                  controller: firstname,
                ),
                SizedBox(
                  height: Get.height*0.02,
                ),
                CustomTextField(

                  hintText: "   Phone number or Email address",
                  controller: phonenumber,
                ),

                SizedBox(
                  height: Get.height*0.02,
                ),
                CustomTextField(

                  hintText: "   Date of birth",
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
                  height: Get.height*0.07,
                ),
                TextButton(
                  onPressed: () {
                   
                    Get.to(VerificationCode());
                  },
                  child: Container(
                    height: 40,
                    width:  MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.5,
                        ),
                      ],
                      color: Color(0xffAC83F6),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Center(
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}