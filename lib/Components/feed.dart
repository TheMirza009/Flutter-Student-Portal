import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/HelloSection.dart';
import 'package:flutter_test_application_1/Components/MidRow.dart';
import 'package:flutter_test_application_1/Components/getStartedSection.dart';
import 'package:flutter_test_application_1/Components/iconCard.dart';
import 'package:flutter_test_application_1/Components/subjectFeed.dart';
import 'package:flutter_test_application_1/Components/userCard.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/homescreen.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/Profile/profile.dart';

class Feed extends StatelessWidget {
  Feed({super.key});
  bool ProfileDataExists = true;
  bool contentAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetStartedSection(),
        const MidRow(),
        contentAvailable ? SubjectFeed() : noData()
      ],
    );
  }
}


