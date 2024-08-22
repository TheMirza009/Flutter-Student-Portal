import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/MidRow.dart';
import 'package:flutter_test_application_1/Components/getStartedSection.dart';
import 'package:flutter_test_application_1/Components/subjectFeed.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/homescreen.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});
  final bool ProfileDataExists = true;
  final bool contentAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GetStartedSection(),
        const MidRow(),
        contentAvailable ? SubjectFeed() : noData()
      ],
    );
  }
}


