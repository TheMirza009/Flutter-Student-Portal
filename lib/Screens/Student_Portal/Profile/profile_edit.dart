import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/titleAndText.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final RegExp nameFormat = RegExp(r'^[A-Za-z\s]+$');
  final formKey1 = GlobalKey<FormState>();
  final nameController = TextEditingController();
    return Scaffold(
      // Main color
      backgroundColor: const Color.fromARGB(255, 193, 194, 201),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white70,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Padding(
                          padding: const EdgeInsets.only(left: 45.0),
                          child: Text(
                            "Edit Personal Details",
                            style: GoogleFonts.montserrat().copyWith(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        titleAndText(
                          title: "Name",
                          controller: TextEditingController(),
                          obscureText: false,
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
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // Grey background color
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Navigate back
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
