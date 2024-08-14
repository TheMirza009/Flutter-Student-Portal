import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/DrawerButton.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/drawerContent.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Main color
        backgroundColor: Color.fromARGB(255, 193, 194, 201),

        // Appbar
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 6,
          title: const Text(
            "Profile",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.notifications_none_outlined))
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 70,
                            child: Image.asset(
                              "Assets/StudentPortal/FlutterLogo.png",
                            ),
                          ),
                        ),
                      ),
                      // Transform.translate(
                      //   offset: const Offset(80,-15),
                      //   child: Center(
                      //     child: IconButton.filled(
                      //       onPressed: () {},
                      //       icon: const Icon(Icons.camera_alt),
                      //       style: IconButton.styleFrom(
                      //           backgroundColor: Colors.blue[300],),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Electrical Engineering",
                          style: GoogleFonts.montserrat().copyWith(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Currently Enrolled \nMajor Subject",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat().copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Divider(),
                      TextButton(
                        style: TextButton.styleFrom(maximumSize: Size(double.maxFinite, double.maxFinite)),
                        onPressed: () {},
                        child: Text(
                          "Course outline",
                          style: GoogleFonts.montserrat()
                              .copyWith(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Divider(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Recommended Books",
                          style: GoogleFonts.montserrat()
                              .copyWith(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Divider(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Assignments",
                          style: GoogleFonts.montserrat()
                              .copyWith(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Divider(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Examination",
                          style: GoogleFonts.montserrat()
                              .copyWith(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Divider()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

Widget Details({String heading = "Name:", text = "Student Name"}) {
  return Padding(
    padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              heading,
              style: GoogleFonts.montserrat().copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Text(
              text,
              maxLines: 3,
              style: GoogleFonts.montserrat().copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
            ),
          ],
        ),
        Divider()
      ],
    ),
  );
}
