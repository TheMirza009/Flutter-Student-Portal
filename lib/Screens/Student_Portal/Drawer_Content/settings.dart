import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Components/dialog_Box.dart';
import 'package:flutter_test_application_1/Screens/Student_Portal/Drawer_Content/semesterPage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromARGB(255, 222, 222, 222),
                  width: 1.5,
                ),
                top: BorderSide(
                  color: Color.fromARGB(255, 222, 222, 222),
                  width: 1.5,
                ),
              ),
            ),
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogBox(
                      singleButton: false,
                      message: "Are you sure you want to delete all Logins?",
                      onPressYes: () async {
                        var box = await Hive.openBox('yourBoxName');
                        var userList = box.get('USERLIST');

                        if (userList is List) {
                          userList.clear();
                        } else if (userList is Map) {
                          userList.clear();
                        }

                        await box.put('USERLIST', userList);
                      },
                    );
                  },
                );
              },
              style: TextButton.styleFrom(
                shape: const LinearBorder(),
                fixedSize: const Size(double.maxFinite, 70),
                padding: EdgeInsets.zero, // Remove default padding
                backgroundColor: Colors
                    .transparent, // Ensure background is transparent if needed
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: montserratText(
                    text: "Delete all users",
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget settingItem(
    {required Widget title, required Widget widget, double padding = 8.0}) {
  return Padding(
    padding: EdgeInsets.all(padding),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title,
        widget,
      ],
    ),
  );
}
