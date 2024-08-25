import 'package:fast_food/features/landing_page/welcome_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../Home/home.dart';

class GoogleSignInAL {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);
        UserCredential userCredential =
            await auth.signInWithCredential(authCredential);
        User? user = userCredential.user;
        if (user != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
          return userCredential;
        }
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> signOutGoogle(BuildContext context) async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => WelcomePageScreen(),
        ),
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
