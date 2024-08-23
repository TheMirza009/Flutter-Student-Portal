import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/SignUp_Page/signup_Name.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/SignUp_Page/signup_password.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/homescreen.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/loginPage.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/Profile/profile.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/registerPage.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/signupPage.dart';
import 'package:flutter_test_application_1/Screens/ToDoList_App/scrolltest.dart';
import 'package:flutter_test_application_1/Utils/ImagePicker.dart';
import 'package:flutter_test_application_1/data/users_Database.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('mybox');
  UserDatabase().loadData();
  runApp(const MyCal());
}

class MyCal extends StatelessWidget {
  const MyCal({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: "Student Portal",
      theme: ThemeData.light(),
      home: const RegisterPage(),
    );
  }
}
