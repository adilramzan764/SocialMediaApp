import 'dart:ffi';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:socialmediaapp/Utis/validations.dart';
import 'package:socialmediaapp/View/CreateAccount/PasswordScreen.dart';
import 'package:socialmediaapp/ViewModels/signUpViewModel.dart';

import '../StarterScreens/ContinueWithGoogle.dart';
import '../Login_Screens/CustomTextFieldSignUp.dart';
import '../Login_Screens/Sign_In.dart';
import 'VerificationCode.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final registerVM = Get.put(RegisterViewModel()) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Form(key: registerVM.globalKey,
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
                  validation: Validations.validateName,
                  hintText: " Name",
                  controller: registerVM.nameController.value,
                ),
                SizedBox(
                  height: Get.height*0.02,
                ),
                CustomTextField(
                  validation: Validations.validateEmail,
                  hintText: " Phone number or Email address",
                  controller: registerVM.emailController.value,
                ),

                SizedBox(
                  height: Get.height*0.02,
                ),
                CustomTextField(
                  hintText: " Date of birth",
                  controller: registerVM.dobController.value,
                ),

                SizedBox(
                  height: Get.height*0.07,
                ),

                TextButton(
                  onPressed: () {

                    Get.to(PasswordScreen());
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