import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'Payment Method Process.dart';
class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(children: [SizedBox(height: 30,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){
                Get.back();
              }, icon: Icon(Icons.arrow_back_ios_new_sharp,color: Colors.black,size: 16,)),
              Text("Payment Method",style: TextStyle(color: Colors.black),),
              SizedBox(
                height: 20,
                width: 20,
              )
            ],
          ),
          SizedBox(height: 10,),
          SvgPicture.asset("assets/E-Wallet.svg"),
          SizedBox(height: 10,),
          TextButton(
            onPressed: () {
              // Your onPressed logic here
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
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0), // Adjust padding as needed
                child: Text(
                  "      By Debit Card",
                  style: TextStyle(
                    color: Colors.black,fontSize: 12
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height:2,),
          TextButton(
            onPressed: () {
              // Your onPressed logic here
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
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0), // Adjust padding as needed
                child: Text(
                  "      By Credit Card",
                  style: TextStyle(
                    color: Colors.black,fontSize: 12
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          TextButton(
            onPressed: () {
              Get.to(()=>PaymentMethodProcess());
            },

            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width/1.3,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.5,
                  ),
                ],
                color: Color(0xffAC83F6),
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
              child: Center(
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
