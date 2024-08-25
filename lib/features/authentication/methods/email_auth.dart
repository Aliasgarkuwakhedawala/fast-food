import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Home/home.dart';

final _auth = FirebaseAuth.instance;

Future<void> signInWithEmail(
    BuildContext context, String email, String password) async {
  try {
    final userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    if (userCredential.user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  } on FirebaseAuthException catch (error) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error.message ?? 'Authentication failes!'),
      ),
    );
  }
}

Future<void> signUpWithEmail(
    BuildContext context, String email, String password, String name) async {
  try {
    final userCresentails = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    if (userCresentails.user != null) {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(userCresentails.user!.uid)
          .set({
        'username': name,
        'email': email,
      });

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  } on FirebaseAuthException catch (error) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error.message ?? 'Authentication failes!'),
      ),
    );
  }
}
