import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
            children: [ SizedBox(
              height: Get.height*0.1,
            ),
              Center(
                child: SvgPicture.asset(
                  "assets/signin.svg",height: 170,width: 170,
                ),
              ),
              SizedBox(
                height: Get.height*0.01,
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
                height: Get.height*0.02,
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
                      prefixIcon: Transform.scale(scale: 0.35,
                          child: SvgPicture.asset('assets/Iconly-Bulk-Message.svg',)),
                      contentPadding: EdgeInsets.all(8),
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
                height: Get.height*0.02,
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
                      hintText: "Enter Phone number",hintStyle: TextStyle(fontSize: 12,),
                      contentPadding: EdgeInsets.all(10),
                      prefixIcon: Transform.scale(scale: 0.35,
                          child: SvgPicture.asset('assets/Bold-Call.svg',)),
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
                height: Get.height*0.02,
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
                      hintText: ".......",hintStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                      contentPadding: EdgeInsets.all(10),
                      prefixIcon: Transform.scale(scale: 0.35,
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
              SizedBox(
                height: Get.height*0.01,
              ),
              Align(alignment: Alignment.topRight,
                child: InkWell(onTap: () {

                },
                    child: Text('Forget Password',style: TextStyle(color: Color(0xff707070),fontSize: 12),)),
              ),
              SizedBox(
                height: Get.height*0.01,
              ),

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
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height*0.01,
              ),
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
                    child: Text("OR",style: TextStyle(color: Color(0xff707070),fontSize: 12)),
                  ),
                  Expanded(
                    child: Divider(
                      color: Color(0xff707070),
                      thickness: 1,
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: Get.height*0.0025,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){
                    Get.to(()=>SignUp());
                  }, child: Text('Create new Account?',style: TextStyle(color: Color(0xff707070),fontSize: 12),)),
                  InkWell(onTap: () {
Get.to(()=>SignUp());
                  },
                      child: Text('Sign up',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}