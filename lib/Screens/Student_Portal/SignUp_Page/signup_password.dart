import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/dialog_Box.dart';
import 'package:flutter_test_application_1/Components/dialoguebox.dart';
import 'package:flutter_test_application_1/Components/titleAndText.dart';
import 'package:flutter_test_application_1/Components/validButton.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/SignUp_Page/signup_email.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/homescreen.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/loginPage.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/semesterPage.dart';
import 'package:flutter_test_application_1/data/users_Database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignUp_PasswordScreen extends StatefulWidget {
  final String email;
  final String username;
  const SignUp_PasswordScreen(
      {super.key, required this.email, required this.username});

  @override
  State<SignUp_PasswordScreen> createState() => _SignUp_PasswordScreenState();
}

class _SignUp_PasswordScreenState extends State<SignUp_PasswordScreen> {
  final myBox = Hive.box('mybox');
  UserDatabase userbase = UserDatabase();
  final formKey1 = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController_1 = TextEditingController();
  final passwordController_2 = TextEditingController();

  bool isPasswordCorrect = false;
  bool passwordsMatch = false;

  // @override
  // void initState() {
  //   super.initState();
  //   userbase.loadData();
  // }

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var password = userbase.password;
    String username = widget.username;
    String email = widget.email;

    CreateLogin() {
      // Validate function
      if (formKey1.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password saved successfully!"),
          ),
        );

        // Save Name in variable then print in console
        userbase.username = widget.username;
        userbase.email = widget.email;
        userbase.password = passwordController_2.text;
        userbase.addUser();
        // userbase.savedUsers[email] = {
        //   "password": password,
        //   "username": username,
        // };
        // userbase.updateData();

        // Navigate
        Future.delayed(Duration(milliseconds: 1000), () {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(builder: (_) => LoginPage()),
          );
        });
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
            child: Container(
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 22.0, right: 22, top: 22, bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Almost done!",
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
                              text:
                                  "Please choose a strong password that includes letters, numbers and a special character.",
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey1,
                      child: Column(
                        children: [
                          titleAndText(
                            title: "Password",
                            controller: passwordController_1,
                            borderUnderline: true,
                            obscureText: true,
                            onChanged: (value) {
                              setState(() {
                                isPasswordCorrect =
                                    value.isNotEmpty && value.length > 7;
                                passwordsMatch =
                                    passwordController_1.text.isNotEmpty &&
                                        passwordController_2.text.isNotEmpty &&
                                        passwordController_1.text ==
                                            passwordController_2.text;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password cannot be left empty.";
                              } else if (value.length < 8) {
                                return "Password must contain at least 8 characters.";
                              }
                              return null;
                            },
                            suffixIcon: Icon(
                              Icons.check,
                              color: isPasswordCorrect
                                  ? Colors.green
                                  : Colors.transparent,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          titleAndText(
                            title: "Confirm Password",
                            controller: passwordController_2,
                            borderUnderline: true,
                            obscureText: true,
                            onChanged: (value) {
                              setState(() {
                                passwordsMatch =
                                    passwordController_1.text.isNotEmpty &&
                                        passwordController_2.text.isNotEmpty &&
                                        passwordController_1.text ==
                                            passwordController_2.text;
                              });
                            },
                            suffixIcon: Icon(
                              Icons.check,
                              color: passwordsMatch
                                  ? Colors.green
                                  : Colors.transparent,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password cannot be left empty.";
                              } else if (!passwordsMatch) {
                                return "Passwords do not match.";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  validButton(
                    buttonTitle: "Sign Up",
                    onPressed: CreateLogin,
                    padding: const EdgeInsets.only(top: 00, bottom: 20),
                    buttonSize: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
