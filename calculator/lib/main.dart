import 'package:flutter/material.dart';
void main() {
  runApp(const Calculator());
}
class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: calculator(),
    );
  }
}
class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}
class _calculatorState extends State<calculator> {

   late int firstNum ;
   late int secondNum ;
   String textToDisplay = '';
   String res = '';
   String operation = '';


  buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      textToDisplay = "";
      firstNum = 0;
      secondNum = 0;
      res = "";

    } else if (buttonText == "<"){
     res = textToDisplay.substring(0, textToDisplay.length -1);
    }
    else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      firstNum = int.parse(textToDisplay);
      res = '';
      operation = buttonText;

    } else if (buttonText == "=") {
      secondNum = int.parse(textToDisplay);

      if (operation == "+") {
        res = (firstNum + secondNum).toString();
      }
      if (operation == "-") {
        res = (firstNum - secondNum).toString();
      }
      if (operation == "X") {
        res = (firstNum * secondNum).toString();
      }
      if (operation == "/") {
        res = (firstNum / secondNum).toString();
      }
      } else {
      res = int.parse(textToDisplay + buttonText).toString() ;
    }

    setState(() {
      textToDisplay = res;
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
        child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        side: const BorderSide(width: 1, color: Color.fromARGB(255, 0, 0, 0)),
        minimumSize: const Size.fromHeight(50.0),
        padding: EdgeInsets.zero,
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      onPressed: () => buttonPressed(buttonText),
    ));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Calculator"),
        ),
        body: Column(
          children: <Widget>[
            const Expanded(
              child: Divider(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Column(children: [
              Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 12.0),
                  child: Text(textToDisplay,
                      style: const TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                      ))),
              Row(children: [
                buildButton("AC"),
                buildButton("<"),
              ]),       
              Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("/")
              ]),
              Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("X")
              ]),
              Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("-")
              ]),
              Row(children: [
                buildButton("00"),
                buildButton("0"),
                buildButton("="),
                buildButton("+")
              ]),
            ])
          ],
        ));
  }
}

