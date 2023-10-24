import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../View/Chat screens/MainChatScreens.dart';

class GoogleSignInController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return;
      }
      print('Google User Email: ${googleUser.email}');
      Get.offAll(() => MainChatScreens());
    } catch (error) {
      print('Google Sign-In Error: $error');
    }
  }

  void signOutGoogle() async {
    await _googleSignIn.signOut();
    print('User Sign Out');
  }
}
