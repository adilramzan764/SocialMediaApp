import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'BottomNavigationBar/MyBottomNavigationBar.dart';
import 'StarterScreens/starterscreen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(
            context, widget!), // Use BouncingScrollWrapper if needed
        maxWidth: 1200,
        minWidth: 300,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.autoScale(300, name: MOBILE),
          ResponsiveBreakpoint.autoScale(500, name: MOBILE),
          ResponsiveBreakpoint.autoScale(700, name: TABLET),
          ResponsiveBreakpoint.autoScale(900, name: TABLET),
          ResponsiveBreakpoint.autoScale(1200, name: TABLET),
        ],
      ),
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:OnBoardScreen(),
    );
  }
}


