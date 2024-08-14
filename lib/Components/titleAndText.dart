import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/data/users_Database.dart';
import 'package:hive_flutter/hive_flutter.dart';

defaultReturn(value) {
  if (value == null || value.isEmpty) {
    return "Enter something";
  } else {
    return null;
  }
}

Widget titleAndText({
  String title = "Username",
  bool obscureText = false,
  bool changePass = false,
  bool borderUnderline = false,
  final controller,
  final validator,
  final errorStyle,
  final suffixIcon,
  final onChanged,
  final icon,
}) {
  UserDatabase userbase = UserDatabase();
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Column(
      children: [
        borderUnderline
            ? const SizedBox.shrink()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 3),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                    )),
              ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),

          // Field 1
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            onChanged: onChanged,
            enabled: true,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              labelText: borderUnderline ? title : null,
              labelStyle: borderUnderline
                  ? const TextStyle(color: Colors.grey)
                  : const TextStyle(color: Colors.transparent),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              // hintText: borderUnderline ? title : null,
              enabledBorder: borderUnderline
                  ? const UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(139, 96, 125, 139)))
                  : const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 235, 235, 235),
                        width: 2.5,
                      ),
                    ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),  
              ),
              
            ),
            validator: validator,
          ),
        ),
        forgotPassword(changePass: changePass)
      ],
    ),
  );
}

Widget forgotPassword({bool changePass = false}) {
  loadSavedUsers() async {
    final myBox = await Hive.openBox("mybox");
    final data = await myBox.get("USERLIST");
    final savedUsers = data;
    print("Loaded users list: $savedUsers");
  }
  return changePass
      ? Transform.translate(
          offset: const Offset(-10, -13),
          child: Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              style: TextButton.styleFrom(
                overlayColor: Colors.transparent,
              ),
              onPressed: () => loadSavedUsers(),
              child: const Text(
                "Forgot Password?",
                style: TextStyle(
                    color: Color.fromARGB(129, 96, 125, 139), fontSize: 12),
              ),
            ),
          ),
        )
      : const SizedBox.shrink();
}
