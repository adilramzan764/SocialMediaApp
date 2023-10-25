import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:socialmediaapp/View/StarterScreens/starterscreen1.dart';

import 'Utis/firebase_options.dart';
import 'ViewModels/ProfileViewModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  ); // Initialize Firebase (if needed)

  runApp(MyApp());
  configLoading();
  Get.put(ProfileViewModel()); // Register ProfileViewModel

}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.orange
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = true;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}); // Fix the constructor declaration

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer( // Use Sizer widget to make your app responsive
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,

          home: OnBoardScreen(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
