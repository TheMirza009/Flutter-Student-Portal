import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
   AboutSection({super.key});

  var titleText = const Text("About", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900,),);
  var paragrapgh = const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: [
          Align(alignment: Alignment.centerLeft, child: titleText),
          const SizedBox(
            height: 20,
          ),
          paragrapgh,
        ],),
      ),
    );
  }
}