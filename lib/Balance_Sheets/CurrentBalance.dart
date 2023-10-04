import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'Payment Method.dart';

class CurrentBalance extends StatefulWidget {
  const CurrentBalance({Key? key}) : super(key: key);

  @override
  State<CurrentBalance> createState() => _CurrentBalanceState();
}

class _CurrentBalanceState extends State<CurrentBalance> {
  Widget buildListTile(String title, String subtitle, String trailingText) {
    return ListTile(
      leading: Transform.scale(
          scale: 0.6, child: SvgPicture.asset("assets/upgrade-update-icon.svg")),
      title: Text(title, style: TextStyle(color: Colors.black, fontSize: 12)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.black, fontSize: 12)),
      trailing: Text(trailingText, style: TextStyle(color: Colors.black, fontSize: 12)),
    );
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: Get.height*0.05,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(Icons.arrow_back_ios_new_sharp,color: Colors.black,size: 16,)),
                Text("Wallet",style: TextStyle(color: Colors.black),),
                SizedBox(
                  height: 30,
                  width: 30,
                )
              ],
            ),
            SizedBox(height: Get.height*0.02,),
          Container(height: 50,
            decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 2)],color: Colors.white),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Minutes left for International calls", style: TextStyle(color: Colors.black,fontSize: 10)),
                Text("78.6 min",style: TextStyle(color: Color(0xffAC83F6),fontWeight: FontWeight.w500),)
              ],
            ),

          ),
            SizedBox(height: Get.height*0.05,),
            TextButton(
              onPressed: () {
                Get.to(()=>PaymentMethod());
              },
              child: Container(
                height: 45,
                width: double.infinity,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "     Top Up",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      IconButton(onPressed: () {
                        Get.to(()=>PaymentMethod());
                      }, icon: SvgPicture.asset("assets/Arrow - Right.svg"))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height*0.01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Recent Top ups",style: TextStyle(color:Colors.black, fontSize: 13, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: Get.height*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: Color(0xffD8D8D8),
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("This Week", style: TextStyle(color: Color(0xffD8D8D8),fontSize: 12)),
                ),
                Expanded(
                  child: Divider(
                    color: Color(0xffD8D8D8),
                    thickness: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height*0.001,),
            buildListTile('Top Up', '04-15-2023', '\$2154'),
            SizedBox(height: Get.height*0.001,),
            buildListTile('Top Up', '04-15-2023', '\$2154'),
            SizedBox(height: Get.height*0.001,),
            buildListTile('Top Up', '04-15-2023', '\$2154'),
            SizedBox(height: Get.height*0.001,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: Color(0xffD8D8D8),
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("This Month", style: TextStyle(color: Color(0xffD8D8D8),fontSize: 12)),
                ),
                Expanded(
                  child: Divider(
                    color: Color(0xffD8D8D8),
                    thickness: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            buildListTile('Top Up', '04-15-2023', '\$2154'),
            SizedBox(height: 5),
            buildListTile('Top Up', '04-15-2023', '\$2154'),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
