import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/titleAndText.dart';
import 'package:flutter_test_application_1/Components/validButton.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/homescreen.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/signupPage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  double signUpTextSize = 13;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    signupNavigate() {
      Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpPage()));
    }

    const users = {
      "user01": "1234",
      "user02": "5678",
      "user03": "91011",
    };

    bool containsUsername = users.containsKey(userNameController.text);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color.fromARGB(255, 205, 209, 212),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: Container(
              height: screenHeight * 0.6,
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Log in",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          titleAndText(
                              title: "Username",
                              controller: userNameController,
                              obscureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter something";
                                } else if (users.containsKey(value) &&
                                    value == userNameController.text) {
                                  return null;
                                } else if (!users.containsKey(value)) {
                                  return "Username does not exist.";
                                } else {
                                  return null;
                                }
                              },
                              icon: !containsUsername
                                  ? Colors.transparent
                                  : Colors.greenAccent),
                          titleAndText(
                            title: "Password",
                            controller: passwordController,
                            obscureText: true,
                            changePass: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter something";
                              } else if (users[userNameController.text] ==
                                  value) {
                                return null;
                              } else if (users[userNameController.text] !=
                                  value) {
                                return "Incorrect Password or username";
                              } else {
                                return null;
                              }
                            },
                          ),
                          validButton(
                            padding: const EdgeInsets.only(
                                top: 0, left: 10, right: 10, bottom: 10),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Validation Successful"),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (_) => HomeScreen()),
                                    (route) => false);
                              }
                            },
                          ),
                          Transform.translate(
                            offset: Offset(8, -20.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                      fontSize: signUpTextSize,
                                      color: Color.fromARGB(185, 0, 0, 0)),
                                ),
                                Transform.translate(
                                  offset: Offset(-5, 0),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                        overlayColor: Colors.transparent),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => SignUpPage()));
                                    },
                                    child: Text(
                                      "Sign up.",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 90, 168, 206),
                                          fontSize: signUpTextSize),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
