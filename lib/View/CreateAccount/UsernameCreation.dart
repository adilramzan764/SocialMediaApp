import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:socialmediaapp/View/Chat%20screens/MainChatScreens.dart';
import 'package:socialmediaapp/View/StarterScreens/ContinueWithGoogle.dart';
import 'package:socialmediaapp/ViewModels/signUpViewModel.dart';

import '../../Widgets/CustomButton.dart';
import 'ContactsPermission.dart';

class UsernameCreation extends StatefulWidget {
  const UsernameCreation({Key? key}) : super(key: key);

  @override
  State<UsernameCreation> createState() => _UsernameCreationState();
}

class _UsernameCreationState extends State<UsernameCreation> {

  // bool _isChecked = true;
  final registerVM = Get.put(RegisterViewModel()) ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: Get.height*0.1,),
            Align(alignment: Alignment.centerLeft,
                child: InkWell(onTap: () {
                  Get.back();
                },
                    child: Icon(Icons.arrow_back_ios, size: 15,))),
            SizedBox(height: Get.height*0.02,),
            Align(alignment: Alignment.centerLeft,
                child: Text("  What should we call you ?",style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w400),)),
            SizedBox(height: Get.height*0.01,),
            Align(alignment: Alignment.centerLeft,
                child: Text("Your @username is unique . You can always change it later .",style: TextStyle(color: Colors.black,fontSize: 10),)),
            SizedBox(height: Get.height*0.06,),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1)]),
              child: TextFormField(
                controller: registerVM.userNameController.value,
                decoration: InputDecoration(
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.7),
                      fontSize: 10,
                    ),
                    // suffixIcon: Transform.scale(
                    //   scale: 0.7,
                    //   child: Checkbox(
                    //     activeColor: Color(0xff3EA7FF), //The color to use when this checkbox is checked.
                    //
                    //     // value: _isChecked,
                    //     // onChanged: (bool? newValue) {
                    //     //   setState(() {
                    //     //     _isChecked = newValue ?? false;
                    //     //   });
                    //     // },
                    //   ),
                    // ),
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
            SizedBox(height: 5,),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('@rub1487, @abrar5486',style: TextStyle(color: Colors.blue,fontSize: 11),)),
            SizedBox(height: 2,),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Show more',style: TextStyle(color: Colors.blue,fontSize: 11),)),
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
              //   onPressed: () {
              //     Get.to(()=>ContinueWithGoogle());
              // },
                onPressed: ()=>registerVM.signUp(),
              ),
            )

          ],
        ),
      ),
    );
  }
}
