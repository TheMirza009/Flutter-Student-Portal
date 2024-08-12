import 'package:flutter/material.dart';

class Bulb extends StatefulWidget {
  const Bulb({super.key});

  @override
  State<Bulb> createState() => _BulbState();
}

class _BulbState extends State<Bulb> {
    bool light = false;
    
    void switchLight () {
      setState(() {
        light = !light;
        print("light: $light");
      });
    } 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(),
        body: Center(
          child: TextButton(
          onPressed: () => switchLight(),
          child: Image(
          image: light ? const AssetImage("../Assets/BulbOn.png") : const AssetImage("../Assets/BulbOff.png"),
          height: 300,))) ,
      );
  }
}