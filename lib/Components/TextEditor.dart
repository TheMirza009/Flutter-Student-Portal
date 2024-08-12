import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final iconFunction;
  final iconColor;
  final onChangeText;

  const NameField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      this.iconFunction,
      this.iconColor,
      this.onChangeText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),

      // TextField
      child: TextField(

        // Functionality
        controller: controller,
        obscureText: obscureText,
        onChanged: onChangeText,

        // TextField Styling
        cursorColor: const Color.fromARGB(61, 0, 0, 0),
        style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.blueGrey),
          suffixIcon: IconButton(onPressed: iconFunction, icon: Icon(Icons.clear, color: iconColor,)),

          // Border default style
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          
          // border active style
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 196, 206, 220),
              width: 2.0,
            ),

            // Border Radius
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      
      ),
    );
  }
}
