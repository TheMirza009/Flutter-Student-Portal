import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/data/users_Database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserCard extends StatefulWidget {
  final dynamic subjectTitle;
  final String description;
  final VoidCallback? onPressed;
  final double subjectTitleSize;
  final bool titleOnly;
  final bool trailing;
  final Color backGroundColor;
  final FontWeight fontWeight;

  UserCard({
    required this.subjectTitle,
    this.description = "Click to view profile.",
    this.onPressed,
    this.subjectTitleSize = 18,
    this.titleOnly = false,
    this.trailing = true,
    this.backGroundColor = const Color.fromARGB(255, 105, 141, 170),
    this.fontWeight = FontWeight.bold,
  });

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  late UserDatabase userbase;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    openHiveBox();
  }

  Future<void> openHiveBox() async {
    if (!Hive.isBoxOpen('mybox')) {
      await Hive.openBox('mybox');
      print("Hive opened");
    }
    userbase = UserDatabase();
    setState(() async {
      await userbase.loadData();
      isLoading = false;
    }); // Trigger rebuild after loading data
  }

  @override
  Widget build(BuildContext context) {
    final userProfileImage =
        userbase.savedUsers[userbase.currentUser]?["details"]?["Photo"];
    final imageProvider =
        userProfileImage != null && File(userProfileImage).existsSync()
            ? FileImage(File(userbase.savedUsers[userbase.currentUser]?["details"]?["Photo"]))
            : const AssetImage("Assets/StudentPortal/avatarDefault.png");
            
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7),
          child: InkWell(
            onTap: widget.onPressed,
            child: Ink(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 229, 229, 229),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: widget.backGroundColor,
                    backgroundImage: imageProvider as ImageProvider,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.subjectTitle,
                        style: GoogleFonts.montserrat().copyWith(
                          fontSize: widget.subjectTitleSize,
                          fontWeight: widget.fontWeight,
                        ),
                      ),
                      if (!widget.titleOnly)
                        Text(
                          widget.description,
                          style: GoogleFonts.montserrat().copyWith(
                            fontSize: 14,
                          ),
                        ),
                    ],
                  ),
                  trailing: widget.trailing
                      ? TextButton(
                          onPressed: widget.onPressed,
                          child: const Text("View"),
                        )
                      : null,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
