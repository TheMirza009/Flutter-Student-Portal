import 'package:flutter/material.dart';

class TextFieldPlus extends StatelessWidget {
  const TextFieldPlus({
    super.key, 
    this.userController, 
    this.onPlusPressed,
    this.onSubmitted,
    });

  final userController;
  final onPlusPressed;
  final onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:5, bottom:8, left:10, right:10),
      child: Row(
        children: [
          // Child 1 : TextField wrapped in Expanded
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),

              // TextField itself
              child: TextField(
                onSubmitted: onSubmitted,
                controller: userController,
                cursorColor: Colors.blueGrey,
                style: const TextStyle(color: Color.fromARGB(255, 59, 59, 59)),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,

                  // Hint Styling
                  hintFadeDuration: Duration(milliseconds: 300),
                  hintText: "Enter new Task...",
                  hintStyle:
                      TextStyle(
                        color: Color.fromARGB(255, 135, 143, 147), 
                        fontWeight: FontWeight.normal, ),

                  // default border styling
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 207, 216, 220), 
                      width: 2),
                  ),

                  // active border styling
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 207, 216, 220), 
                        width: 2),
                  ),
                ),
              ),
            ),
          ),

          // Cild 2 : Icon
          ClipOval(
            child: Container(
              width: 60,
              height: 60,
              color: const Color.fromARGB(255, 199, 230, 255),
              child: IconButton(
                  onPressed: onPlusPressed,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black, 
                    size: 30, 
                    weight: 1)),
            ),
          )
        ],
      ),
    );
  }
}
