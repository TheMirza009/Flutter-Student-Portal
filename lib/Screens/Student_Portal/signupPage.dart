import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/titleAndText.dart';
import 'package:flutter_test_application_1/Components/validButton.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final formKey = GlobalKey<FormState>();

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
                height: screenHeight * 0.75,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        titleAndText(title: "*Name", borderUnderline: true),
                        const SizedBox(
                          height: 12,
                        ),
                        titleAndText(title: "*Email", borderUnderline: true),
                        const SizedBox(
                          height: 12,
                        ),
                        titleAndText(title: "*Username", borderUnderline: true),
                        const SizedBox(
                          height: 12,
                        ),
                        titleAndText(title: "*Password", borderUnderline: true),
                        const SizedBox(
                          height: 12,
                        ),
                        titleAndText(title: "*Confirm Password", borderUnderline: true),
                      ]),
                    ),
                    validButton(
                        buttonTitle: "Sign Up",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Validation Successful"),
                              ),
                            );
                          }
                        },
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
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
