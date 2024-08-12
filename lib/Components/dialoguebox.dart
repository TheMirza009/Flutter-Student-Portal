import 'package:flutter/material.dart';

class DeleteDialogueBox extends StatelessWidget {
  DeleteDialogueBox({
    super.key,
    this.onPressYes,
    this.message = "Are you sure you want to delete all tasks?",
  });

  final void Function()? onPressYes; // Explicitly define the type
  final String message;
  final Color bgColor = const Color.fromARGB(255, 231, 231, 231);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
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
                          onPressed: () {
                            if (onPressYes != null) {
                              onPressYes!(); // Call the callback if it's defined
                            }
                            Navigator.of(context).pop(); // Close the dialog
                          },
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
          },
        );
      },
      icon: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.delete,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
