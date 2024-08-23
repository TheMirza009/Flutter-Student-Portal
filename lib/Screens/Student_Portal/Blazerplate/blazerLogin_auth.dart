import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/dialog_Box.dart';
import 'package:flutter_test_application_1/Components/titleAndText.dart';
import 'package:flutter_test_application_1/Components/validButton.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/Drawer_Content/semesterPage.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/SignUp_Page/signup_Name.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/countryList.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/homescreen.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/signupPage.dart';
import 'package:flutter_test_application_1/data/users_Database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BlazerLogin_Auth extends StatefulWidget {
  final String tenant;
  const BlazerLogin_Auth({super.key, required this.tenant});

  @override
  State<BlazerLogin_Auth> createState() => _BlazerLogin_AuthState();
}

class _BlazerLogin_AuthState extends State<BlazerLogin_Auth> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  double signUpTextSize = 13;
  String? backendEmail;
  String? backendPassword;
  String? backendTenant;
  String? userTenant;
  String apiError = "Authentication failed.";
  int? errorCode;
  late UserDatabase userbase;
  bool authentication = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getBackEnd();
  }

  getBackEnd() async {
    final Dio dio = Dio();
    const url = "https://binaryplatewebapi.azurewebsites.net/api/Account/Login";
    final data = {
      "email": emailController.text,
      "password": passwordController.text,
      "browser2FaPersistenceToken": widget.tenant
    };

    try {
      // Send POST request
      Response response = await dio.post(url,
          data: data,
          options: Options(headers: {"headers": "application/json"}));
      errorCode = response.statusCode;
      authentication = response.statusCode == 200;
      print("API Response: ${response.data}");

      // Error Handling
    } on DioException catch (e) {
      // Connection Timeout
      if (e.type == DioExceptionType.connectionTimeout) {
        print('Connection Timeout Exception');
        apiError = "Connection Timeout.";

        // Reception TImeout
      } else if (e.type == DioExceptionType.receiveTimeout) {
        print('Receive Timeout Exception');
        apiError = "Reception Timeout.";

        // Bad Response
      } else if (e.type == DioExceptionType.badResponse) {
        print('Bad Response: ${e.response?.statusCode}');
        apiError = "Incorrect Email or Password.";

        // Request cancelled.
      } else if (e.type == DioExceptionType.cancel) {
        print('Request Cancelled');
        apiError = "Request cancelled.";

        // Unexpected Error.
      } else {
        print('Unexpected error: ${e.message}');
      }
    } catch (e) {
      apiError = e.toString();
      print("ERROR: ${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    signupNavigate() {
      Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpPage()));
    }

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: montserratText(
                    text: "Login to \nBlazerPlate",
                    weight: FontWeight.bold,
                    size: 30,
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
                            return "This field cannot be left empty";
                          }
                        },
                        // icon: userbase.savedUsers.containsKey(emailController.text)
                        //     ? Colors.greenAccent
                        //     : Colors.transparent,
                      ),
                      titleAndText(
                        title: "Password",
                        controller: passwordController,
                        obscureText: true,
                        changePass: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Incorrect or empty password.";
                          }
                        },
                      ),
                      isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.black,
                            )
                          : validButton(
                              padding: const EdgeInsets.only(
                                top: 0,
                                left: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                if (formKey.currentState!.validate()) {
                                  await getBackEnd();
                                  print("Error Code: $errorCode");
                                  if (authentication) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Validation Successful"),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                    Navigator.pushReplacement(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (_) => CountryList()),
                                    );
                                    userbase.loginUser(emailController.text);
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CustomDialogBox(
                                          singleButton: true,
                                          message: apiError,
                                          onPressYes: () {},
                                        );
                                      },
                                    );
                                  }
                                }
                                setState(() {
                                  isLoading = false;
                                });
                              },
                            ),
                      Transform.translate(
                        offset: const Offset(8, -20.5),
                        child:  isLoading
                      ? null
                      : signUpLink(),
                      )
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

  Widget signUpLink() {
    return Row(
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
                  builder: (_) => SignUpNameScreen(),
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
    );
  }
}

// Hive InitSTate
// @override
//   void initState() {
//     super.initState();
//     // openHiveBox();
//   }

//   void openHiveBox() async {
//     if (!Hive.isBoxOpen('mybox')) {
//       await Hive.openBox('mybox');
//       print("Hive opened");
//     }
//     userbase = UserDatabase();
//     userbase.loadData();

//     // Debugging: Check if data is loaded properly
//     print("Saved users: ${userbase.savedUsers}");
//   }
