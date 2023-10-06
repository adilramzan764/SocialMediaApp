import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialpad/flutter_dialpad.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DialCall_Widget extends StatelessWidget {
  const DialCall_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return             Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: Get.height * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(child: Icon(Icons.arrow_back_ios,color: Colors.black,size: 16,), onTap: () {               Get.back();
              },),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 1)
                    ]),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search here",
                      hintStyle:
                      TextStyle(color: Color(0xffD8D8D8), fontSize: 12),
                      contentPadding: EdgeInsets.all(8),
                      prefixIcon: Transform.scale(
                        scale: 0.3,
                        child: SvgPicture.asset('assets/Bulk-Search.svg'),
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
              SvgPicture.asset("assets/dot.svg")
            ],
          ),
        ),
        SizedBox(height: Get.height*0.03,),
        Container(height: 50,
          decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 2)],color: Colors.white),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Minutes left for International calls", style: TextStyle(color: Colors.black,fontSize: 10)),
              Text("78.6 min",style: TextStyle(color: Color(0xffAC83F6),fontWeight: FontWeight.w500),)
            ],
          ),

        ),
        Expanded(
          // height: 700,
          // width: double.infinity,
          // padding: EdgeInsets.all(8),
          child: DialPad(
            // enableDtmf: false,
            outputMask: "(000) 000-0000",
            hideSubtitle: true,
            backspaceButtonIconColor: Colors.red,
            buttonTextColor: Colors.black,
            dialOutputTextColor: Colors.black,
            // keyPressed: (value) {
            //   print('$value was pressed');
            // },
            makeCall: (number) {
              print(number);
            },
          ),
        ),
      ],
    )
    ;
  }
}
