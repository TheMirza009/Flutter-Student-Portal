import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/Drawer_Content/semesterPage.dart';

Widget IconCard({
  final cardIcon = Icons.person,
  String cardText = "Click on the + to add your profile data.",
  final onPressed,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 15.0,
      vertical: 7,
    ),
    child: Card(
      color: Color.fromARGB(255, 229, 229, 229),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 105, 141, 170),
            child: Icon(
              cardIcon,
              color: Colors.white,
            ),
          ),
          title: Text(
            cardText,
            style: const TextStyle(fontSize: 12),
          ),
          trailing: IconButton(
            icon: Icon(Icons.add),
            onPressed: onPressed,
          ),
        ),
      ),
    ),
  );
}

Widget SubjectIconCard({
  final cardIcon = Icons.person,
  String Description = "Click on the + to add your profile data.",
  final onPressed,
  final subjectTitle,
  double subjectTitleSize = 15,
  bool TitleOnly = false,
  bool trailing = true,
  final backGroundColor = const Color.fromARGB(255, 105, 141, 170),
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 15.0,
      vertical: 7,
    ),
    child: Card(
      color: Color.fromARGB(255, 229, 229, 229),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: backGroundColor,
            child: Icon(
              cardIcon,
              color: Colors.white,
              size: 18,
            ),
          ),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleOnly
                    ? montserratText(
                        text: subjectTitle,
                        size: subjectTitleSize,
                      )
                    : Text(subjectTitle,
                        style: TextStyle(
                          fontSize: subjectTitleSize,
                          fontWeight: FontWeight.bold,
                        )),
                TitleOnly
                    ? const SizedBox.shrink()
                    : Text(
                        Description,
                        style: TextStyle(fontSize: 13),
                      ),
              ],
            ),
          ),
          trailing: trailing
              ? TextButton(
                  onPressed: onPressed,
                  child: Text(
                    "View",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                )
              : null,
        ),
      ),
    ),
  );
}
