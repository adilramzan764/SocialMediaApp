// import 'dart:ui';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get_navigation/src/snackbar/snackbar.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
//
// class SignUp_Controller extends GetxController{
//   final FirebaseAuth _auth=FirebaseAuth.instance;
//   final FirebaseFirestore _firestore=FirebaseFirestore.instance;
//   Future<UserCredential?>signUpMethod(
//       String firstname,
//       String phonenumber,
//       String Idnumber,
//       String passwordnumber,
//
//       )
// // async {
// //     try{
// //       UserCredential userCredential =await _auth.createUserWithEmailAndPassword(email: Idnumber, password: passwordnumber);
// //       _firestore
// //           .collection('users')
// //           .doc(userCredential.user!.uid)
// //           .set(userModel.toMap());
// //       EasyLoading.dismiss();
// //       return userCredential;
// //     } on FirebaseAuthException catch (e) {
// //       EasyLoading.dismiss();
// //       Get.snackbar(
// //         "Error",
// //         "$e",
// //         snackPosition: SnackPosition.BOTTOM,
// //         backgroundColor:Color
// //         colorText: AppConstant.appTextColor,
// //       );
// //
// //     }
// // }
//
// }