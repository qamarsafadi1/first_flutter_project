import 'package:first_flutter_project/components/card_container_widget.dart';
import 'package:first_flutter_project/model/CalculaterBrain.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../components/bottom_button_widget.dart';

class ResultPage extends StatelessWidget {
  final CalculaterBrain? calculaterBrain;

  ResultPage({this.calculaterBrain});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Your Result',
                style: kTextTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardContainer(
              color: kInactiveCardColor,
              childWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${calculaterBrain?.getResult()}',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${calculaterBrain?.calculateBMI()}',
                    style: kResultTextTitleStyle,
                  ),
                  Text(
                    '${calculaterBrain?.getInterpretation()}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              title: 'RE-CALCULATE',
              onClick: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
