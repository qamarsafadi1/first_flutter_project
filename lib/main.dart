import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('assets_note$soundNumber.wav');
  }

  Expanded buildKeys({required int soundNumber, required MaterialColor color}) {
    return Expanded(
      child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
          ),
          onPressed: () {
            playSound(soundNumber);
          },
          child: Text('')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKeys(soundNumber: 1, color: Colors.red),
              buildKeys(soundNumber: 2, color: Colors.orange),
              buildKeys(soundNumber: 3, color: Colors.yellow),
              buildKeys(soundNumber: 4, color: Colors.green),
              buildKeys(soundNumber: 5, color: Colors.teal),
              buildKeys(soundNumber: 6, color: Colors.blue),
              buildKeys(soundNumber: 7, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
