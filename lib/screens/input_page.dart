import 'package:first_flutter_project/model/CalculaterBrain.dart';
import 'package:first_flutter_project/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_button_widget.dart';
import '../components/card_container_widget.dart';
import '../model/Gender.dart';
import '../utils/constants.dart';
import '../components/counter_widget.dart';
import '../components/gender_widget.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 156;
  int weight = 36;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardContainer(
                    onClick: () {
                      setState(() {
                        selectedGender = Gender.MALE;
                      });
                    },
                    color: selectedGender == Gender.MALE
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childWidget: GenderWidget(
                      title: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: CardContainer(
                    onClick: () {
                      setState(() {
                        selectedGender = Gender.FEMALE;
                      });
                    },
                    color: selectedGender == Gender.FEMALE
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childWidget: GenderWidget(
                      title: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardContainer(
              color: kActiveCardColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$height',
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: Colors.pinkAccent,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CounterWidget(
                    title: 'WEIGHT',
                    valueOf: weight,
                    onClick: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CounterWidget(
                      title: 'AGE',
                      valueOf: age,
                      onClick: () {
                        setState(() {
                          age++;
                        });
                      }),
                ),
              ],
            ),
          ),
          BottomButton(
              title: 'CALCULATE',
              onClick: () {
                CalculaterBrain calc =
                    CalculaterBrain(weight: weight, height: height);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultPage(calculaterBrain: calc);
                }));
              }),
        ],
      ),
    );
  }
}
