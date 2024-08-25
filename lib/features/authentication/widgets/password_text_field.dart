import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField(
      {super.key, required this.controller, required this.hint});

  final TextEditingController controller;
  final String hint;
  @override
  State<PasswordTextField> createState() {
    // TODO: implement createState
    return _PasswordTextFieldState();
  }
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  var passNotVisible = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      controller: widget.controller,
      obscureText: passNotVisible,
      decoration: InputDecoration(
          hintText: widget.hint,
          constraints: BoxConstraints(minHeight: 40, maxHeight: 40),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange),
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                passNotVisible = !passNotVisible;
              });
            },
            icon:
                Icon(passNotVisible ? Icons.visibility : Icons.visibility_off),
          )),
    );
  }
}
