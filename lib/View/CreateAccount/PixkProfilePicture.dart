import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:socialmediaapp/ViewModels/signUpViewModel.dart';

import '../../Widgets/CustomButton.dart';
import 'UsernameCreation.dart';

class PickProfilePicture extends StatelessWidget {
  PickProfilePicture({Key? key}) : super(key: key);
  final registerVM = Get.put(RegisterViewModel()) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.1,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 15,
                    ))),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  Pick a Profile picture",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                )),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Have a favorite Selfie ? Upload it now",
                  style: TextStyle(color: Colors.black, fontSize: 10),
                )),
            SizedBox(
              height: Get.height * 0.06,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          spreadRadius: 0.5,
                          color: Colors.grey.withOpacity(0.3))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/Camera.svg',
                        height: 50, width: 50),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Upload",
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: CustomButton(
                text: 'Skip for now',
                onPressed: () {
                  // Get.to()
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: CustomButton(
                text: 'Next',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UsernameCreation(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
