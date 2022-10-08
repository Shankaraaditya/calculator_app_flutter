// import 'package:flutter/material.dart;
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  late String tex;
  late Color fillColor;
  late Color textColor;
  late double textSize;
  late Function callback;

  CalculatorButton({
    Key? key,
    required this.tex,
    required this.fillColor,
    required this.textColor,
    required this.textSize,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: SizedBox(
            width: 80,
            height: 60,
            child: TextButton(
              onPressed: () {
                callback(tex);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(fillColor),
                overlayColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 173, 92, 0)),
                padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                elevation: MaterialStateProperty.all(45),
                shadowColor: MaterialStateProperty.all(Colors.grey),
              ),
              // shape: MaterialStateProperty.all(),
              // side: MaterialStateProperty.all(),
              child: Text(
                tex,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                  fontSize: textSize,
                  color: textColor,
                  // fontWeight: FontWeight.bold
                )),
              ),
            )));
  }
}
