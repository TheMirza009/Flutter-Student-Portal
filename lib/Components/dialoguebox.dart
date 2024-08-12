import 'package:flutter/material.dart';

class DeleteDialogueBox extends StatelessWidget {
   DeleteDialogueBox({super.key, this.onPressYes});

  final onPressYes;
  final bgColor = Color.fromARGB(255, 231, 231, 231);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: bgColor,
                  content: Container(
                    color: bgColor,
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Dialgoue Text
                        const Text(
                          "Are you sure you want to delete all tasks?",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 28, 28, 28)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Button 1
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 55),
                                    backgroundColor: Color.fromARGB(255, 255, 255, 255)),
                                onPressed: onPressYes,
                                child: const Text("Yes", style: TextStyle(color: Colors.black),)),

                            // Button 2
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 55),
                                backgroundColor: Colors.white
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text("No", style: TextStyle(color: Colors.black),),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        icon: const Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.delete,
            color: Colors.blueGrey,
          ),
        ));
  }
}
