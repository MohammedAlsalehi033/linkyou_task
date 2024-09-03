
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:linkyou_task/Screens/MainScreen.dart';
import 'package:linkyou_task/Services/APIManger.dart';

class MyFireBaseAuth {
  static Future<void> signInWithGoogle(BuildContext context) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
        return;
      }

      final GoogleSignInAccount? googleSignInAccount =
      await GoogleSignIn().signIn();

      if (googleSignInAccount == null) {
        Navigator.of(context, rootNavigator: true).pop();
        return;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final OAuthCredential googleAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(googleAuthCredential);

      final User user = userCredential.user!;
      print("User signed in: ${user.displayName} (${user.email})");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logged in and Posted to the API")),
      );
      postUser(user.displayName!);
      Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()),
        );


    } catch (e) {
      FirebaseAuth.instance.signOut();
      print(e);
      Navigator.of(context, rootNavigator: true).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Errorr during Google sign in: Check Your Connection and try again later")),
      );
    }
  }
}
