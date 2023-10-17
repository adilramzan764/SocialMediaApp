import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialmediaapp/Services/authServices.dart';
import 'package:socialmediaapp/Utis/utils.dart';
import 'package:socialmediaapp/Widgets/CustomDialog.dart';

class RegisterViewModel extends GetxController {

  GlobalKey<FormState>  globalKey=GlobalKey<FormState>();
  final nameController = TextEditingController().obs ;
  final emailController = TextEditingController().obs ;
  final dobController = TextEditingController().obs ;
  final userNameController = TextEditingController().obs ;
  final passwordController = TextEditingController().obs ;
  final Rx<FileImage> photoUrl = FileImage(File("")).obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final nameFocusNode = FocusNode().obs;
  final userNameFocusNode = FocusNode().obs;
  final dobFocusNode = FocusNode().obs;
  RxBool loading = false.obs;
  AuthService auth = AuthService();
  bool validate = false;


  void signUp()async{
    loading.value = true ;
    FormState form = globalKey.currentState!;
    form.save();
    if (!form.validate()) {
      validate = false;
      Utils.snackBar('Signup',"Please fix the errors in red before submitting.");
    }
    else{
      bool success = await auth.createUser(
          name: nameController.value.text,
          email: emailController.value.text,
          password: passwordController.value.text,
          dob: dobController.value.text,
          userName: userNameController.value.text,
          photoUrl: photoUrl.value.file.path.toString()
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
}