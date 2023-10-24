
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialmediaapp/View/Login_Screens/Log_In.dart';

class GoogleSignInController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User canceled the Google Sign In process
        return;
      }

      // Access the user details
      print('Google User Email: ${googleUser.email}');
      // Add your logic to handle the Google Sign-In user data here

      // Navigate to the desired screen after successful sign-in
      Get.to(() => LogIn());
    } catch (error) {
      // Handle errors during Google Sign-In
      print('Google Sign-In Error: $error');
    }
  }

  void signOutGoogle() async {
    await _googleSignIn.signOut();
    print('User Sign Out');
  }
}