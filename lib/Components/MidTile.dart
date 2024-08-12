import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget midTile(
    {String title = "GPA",
    String subtitle = "3.14",
    final onTap,
    final backgroundColor = const Color.fromARGB(255, 208, 124, 124),
    double textSize = 28,
    final Gradient}) {
  
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: InkWell(
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              color: backgroundColor,
              gradient: Gradient,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(48, 54, 51, 51), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 12, // Blur radius
                  offset: Offset(0, 4), // Shadow offset
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: '${title}\n',
                            style: GoogleFonts.montserrat().copyWith(
                              color: Colors.white,
                              fontSize: textSize,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                          text: subtitle,
                          style: GoogleFonts.montserrat().copyWith(
                            color: Colors.white,
                            fontSize: textSize * 3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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