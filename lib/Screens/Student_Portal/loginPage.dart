import 'package:flutter/cupertino.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/SignUp_Page/signup_Name.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/signupPage.dart';
import 'package:flutter_test_application_1/data/users_Database.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/titleAndText.dart';
import 'package:flutter_test_application_1/Components/validButton.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/homescreen.dart';
import 'package:flutter_test_application_1/data/users_Database.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  double signUpTextSize = 13;

  late UserDatabase userbase;

  @override
void initState() {
  super.initState();
  openHiveBox();
}

void openHiveBox() async {
  if (!Hive.isBoxOpen('mybox')) {
    await Hive.openBox('mybox');
    print("Hive opened");
  }
  userbase = UserDatabase();
  userbase.loadData(); // Load data after box is opened
}


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    signupNavigate() {
      Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpPage()));
    }

    final users = userbase.savedUsers;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color.fromARGB(255, 205, 209, 212),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: screenHeight * 0.6,
            width: screenWidth * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleAndText(
                        title: "Email",
                        controller: emailController,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter something";
                          } else if (users.containsKey(value)) {
                            return null;
                          } else {
                            return "account does not exist.";
                          }
                        },
                        icon: users.containsKey(emailController.text)
                            ? Colors.greenAccent
                            : Colors.transparent,
                      ),
                      titleAndText(
                        title: "Password",
                        controller: passwordController,
                        obscureText: true,
                        changePass: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter something";
                          } else if (users[emailController.text]?['password'] == value) {
                            return null;
                          } else {
                            return "Incorrect Password or email";
                          }
                        },
                      ),
                      validButton(
                        padding: const EdgeInsets.only(
                          top: 0,
                          left: 10,
                          right: 10,
                          bottom: 10,
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Validation Successful"),
                                duration: Duration(seconds: 3),
                              ),
                            );
                            Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(builder: (_) => HomeScreen()),
                            );
                          }
                        },
                      ),
                      Transform.translate(
                        offset: const Offset(8, -20.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontSize: signUpTextSize,
                                color: const Color.fromARGB(185, 0, 0, 0),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(-5, 0),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  overlayColor: Colors.transparent,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => SignUp_NameScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Sign up.",
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 90, 168, 206),
                                    fontSize: signUpTextSize,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
