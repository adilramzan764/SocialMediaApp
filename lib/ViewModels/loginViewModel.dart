import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialmediaapp/Services/authServices.dart';
import 'package:socialmediaapp/Utis/utils.dart';
import 'package:socialmediaapp/Widgets/CustomDialog.dart';

class LoginViewModel extends GetxController {

  GlobalKey<FormState>  globalKey=GlobalKey<FormState>();
  final emailController = TextEditingController().obs ;
  final passwordController = TextEditingController().obs ;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  AuthService auth = AuthService();
  bool validate = false;


  void LogIn()async{
    loading.value = true ;
    bool success = await auth.loginUser(
      email: emailController.value.text,
      password: passwordController.value.text,

    );
    if(success==true){
      print("Hello to the new Screen");
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ContactsPermission(),
      //   ),
      // );
    }
    else{
      Utils.snackBar('Signup',"Please fix the errors in red before submitting.");
    }

  }
}