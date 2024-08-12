import 'package:flutter/material.dart';

class CustomDialogBox extends StatelessWidget {
  const CustomDialogBox({
    super.key,
    required this.onPressYes,
    this.message = "Are you sure you want to delete all tasks?",
  });

  final onPressYes;
  final String message;
  final Color bgColor = const Color.fromARGB(255, 231, 231, 231);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: bgColor,
      content: Container(
        color: bgColor,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Dialog Text
            Text(
              message,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 28, 28, 28),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Yes Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 55),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: onPressYes,
                  child: const Text(
                    "Yes",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                // No Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 55),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(), // Close the dialog
                  child: const Text(
                    "No",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
