import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_application_1/Components/MidTile.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/grades.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/gradesPage.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/semesterPage.dart';
import 'package:flutter_test_application_1/Utils/BarChart.dart';
import 'package:google_fonts/google_fonts.dart';

class MidRow extends StatelessWidget {
  const MidRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                midTile(onTap:() {
                    Future.delayed(const Duration(milliseconds: 200), () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (_) => Grades()));
                    });
                  },
                Gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 228, 138, 183), // Starting color
                      Color.fromARGB(255, 156, 49, 49), // Ending color (example)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),),
                midTile(
                  onTap: () {
                    Future.delayed(Duration(milliseconds: 200), () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (_) => SemesterPage()));
                    });
                  },
                  title: "Semester",
                  subtitle: "2nd",
                  backgroundColor: Color.fromARGB(255, 86, 153, 186),
                  Gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 113, 205, 229), // Starting color
                      Color.fromARGB(255, 0, 87, 141), // Ending color (example)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                midTile(
                  onTap: () {
                    Future.delayed(Duration(milliseconds: 200), () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => const BarChartSample3(),
                        ),
                      );
                    });
                  },
                  title: "Attendance",
                  subtitle: "88%",
                  backgroundColor: Color.fromARGB(255, 93, 192, 158),
                  Gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 93, 192, 158), // Starting color
                      Color.fromARGB(255, 34, 119, 141), // Ending color (example)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


