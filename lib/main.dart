import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/CalcButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('CALCULATOR'),
          centerTitle: true,
          backgroundColor: Colors.indigo[400],
        ),
        backgroundColor: Color(0xFFE0E0E0),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 12),
            child: Text(_history,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(fontSize: 24),
                  color: Color(0xFF000000),
                )),
            alignment: Alignment(1, 1),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: Text(_expression,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(fontSize: 48),
                  color: Color(0xFF512DA8),
                )),
            alignment: Alignment(1, 1),
          ),
          SizedBox(height: 40),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: 'AC',
                  fillColor: 0xFF009688,
                  callback: allClear,
                ),
                CalcButton(
                  text: 'C',
                  fillColor: 0xFF009688,
                  callback: clear,
                ),
                CalcButton(
                  text: '%',
                  fillColor: 0xFF009688,
                  callback: numClick,
                ),
                CalcButton(
                  text: '/',
                  fillColor: 0xFF009688,
                  callback: numClick,
                ),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '7',
                  fillColor: 0xFF009688,
                  callback: numClick,
                ),
                CalcButton(
                  text: '8',
                  fillColor: 0xFF009688,
                  callback: numClick,
                ),
                CalcButton(
                  text: '9',
                  fillColor: 0xFF009688,
                  callback: numClick,
                ),
                CalcButton(
                  text: '*',
                  fillColor: 0xFF009688,
                  callback: numClick,
                ),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '4',
                  fillColor: 0xFF009688,
                  callback: numClick,
                ),
                CalcButton(
                  text: '5',
                  fillColor: 0xFF009688,
                  callback: numClick,
                ),
                CalcButton(
                  text: '6',
                  fillColor: 0xFF009688,
                  callback: numClick,
                ),
                CalcButton(
                  text: '-',
                  fillColor: 0xFF009688,
                  callback: numClick,
                ),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '1',
                  fillColor: 0xFF009688,
                  callback: numClick,
                ),
                CalcButton(
                  text: '2',
                  fillColor: 0xFF009688,
                  callback: numClick,
                ),
                CalcButton(
                  text: '3',
                  fillColor: 0xFF009688,
                  callback: numClick,
                ),
                CalcButton(
                  text: '+',
                  fillColor: 0xFF009688,
                  callback: numClick,
                ),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '.',
                  fillColor: 0xFF009688,
                  callback: numClick,
                ),
                CalcButton(
                  text: '0',
                  fillColor: 0xFF009688,
                  callback: numClick,
                ),
                CalcButton(
                  text: '00',
                  fillColor: 0xFF009688,
                  callback: numClick,
                ),
                CalcButton(
                  text: '=',
                  fillColor: 0xFF009688,
                  callback: evaluate,
                ),
              ]),
        ]),
      ),
    );
  }
}
