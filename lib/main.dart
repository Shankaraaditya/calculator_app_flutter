// import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';

import './widgets/buttons.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'calculator_appo/widgets/buttons.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  late int firstNum;
  late int secondNum;
  late String history = '';
  late String textToDisplay = '';
  late String res;
  late String operation;

  void btnOnClick(String btnVal) {
    // print(btnVal);
    if (btnVal == 'c') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    } else if (btnVal == 'AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnVal == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-$textToDisplay';   // interpolation added // previously
                                   //   '-' + textToDisplay;
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnVal == '<') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'x' ||
        btnVal == '/') {
      firstNum = int.parse(textToDisplay);
      res = '';
      operation = btnVal;
    } else if (btnVal == '=') {
      secondNum = int.parse(textToDisplay);
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'x') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/') {
        res = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnVal).toString();
    }

    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var w = MediaQuery.of(context).size.width;
    // var h = MediaQuery.of(context).size.height;

    return MaterialApp(

        // var w = MediaQuery.of(context).size.width;
        // var h = MediaQuery.of(context).size.height;

        debugShowCheckedModeBanner: false,
        title: 'Calculator',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Calculate With Flutter'),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 15, 17),
          body: Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height * 0.4,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    history,
                    style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 149, 149, 149))),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    textToDisplay,
                    style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                            fontSize: 40,
                            color: Color.fromARGB(255, 255, 255, 255))),
                  ),
                ),
              ),
              Row(children: [
                CalculatorButton(
                  tex: 'AC',
                  fillColor: const Color.fromARGB(255, 242, 177, 0),
                  textColor: Colors.black,
                  textSize: 20,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  tex: 'c',
                  fillColor: const Color.fromARGB(255, 242, 177, 0),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  tex: '<',
                  fillColor: const Color.fromARGB(255, 242, 177, 0),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  tex: '+',
                  fillColor: const Color.fromARGB(255, 242, 177, 0),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                CalculatorButton(
                  tex: '9',
                  fillColor: const Color.fromARGB(255, 221, 137, 10),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  tex: '8',
                  fillColor: const Color.fromARGB(255, 221, 137, 10),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  tex: '7',
                  fillColor: const Color.fromARGB(255, 221, 137, 10),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  tex: '-',
                  fillColor: const Color.fromARGB(255, 242, 177, 0),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                CalculatorButton(
                  tex: '6',
                  fillColor: const Color.fromARGB(255, 221, 137, 10),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  tex: '5',
                  fillColor: const Color.fromARGB(255, 221, 137, 10),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  tex: '4',
                  fillColor: const Color.fromARGB(255, 221, 137, 10),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  tex: 'x',
                  fillColor: const Color.fromARGB(255, 242, 177, 0),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                CalculatorButton(
                  tex: '3',
                  fillColor: const Color.fromARGB(255, 221, 137, 10),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  tex: '2',
                  fillColor: const Color.fromARGB(255, 221, 137, 10),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  tex: '1',
                  fillColor: const Color.fromARGB(255, 221, 137, 10),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  tex: '/',
                  fillColor: const Color.fromARGB(255, 242, 177, 0),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                CalculatorButton(
                  tex: '+/-',
                  fillColor: const Color.fromARGB(255, 221, 137, 10),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  tex: '0',
                  fillColor: const Color.fromARGB(255, 221, 137, 10),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  tex: '00',
                  fillColor: const Color.fromARGB(255, 221, 137, 10),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  tex: '=',
                  fillColor: const Color.fromARGB(255, 242, 177, 0),
                  textColor: Colors.black,
                  textSize: 30,
                  callback: btnOnClick,
                ),
              ]),
            ]),
          ),
        ));
  }
}
