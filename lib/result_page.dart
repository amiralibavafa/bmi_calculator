import 'package:flutter/material.dart';
import 'input_page.dart';
import 'bmi_calc.dart';

class result_page extends StatelessWidget {
  const result_page(@required this.bmi, @required this.bmiResult);
  final int bmi;
  final String bmiResult;

  Color getColor(String bmiResult) {
    if (bmiResult == 'Underweight') {
      return Colors.yellow;
    } else if (bmiResult == 'Normal') {
      return Colors.green;
    } else if (bmiResult == 'Overweight') {
      return Colors.orange;
    }
    else if (bmiResult == 'Obese') {
      return Colors.red;
    }
    else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Result',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                '$bmi',
                style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold, color: getColor(bmiResult)),
              ),
              Text(
                '$bmiResult',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  decoration: BoxDecoration(
                    color: Colors.red[400], // Red background color
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 200, // 100% width
                  height: 90,
                  child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Re-Calculate",
                        style: TextStyle(color: Colors.white),
                      )))
            ]),
      ),
    );
  }
}
