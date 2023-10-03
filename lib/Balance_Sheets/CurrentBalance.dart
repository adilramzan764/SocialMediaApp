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
  // Function to generate ListTile
  Widget buildListTile(String title, String subtitle, String trailingText) {
    return ListTile(
      leading: Transform.scale(
          scale: 0.6, child: SvgPicture.asset("assets/upgrade-update-icon.svg")),
      title: Text(title, style: TextStyle(color: Colors.black, fontSize: 12)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.black, fontSize: 12)),
      trailing: Text(trailingText, style: TextStyle(color: Colors.black, fontSize: 12)),
    );
  }

  int _currentIndex = 0; // Declare and initialize _currentIndex

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 30),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Wallet", style: TextStyle(color: Colors.black, fontSize: 13)),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Current Balance", style: TextStyle(color: Colors.black, fontSize: 13)),
              ),
              SizedBox(height: 10),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff3EA7FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  dense: true,
                  leading: SvgPicture.asset("assets/increase-up-profit-icon.svg"),
                  title: Text(
                    "2.71%",
                    style: TextStyle(color: Colors.white,fontSize: 13),
                  ),
                  subtitle: Text(
                    '21,554.80\$',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  trailing: Image.asset(
                    "assets/Group 10492.png",
                    fit: BoxFit.cover,
                    width: 50,
                    height: 150,
                  ),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Get.to(()=>PaymentMethod());
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "   Top Up",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        IconButton(onPressed: () {
                          Get.to(()=>PaymentMethod());
                        }, icon: Icon(Icons.arrow_forward, color: Colors.white,size: 14,)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Recent Top ups",style: TextStyle(color:Colors.black, fontSize: 13, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 5),
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
              SizedBox(height: 5),
              buildListTile('Top Up', '04-15-2023', '\$2154'),
              SizedBox(height: 5),
              buildListTile('Top Up', '04-15-2023', '\$2154'),
              SizedBox(height: 5),
              buildListTile('Top Up', '04-15-2023', '\$2154'),
              SizedBox(height: 5),
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
      ),
    );
  }
}
