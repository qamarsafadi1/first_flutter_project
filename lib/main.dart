import 'package:first_flutter_project/model/QuizBrain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain brain = QuizBrain();

void main() {
  runApp(QuizzerApp());
}

class QuizzerApp extends StatelessWidget {
  const QuizzerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  Icon trueIcon() => Icon(Icons.check, color: Colors.green);

  Icon falseIcon() => Icon(Icons.close, color: Colors.red);

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = brain.getQuestionAnswer();
    setState(() {
      if (userAnswer == correctAnswer) {
        scoreKeeper.add(trueIcon());
        print("You get it Right");
      } else {
        scoreKeeper.add(falseIcon());
        print("You get it Wrong");
      }
      if (brain.isQuizFinished()) {
        showAlert();
      } else {
        brain.nextQuestion();
      }
    });
  }

  void showAlert() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "FINISHED !",
      desc: "You have reached the end of the quiz.",
      buttons: [
        DialogButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            setState(() {
              scoreKeeper.clear();
            });
            Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 5,
            child: Center(
              child: Text(
                brain.getQuestionTitle(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: Text(
                    'True',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: Text(
                    'False',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            )),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
