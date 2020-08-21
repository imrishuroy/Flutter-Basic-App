import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function result;
  Result(this.resultScore, this.result);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent';
    } else if (resultScore <= 12) {
      resultText = 'Prety Likeable';
    } else if (resultScore <= 16) {
      resultText = 'You are so... Strange';
    } else {
      resultText = 'You are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Reset',style: TextStyle(fontSize: 18.0),),
            textColor: Colors.green,
            onPressed: result,
          ),
        ],
      ),
    );
  }
}
