import 'package:flutter_test_application_1/data/UserDetails.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserDatabase {
  final myBox = Hive.box("mybox");
  Map savedUsers = {};

  // User credentials
  String username = "";
  String email = "";
  String password = "";
  String currentUser = '';

  // CurrentUser Properties
  String currentUser_name = '';

  // User details map for current user
  Map<String, dynamic> get userDetails {
    return savedUsers[currentUser]?["details"] ?? UserDetails.blankData;
  }

  // Create initial data for the database
  Future<void> createInitialData() async {
    savedUsers = {
      // "user01": "1234",
      // "user02": "5678",
      "mirzaabdulmoed@gmail.com": {
        "password": "1234",
        "details": UserDetails.dummyData
      }
    };
    await updateData(); // Ensure initial data is saved to Hive
  }

  // Load data from Hive
  Future<void> loadData() async {
    final data = await myBox.get("USERLIST");
    if (data != null && data is Map) {
      savedUsers = data;
      currentUser = await myBox.get("CURRENT_USER") ?? '';
      print("Data loaded from Hive: \n -${savedUsers.keys.join('\n -')}, \nCurrent User: $currentUser");
    } else {
      await createInitialData();
    }
  }

  Future<void> getUserName() async {
    currentUser = await myBox.get("CURRENT_USER") ?? '';
    if (currentUser.isNotEmpty) {
      currentUser_name = savedUsers[currentUser]?["username"] ?? "Student";
      print("Current logged in user:  $currentUser_name");
    } else {
      currentUser_name = "Student";
    }
  }

  // Update data in Hive
  Future<void> updateData() async {
    await myBox.put("USERLIST", savedUsers);
    print("List updated: $savedUsers");
  }

  // Login the user
  Future<void> loginUser(String user) async {
    currentUser = await myBox.get("CURRENT_USER") ?? '';
    if (currentUser.isEmpty) {
      currentUser = user;
      print("Logged in user: $currentUser");
      await myBox.put("CURRENT_USER", user);
    }
  }

  // Logout the user
  Future<void> logoutUser() async {
    print("Logging out user: $currentUser");
    currentUser = '';
    await myBox.put("CURRENT_USER", currentUser);
  }

  // Add a new user to the database
  Future<void> addUser() async {
    if (email.isNotEmpty && password.isNotEmpty) {
      await loadData();
      savedUsers[email] = {
        "password": password,
        "username": username,
        "details": UserDetails.blankData, // Initialize with default details
      };
      email = "";
      password = "";
      print("Total UserList: $savedUsers");
      await updateData(); // Update Hive with new data
    }
  }
}