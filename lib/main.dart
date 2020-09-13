import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your Favourite Color?',
      'answer': [
        {'text': 'Black', 'score': 3},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'Who is favourite friend?',
      'answer': [
        {'text': 'Shubam', 'score': 1},
        {'text': 'Aman', 'score': 1},
        {'text': 'Satyam', 'score': 1},
        {'text': 'Yogi', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favourite animals',
      'answer': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 8},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ]
    },
  ];
  var _questionIndex = 0;
  int _totalScore = 0;

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('we have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, resetQuiz),
      ),
    );
  }
}
