import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/feed.dart';
import 'package:flutter_test_application_1/Components/userCard.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/Profile/profile.dart';
import 'package:flutter_test_application_1/Utils/userCard_Skeleton';
import 'package:flutter_test_application_1/data/users_Database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GetStartedSection extends StatefulWidget {
  const GetStartedSection({super.key});

  @override
  State<GetStartedSection> createState() => _GetStartedSectionState();
}

class _GetStartedSectionState extends State<GetStartedSection> {
  late UserDatabase userbase;

  @override
  void initState() {
    super.initState();
    openHiveBox();
  }

  Future<void> openHiveBox() async {
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
    bool ProfileDataExists = userbase.savedUsers[userbase.currentUser]?["details"]?["Photo"].isNotEmpty ?? false;
    return FutureBuilder(
      future: openHiveBox(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // return const CircularProgressIndicator();
          return UserCardSkeleton();
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          String userFirstName = userbase.currentUser_name.split(' ')[0];
          Feed f = Feed();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    f.ProfileDataExists
                        ? const SizedBox.shrink()
                        : const Text(
                            "Get started",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                  ],
                ),
              ),
              UserCard(
                subjectTitle: "Welcome, $userFirstName!",
                description: ProfileDataExists
                    ? "Click to view profile."
                    : "Click to add Profile data.",
                titleOnly: false,
                trailing: false,
                subjectTitleSize: 18,
                onPressed: () async {
                  await Future.delayed(const Duration(milliseconds: 200), () async {
                     await Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const Profile(),
                      ),
                    );
                    setState(() {
                      openHiveBox();
                    });
                  });
                },
              ),
              const SizedBox(
                height: 0,
              ),
              Divider(
                color: Colors.blueGrey[300],
              ),
            ]),
          );
        }
      },
    );
  }
}
