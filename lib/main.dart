import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar:
          AppBar(title: Text('Ask Me Anything'), backgroundColor: Colors.blue),
      body: EightBall(),
    ),
  ));
}

class EightBall extends StatefulWidget {
  const EightBall({Key? key}) : super(key: key);

  @override
  State<EightBall> createState() => _EightBallState();
}

class _EightBallState extends State<EightBall> {
  var ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: TextButton(
          onPressed: () {
            changeAnswer();
          },
          child: Image.asset('images/balls/ball$ballNumber.png'),
        ),
      ),
    );
  }

  void changeAnswer() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }
}
