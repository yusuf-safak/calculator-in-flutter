import 'package:calculator/widgets/buttonWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(Calculator());
}
class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String resultValue = "";
  String result = "";
  int number1 = 0;
  int number2 = 0;
  String process = "";
  String history = "";
  double fSize = 50;
  void click(String buttonValue){
    if(buttonValue == "AC"){
      resultValue = "";
      history = "";
      setState(() {
        result = resultValue;
      });
    }
    else if(buttonValue == "C"){
      resultValue = "";
      setState(() {
        result = resultValue;
      });
    }
    else if(buttonValue == "BACK"){
      resultValue = resultValue.substring(0,resultValue.length-1);
      setState(() {
        result = resultValue;
      });
    }
    else if(buttonValue == "+/-"){
      if(int.parse(resultValue)>0)
        resultValue = "-" + resultValue;
      else if(int.parse(resultValue) == 0){
        resultValue = "0";
      }
      else
        resultValue = resultValue.substring(1);
      setState(() {
        result = resultValue;
      });
    }
    else if(buttonValue == "/"){
      number1 = int.parse(resultValue);
      resultValue= "";
      setState(() {
        result = resultValue;
      });
      process = buttonValue;
    }
    else if(buttonValue == "x"){
      number1 = int.parse(resultValue);
      resultValue= "";
      setState(() {
        result = resultValue;
      });
      process = buttonValue;
    }
    else if(buttonValue == "-"){
      number1 = int.parse(resultValue);
      resultValue= "";
      setState(() {
        result = resultValue;
      });
      process = buttonValue;
    }
    else if(buttonValue == "+"){
      number1 = int.parse(resultValue);
      resultValue= "";
      setState(() {
        result = resultValue;
      });
      process = buttonValue;
    }
    else if(buttonValue == "="){
      number2 = int.parse(resultValue);
      resultValue = "";
      setState(() {
        result = resultValue;
      });
      if(process == "+")
      {
        resultValue = (number1 + number2).toString();
        history = number1.toString() + process.toString() + number2.toString();
      }
      else if(process == "-")
      {
        resultValue = (number1 - number2).toString();
        history = number1.toString() + process.toString() + number2.toString();
      }
      else if(process == "/")
      {
        resultValue = ((number1 / number2)).toString();
        if(resultValue.length>=8)
          fSize = 30.0;
        history = number1.toString() + process.toString() + number2.toString();
      }
      else if(process == "x")
      {
        resultValue = (number1 * number2).toString();
        history = number1.toString() + process.toString() + number2.toString();
      }
    }
    else{
      result = int.parse(resultValue + buttonValue).toString();
      setState(() {
        resultValue = result;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          centerTitle: true,
          backgroundColor: Colors.purple,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment(1,1),
              child:Padding(
                padding: const EdgeInsets.only(right: 20,bottom: 10),
                child: Text(history,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 35,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment(1,1),
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 10),
                child: Text(resultValue,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: fSize,
                    )
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButtons("AC", 25.0, 0xFF9800FF, click),
                CalculatorButtons("C", 28.0, 0xFF9800FF, click),
                CalculatorButtons("BACK", 17.0, 0xFF980099FF, click),
                CalculatorButtons("/", 30.0, 0xFF980099FF, click),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButtons("9", 30.0, 0xFF9800FF, click),
                CalculatorButtons("8", 30.0, 0xFF9800FF, click),
                CalculatorButtons("7", 30.0, 0xFF9800FF, click),
                CalculatorButtons("x", 35.0, 0xFF980099FF, click),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButtons("6", 30.0, 0xFF9800FF, click),
                CalculatorButtons("5", 30.0, 0xFF9800FF, click),
                CalculatorButtons("4", 30.0, 0xFF9800FF, click),
                CalculatorButtons("-", 40.0, 0xFF980099FF, click),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButtons("3", 30.0, 0xFF9800FF, click),
                CalculatorButtons("2", 30.0, 0xFF9800FF, click),
                CalculatorButtons("1", 30.0, 0xFF9800FF, click),
                CalculatorButtons("+", 40.0, 0xFF980099FF, click),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButtons("+/-", 26.0, 0xFF9800FF, click),
                CalculatorButtons("0", 30.0, 0xFF9800FF, click),
                CalculatorButtons("00", 30.0, 0xFF9800FF, click),
                CalculatorButtons("=", 30.0, 0xFF980099FF, click),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
