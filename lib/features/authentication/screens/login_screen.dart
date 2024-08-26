import 'package:fast_food/features/authentication/screens/sign_up_screen.dart';
import 'package:fast_food/features/authentication/widgets/custom_button.dart';
import 'package:fast_food/features/authentication/widgets/custom_text_field.dart';
import 'package:fast_food/features/authentication/widgets/footer.dart';
import 'package:fast_food/features/authentication/widgets/password_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import '../methods/email_auth.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 250 * MediaQuery.of(context).size.height / 862,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Email',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // Using the custom text field
              CustomTextField(
                controller: emailController,
                hint: 'Your Email',
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Password',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              PasswordTextField(
                controller: passController,
                hint: 'Enter Password',
              ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Coming soon'),
                    ),
                  );
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Created a widget custom button to reduce redudancy
              CustomButton(
                  onPressed: () {
                    signInWithEmail(
                        context, emailController.text, passController.text);
                  },
                  text: 'Sign Up'),
              const SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ));
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Don't have an account?  ",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                              color: Colors.deepOrange[600]!,
                              decoration: TextDecoration.underline,
                              fontSize: 16))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Created a custom widget for footer section for login and signup
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
