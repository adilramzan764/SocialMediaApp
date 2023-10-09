import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:socialmediaapp/Chat%20screens/PhoneTab.dart';

import '../../../Chat screens/RecentCall.dart';
import '../Profile.dart';

class ProfileEdit extends StatefulWidget  {
   ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    // First Image

                    Container(
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/model4.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25))),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.16, left: 20),
                      child: Container(
                        height: 95,
                        width: 95,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Color(0xffAC83F6)),
                                  image: DecorationImage(
                                      image: AssetImage('assets/model1.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Color(0xffAC83F6)),


                                  ),
                                  child: Center(
                                      child: SvgPicture.asset("assets/Edit.svg"))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 2)
                            ]),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: TextStyle(
                                fontSize: 12,
                              ),
                              prefixIcon: Transform.scale(
                                  scale: 0.4,
                                  child: SvgPicture.asset(
                                    'assets/Iconly-Bulk-Profile.svg',
                                  )),
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 2)
                            ]),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "26/03/2023",
                              hintStyle: TextStyle(
                                fontSize: 12,
                              ),
                              contentPadding: EdgeInsets.all(8),
                              prefixIcon: Transform.scale(
                                  scale: 0.4,
                                  child: SvgPicture.asset(
                                    'assets/Iconly-Bold-Calendar.svg',
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 2)
                            ]),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Add location here",
                              hintStyle: TextStyle(
                                fontSize: 12,
                              ),
                              contentPadding: EdgeInsets.all(8),
                              prefixIcon: Transform.scale(
                                  scale: 0.4,
                                  child: SvgPicture.asset(
                                    'assets/Location.svg',
                                    color: Colors.blue,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                        ),
                        child: SingleChildScrollView(
                          child: TextField(
                            maxLines: null,
                            // Set maxLines to null to allow unlimited lines
                            decoration: InputDecoration(
                              hintText: "Add a Bio to your profile",
                              hintStyle: TextStyle(fontSize: 12),
                              contentPadding: EdgeInsets.all(8),
                              prefixIcon: Transform.scale(
                                scale: 0.4,
                                child: SvgPicture.asset(
                                  'assets/id-icon.svg',
                                  color: Colors.blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              // filled: true,
                              fillColor: Colors.white,
                              border:
                                  OutlineInputBorder(borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height*0.05,
                      ),
                      TextButton(
                        onPressed: () {
                          // Get.to(()=>RecentCall());
                        },
                        child: Container(
                          height: 50,
                          width:  MediaQuery.of(context).size.width * 0.6,
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
                              "Save",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height*0.01,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Container(
                          height: 50,
                          width:  MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Color(0xffAC83F6), fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),





    );
  }
}
