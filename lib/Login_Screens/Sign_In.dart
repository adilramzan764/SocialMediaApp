import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:socialmediaapp/BottomBarScreens/Profile/Profile%20Edit/Profile_Edit.dart';

import '../Balance_Sheets/bottom navigation  bar.dart';
import 'SignUp.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/Group 498.png",
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(height: 40,width:MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 2)
                    ]),

                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Student I'D  number",hintStyle: TextStyle(fontSize: 12,),
                      contentPadding: EdgeInsets.all(10),
                      prefixIcon: Transform.scale(scale: 0.6,
                          child: SvgPicture.asset('assets/Iconly-Bulk-Message.svg',)),
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
                height: 15,
              ),
              Container(height: 40,width:MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 2)
                    ]),

                child: TextField(
                  decoration: InputDecoration(
                      hintText: ".......",hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      contentPadding: EdgeInsets.all(10),
                      prefixIcon: Transform.scale(scale: 0.6,
                          child: SvgPicture.asset('assets/Lock.svg',)),
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
              Align(alignment: Alignment.topRight,
                child: TextButton(onPressed: (){
                  // Get.to(()=>RecoverPassword());
                }, child: Text('Forgot Password',style: TextStyle(color: Color(0xff707070),fontSize: 12),)),
              ),

              SizedBox(height: 10,),
              TextButton(
                onPressed: () {
                  Get.to(()=>BottomNavBarV2());
                },

                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
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
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Color(0xff707070),
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("OR"),
                  ),
                  Expanded(
                    child: Divider(
                      color: Color(0xff707070),
                      thickness: 1,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 5,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){
                    Get.to(()=>SignUp());
                  }, child: Text('Create new Account?',style: TextStyle(color: Colors.black),)),
                  TextButton(onPressed: (){
                    Get.to(()=>SignUp());
                  }, child: Text('Sign up',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}