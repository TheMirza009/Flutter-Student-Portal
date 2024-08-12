import 'package:flutter/material.dart';

class DrawerOption extends StatelessWidget {
  final onPressFunction;
  final icon;
  String buttonTitle;
  
  DrawerOption({
    super.key,
    this.onPressFunction,
    this.buttonTitle = "Attendance",
    this.icon,
    });

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(top:0),
      child: Column(
        children: [
           
           Container(
            height: 2,
            width: double.infinity,
            color: Colors.grey[200],
           ),
      
          TextButton(
            style: TextButton.styleFrom(
              overlayColor: Colors.grey,
              fixedSize: const Size(double.maxFinite, 67),
              shape: const BeveledRectangleBorder(),
            ),
            onPressed: onPressFunction,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                     Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: icon,
                    ),
                    Text(buttonTitle, style: TextStyle(color: Colors.grey[800]),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
