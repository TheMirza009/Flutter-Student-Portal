import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/TextEditor.dart';

class NameEditor extends StatefulWidget {
  const NameEditor({super.key});
  @override
  State<NameEditor> createState() => _NameEditorState();
}

class _NameEditorState extends State<NameEditor> {
  final usernamecontroller = TextEditingController();
  dynamic iconColorChange = Colors.blueGrey;
  String userEntered = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 224, 225),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Welcome Text
              Text( "Welcome$userEntered!",
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),

              // Text Field
              NameField(
                controller: usernamecontroller,
                hintText: "Enter your name",
                obscureText: false,
                // onChangeText: (){
                //   iconColorChange = Colors.blue;
                // },
                iconColor: iconColorChange,
                iconFunction: (){setState(() {
                  userEntered = '';
                  usernamecontroller.clear();
                });}
              ),

              // Submit Button
              ElevatedButton(
                onPressed: () => setState(() {
                  userEntered = ", ${usernamecontroller.text}";
                }), 
                style: const ButtonStyle(foregroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 255, 255, 255))),
                child: const Text("Submit"),)
            ],
          ),
        ),
      ),
    );
  }
}
