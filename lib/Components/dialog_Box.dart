import 'package:flutter/material.dart';

class CustomDialogBox extends StatelessWidget {
  CustomDialogBox({
    super.key,
    required this.onPressYes,
    this.message = "Are you sure you want to delete all tasks?",
    required this.singleButton,
  });

  final VoidCallback onPressYes;
  final String message;
  final Color bgColor = const Color.fromARGB(255, 231, 231, 231);
  final bool singleButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: bgColor,
      content: Container(
        color: bgColor,
        child: Column(
          mainAxisSize: MainAxisSize.min, // Adjusts height based on content
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
            const SizedBox(height: 20), // Add space between text and buttons
            singleButton
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(), // Close the dialog
                    child: const Text(
                      "OK",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                : Row(
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
