import 'package:flutter/material.dart';

const addIcon =  Icon(Icons.add, color: Colors.red, size: 100, );
class MyIcon extends StatelessWidget {
  const MyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        addIcon,
        Text("FIRST AID",),
      ],
    );
  }
}