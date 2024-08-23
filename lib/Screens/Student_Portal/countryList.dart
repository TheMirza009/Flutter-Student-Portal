import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/validButton.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/Drawer_Content/semesterPage.dart';
import 'package:flutter_test_application_1/data/themeData.dart';
import 'package:math_expressions/math_expressions.dart';

class CountryList extends StatefulWidget {
  CountryList({super.key});

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {

  @override
  void initState() {
    super.initState();
    getCountries();
  }

  getCountries() async {
    try {
      Dio dio = Dio();
      const url = "https://restcountries.com/v3.1/all";
      Response response = await dio.get(url);
      countries = response.data;
      List<String> fetchedCountryNames = countries
          .map((country) => country['name']['common'].toString())
          .toList();
      fetchedCountryNames.sort();
      setState(() {
        
        countryNames = fetchedCountryNames; 
        isLoading = false;
      });
      print("$countryNames\n");
    } catch (e) {
      print("API Error: $e");
    }
  }

  String? selectedCountry;
  var countryList = ["Pakistan", "Argentina", "Mongolia"];
  var countryNames = ["China", "Japan", "Mongolia"];
  bool isLoading = true;
  List<dynamic> countries = [];
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
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
                  montserratText(text: "Countries", weight: FontWeight.bold),
                  SizedBox(height: 20), // Added spacing
                  isLoading ? CircularProgressIndicator(color: Colors.black,) : countryDropDown(), // Added the dropdown here
                  validButton(onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Country selected: $selectedCountry"), duration: Duration(seconds: 2))
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget countryDropDown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectedCountry,
        hint: Text("Select a country"), // Added hint text
        isExpanded: true, // Makes the dropdown full width
        // items: countryList.map(
        items: countryNames.map(
          (String value) {
            return DropdownMenuItem(
              value: value,
              child: montserratText(text: value, size: 13),
            );
          },
        ).toList(),
        onChanged: (newVal) {
          setState(() {
            selectedCountry = newVal;
          });
        },
      ),
    );
  }
}
