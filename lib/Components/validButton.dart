import 'package:flutter/material.dart';

Widget validButton({ 
  required final onPressed, 
  String buttonTitle = "Validate",
  final padding, 
  final buttonColor = Colors.black,
  final textStyle,
  final buttonSize = const EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
  }) {
  return Padding(
    // padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
    padding: padding,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          // backgroundColor: Color.fromARGB(255, 213, 221, 225)),
          backgroundColor: buttonColor),
      onPressed: onPressed,
      child: Padding(
        padding: buttonSize,
        child: Text(
          buttonTitle,
          // style: TextStyle(color: Colors.black),
          style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
        ),
      ),
    ),
  );
}
