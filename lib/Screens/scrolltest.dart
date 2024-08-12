import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/dialoguebox.dart';
import 'package:flutter_test_application_1/Components/taskButton.dart';
import 'package:flutter_test_application_1/Components/textPlus.dart';
import 'package:flutter_test_application_1/data/database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ScrollTest extends StatefulWidget {
  const ScrollTest({super.key});

  @override
  State<ScrollTest> createState() => _ScrollTestState();
}

class _ScrollTestState extends State<ScrollTest> {
  final myBox = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    if (myBox.get("TASKLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    // TODO: implement initState
    super.initState();
  }

  addNewTask() {
    setState(() {
      if (taskController.text == '') {
        // ignore: avoid_print
        print("érror");
      } else {
        newItem = taskController.text;
        db.taskList.add(newItem);
        taskController.clear();
        db.updateData();
      }
    });
  }

  void deleteAll(){
    setState(() {
      db.taskList = [];
      db.updateData();
    });
  }

  // List taskButtonList = [
  //   Taskbutton(taskName: "Work from home"),
  //   Taskbutton(taskName: "Complete app"),
  //   Taskbutton(taskName: "Create new code"),
  //   Taskbutton(taskName: "Work from home"),
  //   Taskbutton(taskName: "Complete app"),
  //   Taskbutton(taskName: "Create new code"),
  //   Taskbutton(taskName: "Work from home"),
  //   Taskbutton(taskName: "Complete app"),
  //   Taskbutton(taskName: "Create new code"),
  // ];

  String newItem = '';
  final taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 210, 212),
      body:

          // Column
          Column(
        children: [
          // App Title
          Container(
            alignment: Alignment.bottomLeft,
            height: (screenHeight * 0.165),
            color: const Color.fromARGB(255, 205, 210, 212),
            child: Padding(
              padding: EdgeInsets.only(
                left: 15,
                bottom: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Today's Tasks",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700)),

                  // Delete All Button
                  DeleteDialogueBox(onPressYes: deleteAll,)
                ],
              ),
            ),
          ),

          // Tasks List

          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8.0, left: 8, right: 8, bottom: 0),
              child: ListView.builder(
                itemCount: db.taskList.length,
                itemBuilder: (context, index) {
                  final item = db.taskList[index];

                  return Taskbutton(
                    taskName: db.taskList[index],
                    onTaskPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: SizedBox(
                                height: 120,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text("Hello world"),
                                    ElevatedButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text("Ok."))
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    onDeletePressed: (context) {
                      setState(() {
                        db.taskList.removeAt(index);
                        db.updateData();
                      });
                    },
                  );
                },
                padding: const EdgeInsets.only(top: 10, bottom: 50),
              ),
            ),
          ),

          // Dismissible(
          //           key: Key(item),
          //           onDismissed: (end) {
          //             setState(() {  db.taskList.removeAt(index);},
          //             );
          //           },
          //           child:

          // TextField and Plus button
          TextFieldPlus(
            userController: taskController,
            onPlusPressed: addNewTask,
            onSubmitted: (item) => setState(() {
              db.taskList.add(item);
              taskController.clear();
              db.updateData();
            }),
          )
        ],
      ),
    );
  }
}
