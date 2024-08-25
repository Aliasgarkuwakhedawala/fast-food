import 'package:fast_food/features/authentication/methods/facebook_auth.dart';
import 'package:fast_food/features/authentication/screens/login_screen.dart';
import 'package:fast_food/features/authentication/screens/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../authentication/methods/google_sign_in.dart';

class WelcomePageScreen extends StatefulWidget {
  const WelcomePageScreen({super.key});

  @override
  State<WelcomePageScreen> createState() => _WelcomePageScreenState();
}

class _WelcomePageScreenState extends State<WelcomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/landing_page_image.png'),
              opacity: 0.8,
              fit: BoxFit.fill),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.white24,
              Colors.white30,
              Colors.white54,
              Colors.white60,
              Colors.deepOrange[100]!,
              Colors.deepOrange[400]!,
              Colors.deepOrange[900]!
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Spacer(flex: 9),
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: const TextSpan(
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                      children: [
                        TextSpan(
                            text: 'Welcome to\n',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: 'Fast Food',
                            style: TextStyle(
                                color: Color.fromARGB(255, 245, 60, 0)))
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Get your favourite meals delivered \nquickly right to your doorstep',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Start with email',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          wordSpacing: 2,
                          letterSpacing: 1.5),
                    ),
                  ),
                ),
                const Spacer(),
                const Text(
                  '----------------------- Sign in with ----------------------- ',
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      SignInWithFacebook(context);
                    },
                    icon: const Icon(Icons.facebook, color: Colors.blue),
                    label: const Text('Continue with Facebook'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.orange),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
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
                      side: const BorderSide(color: Colors.orange),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
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
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                  },
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Already have an account? ',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                        TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
