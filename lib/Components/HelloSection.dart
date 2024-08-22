import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/iconCard.dart';
import 'package:flutter_test_application_1/Components/userCard.dart';

class HelloSection extends StatelessWidget {
  const HelloSection({super.key});

  final String userFirstName = "AbdulMoeed";

  @override
  Widget build(BuildContext context) {
    return UserCard(
      subjectTitle: "Welcome, $userFirstName!",
      description: "Click to view profile.",
      titleOnly: false,
      trailing: false,
      subjectTitleSize: 18,
      onPressed: () => print("DONE")
    );
  }
}
