import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Components/BottomNavigationBar/MyBottomNavigationBar.dart';
import '../../ViewModels/loginViewModel.dart';
import '../CreateAccount/SignUp.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final LogInMV = Get.put(LoginViewModel()) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.12,
              ),
              Center(
                child: SvgPicture.asset(
                  "assets/signin.svg",
                  height: 220,
                  width: 220,
                ),
              ),
              SizedBox(
                height: Get.height * 0.06,
              ),
              Align(alignment: Alignment.centerLeft,
                child: Text(
                  'Enter your Password',
                  style: TextStyle(
                    color: Colors.black,fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1)]),
                child: TextFormField(controller:LogInMV.emailController.value ,
                  decoration: InputDecoration(

                      hintStyle: TextStyle(color: Color(0XFF707070),
                        fontSize: 11,
                      ),

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
                height: Get.height * 0.02,
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1)]),
                child: TextFormField(controller:LogInMV.passwordController.value ,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "      Password",
                      hintStyle: TextStyle(color: Color(0XFF707070),
                        fontSize: 11,
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
                height: Get.height * 0.013,
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    onTap: () {},
                    child: Text(
                      'Forget Password',
                      style: TextStyle(color: Color(0xff707070), fontSize: 12),
                    )),
              ),
              SizedBox(
                height: Get.height * 0.07,
              ),
              TextButton(
                onPressed: ()=>LogInMV.LogIn(),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.7,
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
                      "Log in",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}