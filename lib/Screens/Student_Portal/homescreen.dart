import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/DrawerButton.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/drawerContent.dart';
import 'package:flutter_test_application_1/Components/feed.dart';
import 'package:flutter_test_application_1/Components/iconCard.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/Profile/profile.dart';
import 'package:flutter_test_application_1/data/users_Database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserDatabase userbase;

  @override
  void initState() {
    super.initState();
    openHiveBox();
  }

  void openHiveBox() async {
    if (!Hive.isBoxOpen('mybox')) {
      await Hive.openBox('mybox');
      print("Hive opened");
    }
    userbase = UserDatabase();
    userbase.loadData();
    await userbase.getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Main color
      backgroundColor: const Color.fromARGB(255, 193, 194, 201),

      // Appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        elevation: 6,
        title: const Text(
          "Student Portal",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                userbase.loadData();
                print("Email: ${UserDatabase().currentUser}");
                print("Name: ${UserDatabase().currentUser_name}");
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined))
        ],
      ),

      // Drawer
      drawer: const DrawerContent(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Feed(),
        ),
      ),
    );
  }
}

Widget noData() {
  return Text(
    "There are no enrollments to show. Enroll in subjects to show content on the feed.",
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.grey[800],
    ),
  );
}
