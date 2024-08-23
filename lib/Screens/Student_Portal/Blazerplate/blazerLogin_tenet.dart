import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_application_1/Components/titleAndText.dart';
import 'package:flutter_test_application_1/Components/validButton.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/Blazerplate/blazerLogin_auth.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/Drawer_Content/semesterPage.dart';
import 'package:flutter_test_application_1/data/themeData.dart';
import 'package:flutter_test_application_1/data/users_Database.dart';

class Blazer_Login extends StatelessWidget {
  const Blazer_Login({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final tenantController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SvgPicture.asset(
                    "Assets/StudentPortal/blue.svg",
                    height: 200,
                    colorBlendMode: BlendMode.multiply,
                  ),
                ),
                Container(
                  // Removed height: double.infinity for better layout management
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white70,
                  ),
                  padding: const EdgeInsets.all(16.0), // Adjusted padding
                  child: Column(
                    // Minimize column height
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Title Text
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: montserratText(
                            text: "Enter Tenant", weight: FontWeight.bold),
                      ),

                      // Text Field
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Form(
                          key: formkey,
                          child: Column(children: [
                            titleAndText(
                              title: "Tenant",
                              showTitle: false,
                              controller: tenantController,
                              borderUnderline: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field cannot be left empty.";
                                } else if (value == tenantController.text &&
                                    value.length < 3) {
                                  return "Name has to be longer than 3 letters.";
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

                      // Validate Button
                      validButton(
                          buttonTitle: "Next",
                          buttonSize: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 80.0),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              var tenant = tenantController.text;
                              print("Entered name: $tenant");

                              // Navigate
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (_) => BlazerLogin_Auth(
                                    tenant: tenant,
                                  ),
                                ),
                              );
                            }
                          }),
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
