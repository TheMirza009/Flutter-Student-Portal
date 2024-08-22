import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/titleAndText.dart';
import 'package:flutter_test_application_1/data/users_Database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  String? selectedBloodGroup = "";
  double distance = 15;
  bool isLoading = true; // Add a loading state
  final RegExp nameFormat = RegExp(r'^[A-Za-z\s]+$');
  final nameController = TextEditingController();
  final rollController = TextEditingController();
  final cityController = TextEditingController();
  final batchController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey1 = GlobalKey<FormState>();
  final UserDatabase userbase = UserDatabase();

  @override
  void initState() {
    super.initState();
    openHiveBox();
  }

  Future<void> openHiveBox() async {
    if (!Hive.isBoxOpen('mybox')) {
      await Hive.openBox('mybox');
      print("Hive opened");
    }
    await userbase.loadData();
    await userbase.getUserName();
    setState(() {
      isLoading =
          false; // Data has been loaded, stop showing the loading indicator
    });
  }

  @override
  Widget build(BuildContext context) {
    var userDetails = userbase.savedUsers[userbase.currentUser]?["details"];
    var userGender =
        userbase.savedUsers[userbase.currentUser]?["details"]?["Gender"];
    var userRoll =
        userbase.savedUsers[userbase.currentUser]?["details"]?["Roll"];
    var userBlood =
        userbase.savedUsers[userbase.currentUser]?["details"]?["Blood"];
    var userCity =
        userbase.savedUsers[userbase.currentUser]?["details"]?["City"];
    var userBatch =
        userbase.savedUsers[userbase.currentUser]?["details"]?["Batch"];
    var userPhone =
        userbase.savedUsers[userbase.currentUser]?["details"]?["Phone"];
    selectedBloodGroup =
        userbase.savedUsers[userbase.currentUser]?["details"]?["Blood"] ?? "";

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 193, 194, 201),
      body: SafeArea(
        child: Center(
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
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 39, 39, 39),
                        )) // Show loading indicator while data is loading
                      : SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Form(
                              key: formKey1,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildTitle(),
                                  const SizedBox(height: 20),
                                  _buildNameField(),
                                  SizedBox(height: distance),
                                  _buildRollNumberField(),
                                  SizedBox(height: distance),
                                  _buildGenderField(),
                                  SizedBox(height: distance),
                                  _buildBloodGroupField(),
                                  SizedBox(height: distance),
                                  _buildCityField(),
                                  SizedBox(height: distance),
                                  _buildBatchField(),
                                  SizedBox(height: distance),
                                  _buildPhoneField(),
                                  SizedBox(height: distance),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        fixedSize:
                                            const Size(double.maxFinite, 10),
                                        backgroundColor: Colors.white),
                                    onPressed: () async {
                                      // Print test
                                      print(
                                          "From ProfileEdit => Current User: ${userbase.currentUser_name}");

                                      // Validation function
                                      if (formKey1.currentState!.validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text("Details Saved."),
                                            duration: Duration(seconds: 3),
                                          ),
                                        );

                                        // Update Safety
                                        String nameUpdate =
                                            nameController.text.isNotEmpty
                                                ? nameController.text
                                                : userDetails["Name"];

                                        String rollUpdate =
                                            rollController.text.isNotEmpty
                                                ? rollController.text
                                                : userDetails["Roll"];

                                        String cityUpdate =
                                            cityController.text.isNotEmpty
                                                ? cityController.text
                                                : userDetails["City"];

                                        String batchUpdate =
                                            batchController.text.isNotEmpty
                                                ? batchController.text
                                                : userDetails["Batch"];

                                        String phoneUpdate =
                                            phoneController.text.isNotEmpty
                                                ? phoneController.text
                                                : userDetails["Phone"];

                                        // Assignments
                                        await userbase.updateUserDetails(
                                            name: nameUpdate,
                                            bloodGroup: selectedBloodGroup,
                                            roll: rollUpdate,
                                            city: cityUpdate,
                                            batch: batchUpdate,
                                            phone: phoneUpdate,
                                            program: "Computer Science");

                                        // Print updates
                                        print(
                                            "Name assigned: ${userbase.currentUser_name}");
                                        print("Assigned Roll#: $userRoll");
                                        print("Assigned Gender: $userGender");
                                        print(
                                            "Assigned Blood Group: $userBlood");
                                        print(
                                            "Assigned User Batch: $userBatch");
                                        print("Assigned City Batch: $userCity");
                                        print(
                                            "Assigned ٗUSer Phone: $userPhone");

                                        // finally, save the data
                                        await userbase.updateData();
                                        print("New profile data: $userDetails");

                                        // Navigation
                                        Future.delayed(
                                            const Duration(milliseconds: 1000),
                                            () {
                                          Navigator.pop(context);
                                        });
                                      }
                                    },
                                    child: const Text(
                                      "Save details",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                ),
                _buildBackButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: Text(
        "Edit Personal Details",
        style: GoogleFonts.montserrat().copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 5, top: 10),
          child: Text(
            "Name",
            style: GoogleFonts.montserrat().copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        titleAndText(
          title: "Name",
          showTitle: false,
          controller: nameController,
          hintText: userbase.savedUsers[userbase.currentUser]?["details"]
                ?["Name"],
          borderUnderline: false,
          paddingHorizontal: 15,
          titleStyle: GoogleFonts.montserrat().copyWith(color: Colors.black54),
          validator: (value) {
            if (value != null && value.isNotEmpty) {
              if (value.length < 3) {
                return "Name has to be longer than 3 letters.";
              } else if (!nameFormat.hasMatch(value)) {
                return "Name cannot contain any numbers or special characters.";
              } else if (value.length > 30) {
                return "Name must be 30 characters or less.";
              }
            }
            return null;
          },
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 10, bottom: 20, top: 5),
          child: Text(
            "Please make sure that the name is your full name as registered on the CNIC card. Also make sure it does not contain any numbers or special characters.",
            style: GoogleFonts.montserrat().copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRollNumberField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: shortTextField(
        controller: rollController,
        title: "Roll#:",
        hintText: userbase.savedUsers[userbase.currentUser]?["details"]
                ?["Roll"] ??
            "12345",
        maxLength: 5,
        numbersOnly: true,
        validator: (value) {
          if (value != null && value.isNotEmpty) {
            if (int.tryParse(value) == null) {
              return "Please enter a valid number.";
            } else if (value.length <= 4) {
              return "Roll number is incomplete.";
            }
          }
          return null; // No validation error if field is blank
        },
      ),
    );
  }

  Widget _buildGenderField() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 10, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Gender:",
            style: GoogleFonts.montserrat().copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          genderSlider(),
        ],
      ),
    );
  }

  Widget _buildBloodGroupField() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Blood Group:",
            style: GoogleFonts.montserrat().copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: bloodGroupDropdown(),
          ),
        ],
      ),
    );
  }

  Widget _buildCityField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: shortTextField(
        controller: cityController,
        title: "City:",
        hintText: userbase.savedUsers[userbase.currentUser]?["details"]
                ?["City"] ??
            "Faisalabad",
        maxLength: 20,
        validator: (value) {
          // if (value == null || value.isEmpty) {
          //   return "Please enter a city.";
          // }
          // return null;
        },
      ),
    );
  }

  Widget _buildBatchField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: shortTextField(
        controller: batchController,
        title: "Batch:",
        hintText: userbase.savedUsers[userbase.currentUser]?["details"]
                ?["Batch"] ??
            "Sessional year",
        validator: (value) {
          // if (value == null || value.isEmpty) {
          //   return "Enter your batch.";
          // }
          // return null;
        },
      ),
    );
  }

  Widget _buildPhoneField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: shortTextField(
        controller: phoneController,
        title: "Phone:",
        hintText: userbase.savedUsers[userbase.currentUser]?["details"]
                ?["Phone"] ??
            "090078601",
        maxLength: 11,
        numbersOnly: true,
        validator: (value) {
          if (value != null && value.isNotEmpty) {
            if (int.tryParse(value) == null) {
              return "Please enter a valid number.";
            } else {
              return null;
            }
          }
        },
      ),
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      top: 10,
      left: 10,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Widget genderSlider() {
    return CustomSlidingSegmentedControl<int>(
      initialValue: 1,
      children: {
        1: montserratText(text: "Male", size: 13),
        2: montserratText(text: "Female", size: 13)
      },
      decoration: BoxDecoration(
        color: CupertinoColors.lightBackgroundGray,
        borderRadius: BorderRadius.circular(8),
      ),
      thumbDecoration: BoxDecoration(
        color: const Color.fromARGB(211, 255, 255, 255),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            blurRadius: 4.0,
            spreadRadius: 1.0,
            offset: const Offset(0.0, 2.0),
          ),
        ],
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      onValueChanged: (value) {
        setState(() {
          userbase.savedUsers[userbase.currentUser]?["details"]?["Gender"] =
              value == 1 ? "Male" : "Female";
          print(
              "Assigned Gender: ${userbase.savedUsers[userbase.currentUser]?["details"]?["Gender"]}");
        });
      },
    );
  }

  Widget bloodGroupDropdown() {
  return FormField<String>(
    validator: (value) {
      // Use value from FormFieldState
      if (value == null || value.isEmpty) {
        return "Select a blood group.";
      }
      return null;
    },
    builder: (FormFieldState<String> state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0), // Adjusted for better fit
            decoration: BoxDecoration(
              color: CupertinoColors.lightBackgroundGray,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(125, 0, 0, 0).withOpacity(.3),
                  blurRadius: 4.0,
                  spreadRadius: 0.0,
                  offset: const Offset(0.0, 2.0),
                ),
              ],
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: state.value, // Use FormField's value
                items: ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: montserratText(text: value, size: 13),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    state.didChange(newValue); // Notify the state of change
                    selectedBloodGroup = newValue; // Update the state variable
                    userbase.savedUsers[userbase.currentUser]?["details"]?["Blood"] = newValue;
                  });
                },
                icon: const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          // Display the error message below the dropdown
          if (state.hasError)
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                state.errorText ?? '',
                style: const TextStyle(
                  color: Color.fromARGB(255, 173, 37, 37),
                  fontSize: 12.0,
                ),
              ),
            ),
        ],
      );
    },
  );
}


  Widget montserratText({required String text, double size = 14}) {
    return Text(
      text,
      style: GoogleFonts.montserrat().copyWith(
        fontSize: size,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget shortTextField(
      {required String title,
      required String? Function(String?) validator,
      String hintText = "12345",
      int? maxLength,
      bool numbersOnly = false,
      required controller}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 5, top: 10),
          child: Text(
            title,
            style: GoogleFonts.montserrat().copyWith(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 155,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),

            // TextFormField
            child: TextFormField(
              controller: controller,
              maxLength: maxLength,
              keyboardType:
                  numbersOnly ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(
                counterText: '', // Hide the counter
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black38,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 212, 212, 212),
                    width: 2.5,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              validator: validator,
            ),
          ),
        ),
      ],
    );
  }
}
