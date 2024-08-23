import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SemesterPage extends StatefulWidget {
  const SemesterPage({super.key});

  @override
  State<SemesterPage> createState() => _SemesterPageState();
}

class _SemesterPageState extends State<SemesterPage> {
  String? semesterValue = "Semester 2";
  List<Widget> semesterSubjects() {
    return semesterValue == "Semester 2"
        ? subjects_Semester2
        : subjects_Semester1;
  }

  List<Widget> subjects_Semester2 = [
    Divider(),
    ListTile(title: montserratText(text: "Data Structures and Algorithms")),
    Divider(),
    ListTile(title: montserratText(text: "Calculus & Geometry")),
    Divider(),
    ListTile(title: montserratText(text: "Theory of Automata")),
  ];

  List<Widget> subjects_Semester1 = [
    Divider(),
    ListTile(title: montserratText(text: "Fundamentals of Programming")),
    Divider(),
    ListTile(title: montserratText(text: "Computer Architecture")),
    Divider(),
    ListTile(
        title: montserratText(text: "Introduction to Software Engineering")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Main color
      backgroundColor: const Color.fromARGB(255, 193, 194, 201),
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 35, bottom: 30),
              child: Container(
                height: double.infinity,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white70,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: Image.asset(
                              "Assets/StudentPortal/FlutterLogo.png",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                              value: semesterValue,
                              underline: SizedBox.shrink(),
                              onChanged: (String? newVal) {
                                setState(() {
                                  semesterValue = newVal;
                                });
                              },
                              items: [
                                DropdownMenuItem<String>(
                                  value: "Semester 1",
                                  child: Text(
                                    "Semester 1",
                                    style: GoogleFonts.montserrat().copyWith(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: "Semester 2",
                                  child: Text(
                                    "Semester 2",
                                    style: GoogleFonts.montserrat().copyWith(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Transform.translate(
                            offset: const Offset(0, -10),
                            child: Text(
                              "Currently Enrolled",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat().copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        ExpansionTile(
                          title: montserratText(text: "Subjects"),
                          collapsedShape:
                              RoundedRectangleBorder(side: BorderSide.none),
                          children: semesterSubjects(),
                        ),
                        const Divider(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Course outline",
                            style: GoogleFonts.montserrat()
                                .copyWith(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        const Divider(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Examination",
                            style: GoogleFonts.montserrat()
                                .copyWith(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        const Divider(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Credit Hours",
                            style: GoogleFonts.montserrat()
                                .copyWith(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        const Divider()
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 45,
              left: 30,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Grey background color
                  shape: BoxShape.circle,
                ), // Circular background
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  ), // Customize the icon color
                  onPressed: () {
                    Navigator.pop(context); // Navigate back
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget montserratText({required String text, double size = 18, FontWeight weight = FontWeight.normal, color = Colors.black}) {
  return Text(text,
      style:
          GoogleFonts.montserrat().copyWith(fontSize: size, color: color, fontWeight: weight));
}
