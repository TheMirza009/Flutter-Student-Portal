import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget UserCard({
  required String subjectTitle,
  String description = "Click to view profile.",
  VoidCallback? onPressed,
  double subjectTitleSize = 18,
  bool titleOnly = false,
  bool trailing = true,
  Color backGroundColor = const Color.fromARGB(255, 105, 141, 170),
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7),
        child: InkWell(
          onTap: onPressed,
          child: Ink(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 229, 229, 229),
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // Shadow position
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical:10),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: backGroundColor,
                  backgroundImage: AssetImage("Assets/StudentPortal/avatarDefault.png",),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subjectTitle,
                      style: GoogleFonts.montserrat().copyWith(
                        fontSize: subjectTitleSize,
                        fontWeight: fontWeight,
                      ),
                    ),
                    if (!titleOnly)
                      Text(
                        description,
                        style: GoogleFonts.montserrat().copyWith(
                          fontSize: 14,
                        ),
                      ),
                  ],
                ),
                trailing: trailing
                    ? TextButton(
                        onPressed: onPressed,
                        child: const Text("View"),
                      )
                    : null,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}
