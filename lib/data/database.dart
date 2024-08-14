import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List taskList = [];
  final myBox = Hive.box('mybox');

  void createInitialData () {
    taskList = [
      "Enter a new task", 
      "click + to add a new task",
      "Swipe to delete the task."
    ];

    
  }

  void loadData() {
    taskList = myBox.get("TASKLIST");
  }

  void updateData() {
    myBox.put("TASKLIST", taskList);
    print("List updated: $taskList");
  }
}