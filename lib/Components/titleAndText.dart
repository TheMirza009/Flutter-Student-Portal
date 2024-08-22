import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/data/users_Database.dart';
import 'package:google_fonts/google_fonts.dart';
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
  bool showTitle = true,
  double paddingHorizontal = 18,
  double paddingVertical = 0,
  final controller,
  final validator,
  final errorStyle,
  final titleStyle,
  final defaultBorderColor = const Color.fromARGB(255, 212, 212, 212),
  final hintText,
  final suffixIcon,
  final onChanged,
  final icon,
}) {
  UserDatabase userbase = UserDatabase();
  return Column(
    children: [
      !showTitle
          ? const SizedBox.shrink()
          : Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: titleStyle,
                  ),),
            ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
  
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
                ? GoogleFonts.montserrat().copyWith(color: Colors.black54)
                : GoogleFonts.montserrat().copyWith(color: Colors.grey),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            enabledBorder: borderUnderline
                ? const UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Color.fromARGB(139, 96, 125, 139)))
                : OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                      color:defaultBorderColor,
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
