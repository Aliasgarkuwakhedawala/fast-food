import 'package:flutter/material.dart';

import '../methods/facebook_auth.dart';
import '../methods/google_sign_in.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const Text(
          '----------------------- Sign in with ----------------------- ',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 50,
          child: OutlinedButton.icon(
            onPressed: () {
              SignInWithFacebook(context);
            },
            icon: Icon(Icons.facebook, color: Colors.blue),
            label: Text('Continue with Facebook'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.black),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: () {
              GoogleSignInAL().signInGoogle(context);
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.black),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/google_logo.png'),
                  width: 30,
                  height: 30,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('Continue with Google'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
