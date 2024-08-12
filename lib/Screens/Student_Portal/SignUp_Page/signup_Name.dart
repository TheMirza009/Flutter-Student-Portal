import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/titleAndText.dart';
import 'package:flutter_test_application_1/Components/validButton.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/semesterPage.dart';

class SignUp_NameScreen extends StatelessWidget {
  SignUp_NameScreen({super.key});

  final formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
                height: screenHeight * 0.35,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(12)),
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
                                    fontWeight: FontWeight.bold,),
                              ),
                            ),
                            Align(alignment: Alignment.bottomLeft, child: montserratText(text: "Please enter your name to continue.", size: 15))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        titleAndText(title: "Name", borderUnderline: true),
                        const SizedBox(
                          height: 10,
                        ),
                        
                      ]),
                    ),
                    validButton(
                        buttonTitle: "Sign Up",
                        onPressed: () {
                          if (formKey1.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Validation Successful"),
                              ),
                            );
                          }
                        },
                        padding: const EdgeInsets.only(top: 00, bottom: 20),
                        buttonSize:
                            const EdgeInsets.symmetric(horizontal: 80, vertical: 20))
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