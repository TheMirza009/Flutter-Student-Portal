import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/titleAndText.dart';
import 'package:flutter_test_application_1/Components/validButton.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/Drawer_Content/semesterPage.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/SignUp_Page/signup_email.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpNameScreen extends StatelessWidget {
  SignUpNameScreen({super.key});

  final RegExp nameFormat = RegExp(r'^[A-Za-z\s]+$');
  final formKey1 = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final signupName = "";

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    validNavigate() {
      // Validate function
      if (formKey1.currentState!.validate()) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text("Welcome, $signupName"),
        //   ),
        // );

        // Save Name in variable then print in console
        var signupName = nameController.text;
        print("Entered name: $signupName");

        // Navigate
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (_) => SignUp_EmailScreen(
                      username: signupName,
                    )));
        // builder: (_) => SemesterPage()));
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color.fromARGB(255, 205, 209, 212),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Expanded(
              child: Container(
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Welcome!",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: montserratText(
                                    text: "Please enter your name to continue.",
                                    size: 15))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Form(
                        key: formKey1,
                        child: Column(children: [
                          titleAndText(
                            title: "Name",
                            showTitle: false,
                            controller: nameController,
                            borderUnderline: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This field cannot be left empty.";
                              } else if (value == nameController.text &&
                                  value.length < 3) {
                                return "Name has to be longer than 3 letters.";
                              } else if (!nameFormat.hasMatch(value)) {
                                return "Name cannot contain any numbers or \nspecial characters.";
                              } else if (value.length > 30) {
                                return "Name must be 30 characters or less.";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ]),
                      ),
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, bottom:10),
                      child: Text(
                        "Please make sure that the name is your full name as registered on the CNIC card. Also make sure it does not contain any numbers or special characters.",
                        style: GoogleFonts.montserrat().copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: validButton(
                          buttonTitle: "Next",
                          onPressed: validNavigate,
                          padding: const EdgeInsets.only(top: 00, bottom: 20),
                          buttonSize: const EdgeInsets.symmetric(
                              horizontal: 85, vertical: 20)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
