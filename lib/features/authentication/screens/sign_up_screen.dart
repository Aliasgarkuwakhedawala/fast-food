import 'package:fast_food/features/authentication/methods/email_auth.dart';
import 'package:fast_food/features/authentication/screens/login_screen.dart';
import 'package:fast_food/features/authentication/widgets/custom_button.dart';
import 'package:fast_food/features/authentication/widgets/custom_text_field.dart';
import 'package:fast_food/features/authentication/widgets/footer.dart';
import 'package:fast_food/features/authentication/widgets/password_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  //  Function to verify email
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 150 * MediaQuery.of(context).size.height / 862,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Sign Up',
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
                  'Name',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextField(
                controller: nameController,
                hint: 'Your Name',
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
              // Created a custom password field for Login and signup
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
              CustomButton(
                  onPressed: () {
                    if (isValidEmail() == false) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter valid email'),
                        ),
                      );
                    } else if (nameController.text == '') {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter Your name'),
                        ),
                      );
                    } else if (passController.text.length < 8) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Password must have 8 characters'),
                        ),
                      );
                    }
                    signUpWithEmail(context, emailController.text,
                        passController.text, nameController.text);
                  },
                  text: 'Sign Up'),
              const SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                      TextSpan(
                          text: 'Sign In',
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
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
