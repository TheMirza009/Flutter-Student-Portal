import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/taskButton.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 227, 227),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Child 1 : Heading
               Expanded(
                 child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Today's Tasks",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black87,
                                fontWeight: FontWeight.w700)),
                      ),
                 
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Taskbutton(taskName: "Task 2"),
                                Taskbutton(taskName: "Task 2"),
                                Taskbutton(taskName: "Task 2"),
                                Taskbutton(taskName: "Task 2"),
                                Taskbutton(taskName: "Task 2"),
                                Taskbutton(taskName: "Task 2"),
                                Taskbutton(taskName: "Task 2"),
                                Taskbutton(taskName: "Task 2"),
                                Taskbutton(taskName: "Task 2"),
                                Taskbutton(taskName: "Task 2"),
                              ],
                            ),
                          )
                        ),
                      )
                    ],
                  ),
                               ),
               ),

              // Child 3 : Row
              Row(
                children: [
                  // Child 1 : TextField wrapped in Expanded
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(
                            color: Color.fromARGB(255, 59, 59, 59)),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Enter new Task...",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 135, 143, 147)),
                          hintFadeDuration: Duration(milliseconds: 300),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 125, 125, 125),
                                width: 2.5),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 125, 125, 125),
                                width: 2.5),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Cild 2 : Icon
                  ClipOval(
                    child: Container(
                      width: 50,
                      height: 50,
                      color: const Color.fromARGB(255, 139, 190, 232),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add,
                              color: Colors.black, size: 30, weight: 1)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
