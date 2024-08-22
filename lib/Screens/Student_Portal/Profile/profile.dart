import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/Profile/profile_edit.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/Drawer_Content/drawerContent.dart';
import 'package:flutter_test_application_1/data/UserDetails.dart';
import 'package:flutter_test_application_1/data/users_Database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? profilePicture;

  final ImagePicker img = ImagePicker();
  final UserDatabase userbase = UserDatabase();

  @override
  void initState() {
    super.initState();
    openHiveBox();
  }

  @override
  void didPopNext() {
    setState(() {
      openHiveBox();
    });
  }

  Future<void> openHiveBox() async {
    if (!Hive.isBoxOpen('mybox')) {
      await Hive.openBox('mybox');
      print("Hive opened");
    }
    userbase.loadData();
    await userbase.getUserName();
  }

  @override
  Widget build(BuildContext context) {
    var userDetails = userbase.savedUsers[userbase.currentUser]?["details"];
    final currentUserName = userbase.currentUser_name;
    final userProfileImage = userDetails?["Photo"];
    final imageProvider =
        userProfileImage != null && File(userProfileImage).existsSync()
            ? FileImage(File(userProfileImage))
            : const AssetImage("Assets/StudentPortal/avatarDefault.png");

    // Null Safety
    String studentName = (userDetails?["Name"]?.isNotEmpty ?? false)
        ? userDetails!["Name"]
        : userbase.currentUser_name;
    String studentRoll = (userDetails?["Roll"]?.isNotEmpty ?? false)
        ? userDetails!["Roll"]
        : "Roll#";
    String studentProgram = (userDetails?["Program"]?.isNotEmpty ?? false)
        ? userDetails!["Program"]
        : "Program";

    // Scaffold
    return Scaffold(
      // Main color
      backgroundColor: const Color.fromARGB(255, 193, 194, 201),

      // Appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 6,
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  print(">>>>>>>>>>>>>>Details: $userDetails");
                });
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined))
        ],
      ),
      body: FutureBuilder<void>(
        future: openHiveBox(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              userbase.savedUsers.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Handle error
            return const Center(child: Text("Error loading data"));
          } else {
            // Data loaded, build the profile UI
            var userDetails =
                userbase.savedUsers[userbase.currentUser]?["details"];
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: double.infinity,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white70,
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 100,
                                  backgroundImage:
                                      imageProvider as ImageProvider,
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(160, 180),
                                child: IconButton.filled(
                                  onPressed: () async {
                                    final pickedPhoto = await img.pickImage(
                                        source: ImageSource.gallery);

                                    if (pickedPhoto != null) {
                                      setState(() {
                                        profilePicture = File(pickedPhoto
                                            .path); // Update the profile picture state
                                        userDetails?["Photo"] = pickedPhoto
                                            .path; // Update the userDetails photo path
                                      });
                                      userbase
                                          .updateData(); // Save the updated data to Hive
                                      print(
                                          "Photo changed for user: ${userbase.savedUsers[userbase.currentUser]?["details"]?["Photo"]}");
                                      print(
                                          "Full details: ${userbase.savedUsers[userbase.currentUser]?["details"]}");
                                    } else {
                                      // Handle the case when no image is selected
                                      print("No image selected");
                                    }
                                  },
                                  icon: const Icon(Icons.camera_alt),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.blue[300],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            studentName,
                            style: GoogleFonts.montserrat().copyWith(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          // Title
                          Text(
                            "$studentRoll |  $studentProgram",
                            style: GoogleFonts.montserrat().copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 30),

                          // Details main
                          Details(heading: "Name:", text: studentName),
                          Details(
                              heading: "Gender:", text: userDetails?["Gender"]),
                          Details(
                              heading: "Blood:", text: userDetails?["Blood"]),
                          Details(
                              heading: "Roll#:", text: userDetails?["Roll"]),
                          Details(
                              heading: "Program:",
                              text: userbase.savedUsers[userbase.currentUser]
                                  ?["details"]?["Program"]),
                          Details(
                              heading: "Batch:", text: userDetails?["Batch"]),
                          Details(heading: "City:", text: userDetails?["City"]),
                          Details(
                              heading: "Phone:", text: userDetails?["Phone"]),
                          Details(
                              heading: "Email:", text: userbase.currentUser),

                          // Edit Details button
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 55),
                                  backgroundColor: Colors.white),
                              onPressed: () async {
                                // Navigate to ProfileEdit screen and wait for it to pop
                                await Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (_) => ProfileEdit(),
                                  ),
                                );

                                // When coming back, refresh the state
                                setState(() {
                                  openHiveBox();
                                });
                              },
                              child: const Text(
                                "Edit details",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

Widget Details({String heading = "Name:", String text = "Student Name"}) {
  return Padding(
    padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              heading,
              style: GoogleFonts.montserrat().copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Text(
              text,
              maxLines: 3,
              style: GoogleFonts.montserrat().copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
            ),
          ],
        ),
        const Divider()
      ],
    ),
  );
}
