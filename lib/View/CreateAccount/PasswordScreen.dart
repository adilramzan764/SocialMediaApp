import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:socialmediaapp/Utis/validations.dart';
import 'package:socialmediaapp/ViewModels/signUpViewModel.dart';

import 'PixkProfilePicture.dart';


class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}
class _PasswordScreenState extends State<PasswordScreen> {
  final registerVM = Get.put(RegisterViewModel()) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: [
          SizedBox(height: Get.height*0.1,),
          Align(alignment: Alignment.centerLeft,
              child: InkWell(onTap: () {
                Get.back();
              },
                  child: Icon(Icons.arrow_back_ios, size: 15,))),
          SizedBox(height: Get.height*0.02,),
          Align(alignment: Alignment.centerLeft,
              child: Text("  You'll need a Password",style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w400),)),
          SizedBox(height: Get.height*0.01,),
          Align(alignment: Alignment.centerLeft,
              child: Text("Make sure it's 8 character or more .",style: TextStyle(color: Colors.black,fontSize: 10),)),
          SizedBox(height: Get.height*0.06,),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1)]),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: Validations.validatePassword,
              controller: registerVM.passwordController.value,
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.7),
                    fontSize: 10,
                  ),
                  suffixIcon:Transform.scale(scale: 0.5,
                      child: SvgPicture.asset("assets/Show.svg")) ,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(30)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          SizedBox(
            height: Get.height * 0.09,
          ),
          TextButton(
            onPressed: () {
              Get.to(() => PickProfilePicture());
              // Get.to(() => BottomNavBarV2());
            },
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.8,
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
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
