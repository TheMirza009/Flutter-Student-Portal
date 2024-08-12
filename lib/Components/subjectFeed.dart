import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/iconCard.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/homescreen.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/profile.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/subjectPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SubjectFeed extends StatelessWidget {
  SubjectFeed({super.key});

  HomeScreen hm = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(children: [
        const Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Recently Enrolled",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
                Divider(
                  color: Colors.black,
                )
              ],
            )),
      
        // Subject Card
        SubjectIconCard(
          cardIcon: Icons.electric_bolt,
          backGroundColor: const Color.fromARGB(255, 232, 199, 97),
          subjectTitle: "Electrical Engineering",
          Description: "Currently enrolled",
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (_) => const SubjectPage(),
              ),
            );
          },
        ),
      
        // Subject Card
        SubjectIconCard(
          cardIcon: FontAwesomeIcons.gear,
          backGroundColor: Colors.green,
          subjectTitle: "Mechanical Engineering",
          Description: "Currently enrolled",
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (_) => const SubjectPage(),
              ),
            );
          },
        ),
      
        // Subject Card
        SubjectIconCard(
          cardIcon: FontAwesomeIcons.codepen,
          backGroundColor: Colors.blueAccent,
          subjectTitle: "Software Engineering",
          Description: "Currently enrolled",
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (_) => const SubjectPage(),
              ),
            );
          },
        ),
      
        SubjectIconCard(
          subjectTitle: "Null"
        ),
        SubjectIconCard(
          subjectTitle: "Null"
        ),
        SubjectIconCard(
          subjectTitle: "Null"
        ),
        SubjectIconCard(
          subjectTitle: "Null"
        ),
        SubjectIconCard(
          subjectTitle: "Null"
        ),
        SubjectIconCard(
          subjectTitle: "Null"
        ),
        const SizedBox(
          height: 8,
        ),
        Divider(
          color: Colors.blueGrey[300],
        )
      ]),
    );
  }
}