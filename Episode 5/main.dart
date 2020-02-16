import 'package:flutter/material.dart';
import 'TWDCharacterQuiz.dart';

TWDCharacterQuiz quiz = TWDCharacterQuiz();

void main() => runApp(TWDQuizApp());

class TWDQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen[200],
        appBar: AppBar(
          title: Text("Which TWD Character Are You?"),
          backgroundColor: Colors.red[800],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TWDQuizPage(),
          ),
        ),
      ),
    );
  }
}

class TWDQuizPage extends StatefulWidget {
  @override
  _TWDQuizPageState createState() => _TWDQuizPageState();
}

class _TWDQuizPageState extends State<TWDQuizPage> {
  Future<void> _showResult() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red[800],
          title: Text(
            quiz.getWinnerName(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Zombie Queen',
              fontSize: 26.0,
              color: Colors.white,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.network(quiz.getWinnerImageURL()),
              SizedBox(height: 30.0),
              Text(
                quiz.getWinnerText(),
                style: TextStyle(
                  fontFamily: 'Zombie Queen',
                  fontSize: 21.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Retake Quiz',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Zombie Queen',
                  fontSize: 26.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  quiz.reset();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Padding _answerButton({int option}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        child: Text(
          quiz.getAnswerText(option: option),
          style: TextStyle(
            fontFamily: 'Zombie Queen',
            fontSize: 26.0,
            color: Colors.white,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        color: Colors.red[800],
        onPressed: () {
          setState(() {
            quiz.updateScores(optionPicked: option);
            if (quiz.isFinished()) {
              quiz.calculateResults();
              _showResult();
            } else {
              quiz.nextQuestion();
            }
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'Question ${quiz.getQuestionNumber()}/${quiz.getTotalNumberOfQuestions()}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Zombie Queen',
            fontSize: 32.0,
          ),
        ),
        Text(
          quiz.getQuestionText(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Zombie Queen',
            fontSize: 26.0,
          ),
        ),
        Column(
          children: <Widget>[
            _answerButton(option: 1),
            _answerButton(option: 2),
            _answerButton(option: 3),
            _answerButton(option: 4),
          ],
        )
      ],
    );
  }
}
