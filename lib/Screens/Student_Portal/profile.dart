import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/drawerContent.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? profilePicture;

  ImagePicker img = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Main color
        backgroundColor: Color.fromARGB(255, 193, 194, 201),

        // Appbar
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 6,
          title: const Text(
            "Profile",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.notifications_none_outlined))
          ],
        ),
        body: Center(
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
                child: Expanded(
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
                                  backgroundImage: profilePicture != null
                                      ? FileImage(profilePicture!)
                                      : AssetImage("Assets/StudentPortal/avatarDefault.png"),
                                  child: null),
                            ),
                            Transform.translate(
                              offset: const Offset(160, 180),
                              child: IconButton.filled(
                                onPressed: () async {
                                  final pickedPhoto = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                      print(pickedPhoto!.path);
                                  if (pickedPhoto != null) {
                                    setState(() {
                                      profilePicture = File(pickedPhoto.path);
                                    });
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
                          "Mirza AbdulMoeed",
                          style: GoogleFonts.montserrat().copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "19659  |  Computer Science",
                          style: GoogleFonts.montserrat().copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 30),
                        Details(heading: "Name:", text: "Mirza AbdulMoeed"),
                        Details(heading: "Gender:", text: "Male"),
                        Details(heading: "Blood:", text: "A+"),
                        Details(heading: "Roll#:", text: "RIUF-BSCS-19659"),
                        Details(heading: "Program:", text: "Computer Science"),
                        Details(heading: "Batch:", text: "Fall 2020-2024"),
                        Details(heading: "City:", text: "Faisalabad, Panjab"),
                        Details(heading: "Phone:", text: "0307-7707100"),
                        Details(heading: "Phone:", text: "0307-7707100"),
                        Details(
                            heading: "Email:",
                            text: "mirzaabdulmoed@gmail.com"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

Widget Details({String heading = "Name:", text = "Student Name"}) {
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
        Divider()
      ],
    ),
  );
}
