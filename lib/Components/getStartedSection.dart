import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/feed.dart';
import 'package:flutter_test_application_1/Components/userCard.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/profile.dart';

class GetStartedSection extends StatelessWidget {
  GetStartedSection({super.key});

  String userFirstName = "Student";

  @override
  Widget build(BuildContext context) {
    Feed f = Feed();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              f.ProfileDataExists
                  ? const SizedBox.shrink()
                  : const Text(
                      "Get started",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
            ],
          ),
        ),
        UserCard(
          subjectTitle: "Welcome, $userFirstName!",
          description: f.ProfileDataExists
              ? "Click to view profile."
              : "Click to add Profile data.",
          titleOnly: false,
          trailing: false,
          subjectTitleSize: 18,
          onPressed: () {
            Future.delayed(const Duration(milliseconds: 200), () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => Profile(),
                ),
              );
            });
          },
        ),
        const SizedBox(
          height: 0,
        ),
        Divider(
          color: Colors.blueGrey[300],
        )
      ]),
    );
  }
}
