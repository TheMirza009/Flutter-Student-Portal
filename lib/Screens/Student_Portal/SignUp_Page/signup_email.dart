import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/titleAndText.dart';
import 'package:flutter_test_application_1/Components/validButton.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/SignUp_Page/signup_password.dart';
import 'package:flutter_test_application_1/data/users_Database.dart';

class SignUp_EmailScreen extends StatefulWidget {
  final String username;

  const SignUp_EmailScreen({super.key, required this.username});

  @override
  State<SignUp_EmailScreen> createState() => _SignUp_EmailScreenState();
}

class _SignUp_EmailScreenState extends State<SignUp_EmailScreen> {
  UserDatabase userbase = UserDatabase();
  bool isEmailCorrect = false;

  final formKey1 = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final RegExp emailRegex = RegExp(
    r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
    caseSensitive: false,
  );

  @override
  void initState() {
    super.initState();
    userbase.loadData();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    void validNavigate() {
      if (formKey1.currentState?.validate() ?? false) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Email seems correct!"),
          ),
        );

        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => SignUp_PasswordScreen(
              email: emailController.text,
              username: widget.username,
            ),
          ),
        );
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
                  const Padding(
                    padding: EdgeInsets.all(22.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Please enter your email.",
                        style: TextStyle(fontSize: 15),
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
                            title: "Email",
                            controller: emailController,
                            borderUnderline: true,
                            onChanged: (value) {
                              // Only update the state if the email validation changes
                              bool newEmailCorrect = emailRegex.hasMatch(value);
                              if (newEmailCorrect != isEmailCorrect) {
                                setState(() {
                                  isEmailCorrect = newEmailCorrect;
                                });
                              }
                            },
                            suffixIcon: Icon(
                              Icons.check,
                              color: isEmailCorrect
                                  ? Colors.green
                                  : Colors.transparent,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This field cannot be left empty.";
                              } else if (!emailRegex.hasMatch(value)) {
                                return 'Please enter a valid email address.';
                              } else if (userbase.savedUsers.containsKey(value)) {
                                return "Account associated with this email already exists.";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  validButton(
                    buttonTitle: "Sign Up",
                    onPressed: validNavigate,
                    padding: const EdgeInsets.only(top: 00, bottom: 20),
                    buttonSize: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 20,
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
