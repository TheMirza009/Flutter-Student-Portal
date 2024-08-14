import 'package:hive_flutter/hive_flutter.dart';

class UserDatabase {
  final myBox = Hive.box("mybox");
  Map savedUsers = {};

  // User credentials
  String username = "";
  String email = "";
  String password = "";

  // Create initial data for the database
  void createInitialData() {
    savedUsers = {
      // "user01": "1234",
      // "user02": "5678",
      "mirzaabdulmoed@gmail.com" : {"password" : "1234", "name" : "Mirza AbdulMoeed"}
    };
    updateData(); // Ensure initial data is saved to Hive
  }

  // Load data from Hive
  void loadData() {
    final data = myBox.get("USERLIST");
    if (data != null && data is Map) {
      savedUsers = data;
      print("Data loaded from Hive: $savedUsers");
    } else {
      createInitialData();
    }
  }

  // Update data in Hive
  void updateData() {
    loadData();
    myBox.put("USERLIST", savedUsers);
    print("List updated: $savedUsers");
  }

  // Add a new user to the database
  void addUser() {
    if (email.isNotEmpty && password.isNotEmpty) {
      // Add or update the user
      // savedUsers[email] = password;
      loadData();
      savedUsers[email] = {"password" : password, "username" : username,};
      email = "";
      password = "";
      print("Total UserList: $savedUsers");
      updateData(); // Update Hive with new data
    }
  }
}
