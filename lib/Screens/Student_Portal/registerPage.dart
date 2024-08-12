import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/validButton.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/SignUp_Page/signup_Name.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/loginPage.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/signupPage.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 209, 212),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: Container(
              height: screenHeight * 0.65,
              width: screenWidth * 0.85,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 0),
                    child: Image.asset(
                      "Assets/StudentPortal/FlutterLogo.png",
                      height: 90,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 10),
                          child: Column(
                            children: [
                              Text(
                                "Welcome to Flutter Student Portal!",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 26),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Login or Sign up to to continue",
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, top: 20),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 110),
                                  side: BorderSide(width: 2)),
                              onPressed: (){
                                Navigator.push(context, 
                                CupertinoPageRoute(builder: (_) => LoginPage()));
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                        ),
                        validButton(
                            buttonTitle: "Sign up",
                            onPressed: () {
                              Navigator.push(context, 
                              CupertinoPageRoute(
                                builder: (_) => SignUp_NameScreen()));
                                // builder: (_) => SignUpPage()));
                            },
                            padding: EdgeInsets.only(bottom: 20),
                            buttonSize: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 80))
                      ],
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
}
