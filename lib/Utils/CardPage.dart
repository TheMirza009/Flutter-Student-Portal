import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key, required this.children});

  final children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 193, 194, 201),
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 35, bottom: 30),
              child: Container(
                height: double.infinity,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white70,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 45,
              left: 30,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Grey background color
                  shape: BoxShape.circle,
                ), // Circular background
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  ), // Customize the icon color
                  onPressed: () {
                    Navigator.pop(context); // Navigate back
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}