import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/validButton.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/Drawer_Content/semesterPage.dart';
import 'package:flutter_test_application_1/data/themeData.dart';

class CatFacts extends StatefulWidget {
  const CatFacts({super.key});

  @override
  State<CatFacts> createState() => _CatFactsState();
}

class _CatFactsState extends State<CatFacts> {
  final Dio dio = Dio();
  String catFact = "Cats have 2 ears.";
  bool isLoading = false;

  fetchCatFacts() async {
    setState(() {
      isLoading = true; // Set loading to true
    });

    try {
      var response = await dio.get("https://catfact.ninja/fact");
      setState(() {
        catFact = response.data['fact']; // Update the catFact
      });
    } catch (e) {
      print('Error fetching cat facts: $e');
      setState(() {
        catFact = "Failed to load fact.";
      });
    } finally {
      setState(() {
        isLoading = false; // Set loading to false after the request
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                isLoading
                    ? const CircularProgressIndicator(color: Colors.black87)
                    : montserratText(
                        text: catFact,
                        size: 20,
                        color: catFact == "Failed to load fact."
                            ? Colors.redAccent
                            : Colors.black),
                validButton(
                    buttonTitle: "Get Random Fact",
                    buttonSize: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 50.0),
                    onPressed: fetchCatFacts),
              ],
            ),
          ),
        ),
      ))),
    );
  }
}
