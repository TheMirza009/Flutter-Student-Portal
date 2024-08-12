import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/Screens/about.dart';
import 'package:flutter_test_application_1/Components/bulb.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  int dispVal = 0; // Declare dispVal as a state variable

  String result = '0';
  String equation = '0';
  String expression = '';

  Widget calButton(
    String number,
    Color textcolor, {
    double numSize = 20,
    double btnWidth = 80,
  }) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 80,
      width: btnWidth,
      child: TextButton(
          onPressed: () {
            setState(() {
              if (equation == '') {
                equation = '0';
              } else if (equation == '0') {
                number == "A/C" || number == "⌫" || number == "="
                    ? equation = '0'
                    : equation = number;
              } else if (number == '⌫') {
                equation = equation.substring(0, equation.length - 1);
              } else if (number == 'A/C') {
                equation = '0';
              } else if (number == "=") {
                String expression =
                    equation.replaceAll('×', '*').replaceAll('÷', '/');

                try {
                  Parser p = Parser();
                  Expression exp = p.parse(expression);
                  ContextModel cm = ContextModel();
                  double eval = exp.evaluate(EvaluationType.REAL, cm);
                  equation = eval.toString();
                } catch (e) {
                  print('Error evaluating expression: $e');
                  equation = 'Error';
                }
              } else {
                if (equation == '0' || equation == result) {
                  equation = number;
                } else {
                  equation += number;
                }
              }
            });
          },
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 40, 37, 37),
          ),
          child: Text(
            number,
            style: TextStyle(color: textcolor, fontSize: numSize),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    var buttonRow1 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        calButton('1', Colors.white),
        calButton('2', Colors.white),
        calButton('3', Colors.white),
        calButton('⌫', Colors.deepOrangeAccent, numSize: 26),
      ],
    );

    var buttonRow2 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        calButton('4', Colors.white),
        calButton('5', Colors.white),
        calButton('6', Colors.white),
        calButton('+', Colors.deepOrangeAccent, numSize: 30),
      ],
    );

    var buttonRow3 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        calButton('7', Colors.white),
        calButton('8', Colors.white),
        calButton('9', Colors.white),
        calButton('-', Colors.deepOrangeAccent, numSize: 40),
      ],
    );

    var buttonRow4 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        calButton('0', Colors.white),
        calButton('.', Colors.white),
        calButton('÷', Colors.deepOrangeAccent, numSize: 35),
        calButton('×', Colors.deepOrangeAccent, numSize: 35),
      ],
    );

    var buttonRow5 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        calButton("A/C", Colors.deepOrangeAccent, btnWidth: 260),
        calButton("=", Colors.deepOrangeAccent)
      ],
    );

    var bulbicon = Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const Bulb(),
                ),
              );
            },
            icon: const Icon(FontAwesomeIcons.lightbulb),
          )),
    );

    var aboutIcon = Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AboutSection()));
        },
        icon: const Icon(FontAwesomeIcons.user),
      ),
    );

    var display = Flexible(
      child: Container(
        height: 115,
        width: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            // color: const Color.fromARGB(255, 234, 240, 243),
            color: const Color.fromARGB(255, 40, 37, 37),
            border:
                Border.all(color: const Color.fromARGB(53, 46, 68, 76), width: 3)),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
                child: Text(equation,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30))),
          ),
        ),
      ),
    );

    var elements = Expanded(
      flex: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [bulbicon, aboutIcon, ],
            ),
          ),
          display,
          const SizedBox(height: 20),
          buttonRow1,
          buttonRow2,
          buttonRow3,
          buttonRow4,
          buttonRow5
        ],
      ),
    );

//////////////// Main Body /////////////////////////////////

    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color: const Color.fromARGB(255, 21, 21, 21),
            // border: Border.all(
            //     color: Color.fromARGB(255, 46, 68, 76), width: 5),
          ),
          child: elements,
        ),
      ),
    );

/////////// Main Body /////////////////////////////////
  }
}