import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Taskbutton extends StatefulWidget {
  Taskbutton({
    super.key, 
    required this.taskName, 
    this.onTaskPressed, 
    this.onDeletePressed,});

  String taskName = "Task"; 
  final onTaskPressed;
  final onDeletePressed;

  @override
  State<Taskbutton> createState() => _TaskbuttonState();
}

class _TaskbuttonState extends State<Taskbutton> {
  double cornerRadius = 12;

  printFunction(BuildContext){
    print("F");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, right: 10, left:10, top:0),
      child: Slidable(
        closeOnScroll: true,
        endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: widget.onDeletePressed,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(0),),

              SlidableAction(
              onPressed: printFunction(context),
              icon: Icons.info,
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 151, 197, 151),
              borderRadius: const BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12))),



          ]),
          

          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 70), // Width and height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(12), 
                  topLeft: const Radius.circular(12),
                  topRight: Radius.circular(cornerRadius),
                  bottomRight: Radius.circular(cornerRadius))),
              padding: const EdgeInsets.only(left: 30.0), // Padding inside the button
              elevation: 0,
            ),
            onPressed: widget.onTaskPressed,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.taskName,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17
                ),
              ),
            ),
          ),
        ),
      );
  }
}
