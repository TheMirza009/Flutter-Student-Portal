import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/homescreen.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/loginPage.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/profile.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/registerPage.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/signupPage.dart';
import 'package:flutter_test_application_1/Screens/scrolltest.dart';
import 'package:flutter_test_application_1/Utils/ImagePicker.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('mybox');
  runApp(const MyCal());
}
class MyCal extends StatelessWidget {
  const MyCal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: "ToDo List App",
      // home: NameEditor(),
      // home: ScrollTest(),
      title: "Student Portal",
      theme: ThemeData.light(),
      home: HomeScreen(),
    );
  }
}


