import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  int _num1 = 0;
  int _num2 = 0;
  String _operand = "";

  void _onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        _clear();
      } else if (value == "=") {
        _calculate();
      } else if (value == "+" || value == "-" || value == "x" || value == "/") {
        _operand = value;
        _num1 = int.parse(_output);
        _output = "0";
      } else {
        if (_output == "0" || _output == "Infinity" || _output == "-Infinity") {
          _output = value;
        } else {
          _output += value;
        }
      }
    });
  }

  void _clear() {
    setState(() {
      _output = "0";
      _num1 = 0;
      _num2 = 0;
      _operand = "";
    });
  }

  void _calculate() {
    setState(() {
      _num2 = int.parse(_output);
      switch (_operand) {
        case "+":
          _output = (_num1 + _num2).toString();
          break;
        case "-":
          _output = (_num1 - _num2).toString();
          break;
        case "x":
          _output = (_num1 * _num2).toString();
          break;
        case "/":
          if (_num2 != 0) {
            _output = (_num1 ~/ _num2).toString(); // Use integer division for result
          } else {
            _output = "Error";
          }
          break;
      }
      _operand = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _output,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 215, 48, 245),
                backgroundColor: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton("7"),
                _buildButton("8"),
                _buildButton("9"),
                _buildButton("/"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton("4"),
                _buildButton("5"),
                _buildButton("6"),
                _buildButton("x"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton("1"),
                _buildButton("2"),
                _buildButton("3"),
                _buildButton("-"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton("0"),
                _buildButton("C"),
                _buildButton("="),
                _buildButton("+"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      onPressed: () => _onButtonPressed(text),
      child: Text(
        text,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
