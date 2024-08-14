import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/DrawerButton.dart';
import 'package:flutter_test_application_1/Components/dialog_Box.dart';
import 'package:flutter_test_application_1/Components/dialoguebox.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/grades.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/profile.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/registerPage.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/semesterPage.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/settings.dart';
import 'package:flutter_test_application_1/Utils/BarChart.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Main Content
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Menu",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color.fromARGB(255, 66, 64, 70)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

//////////////////  Profile
                DrawerOption(
                  buttonTitle: "Profile",
                  icon: const Icon(
                    Icons.person,
                    size: 19,
                    color: Colors.blueGrey,
                  ),
                  onPressFunction: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => Profile(),
                      ),
                    );
                    Scaffold.of(context).openEndDrawer();
                  },
                ),

////////////////// Semester
                DrawerOption(
                  buttonTitle: "Semester",
                  icon: const Icon(
                    Icons.numbers,
                    size: 19,
                    color: Colors.blueGrey,
                  ),
                  onPressFunction: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const SemesterPage(),
                      ),
                    );
                    Scaffold.of(context).openEndDrawer();
                  },
                ),

//////////////////////////// Attendence ////////////////////////
                DrawerOption(
                  buttonTitle: "Grades",
                  icon: const Icon(
                    Icons.book,
                    size: 19,
                    color: Colors.blueGrey,
                  ),
                  onPressFunction: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => Grades(),
                      ),
                    );
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
//////////////////////////// Attendence ////////////////////////
                DrawerOption(
                  buttonTitle: "Attendance",
                  icon: const Icon(
                    Icons.book,
                    size: 19,
                    color: Colors.blueGrey,
                  ),
                  onPressFunction: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const BarChartSample3(),
                      ),
                    );
                    Scaffold.of(context).openEndDrawer();
                  },
                ),

////////////////////////////  Assessment
                DrawerOption(
                  buttonTitle: "Assessment",
                  icon: const Icon(
                    Icons.my_library_books,
                    size: 19,
                    color: Colors.blueGrey,
                  ),
                  onPressFunction: () {},
                ),

////////////////////////////  Enrollment
                DrawerOption(
                  buttonTitle: "Enrollment",
                  icon: const Icon(
                    Icons.app_registration,
                    size: 19,
                    color: Colors.blueGrey,
                  ),
                  onPressFunction: () {},
                ),

///////////////////////////// Settings
                DrawerOption(
                  buttonTitle: "Settings",
                  icon: const Icon(
                    Icons.settings,
                    size: 19,
                    color: Colors.blueGrey,
                  ),
                  onPressFunction: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const SettingsPage(),
                      ),
                    );
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: DrawerOption(
                buttonTitle: "Log out",
                icon: const Icon(
                  Icons.power_settings_new,
                  size: 19,
                  color: Colors.blueGrey,
                ),
                onPressFunction: () {
                  Scaffold.of(context).openEndDrawer();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialogBox(
                        message: "Are you sure you want to Log Out?",
                        onPressYes: () {
                          // Navigator.maybePop(context);
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => const RegisterPage(),
                            ), (route) => false
                          );
                          
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
