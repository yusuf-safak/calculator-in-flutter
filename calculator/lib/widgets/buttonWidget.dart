import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButtons extends StatelessWidget {
  final String text;
  final double textSize;
  final int fillColor;
  final Function click;
  const CalculatorButtons(this.text, this.textSize, this.fillColor, this.click);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
        child: SizedBox(
          width: 80,
          height: 80,
          child: FlatButton(
            onPressed: (){
              click(text);
            },
            color: Color(fillColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
          child: Text(text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textSize,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
    );
  }
}
