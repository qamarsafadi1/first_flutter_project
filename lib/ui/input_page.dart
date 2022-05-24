import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/Gender.dart';
import '../utils/constants.dart';
import '../widgets/card_container_widget.dart';
import '../widgets/gender_widget.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  // Color femaleColor = inactiveCardColor;
  // Color maleColor = inactiveCardColor;
  //
  // void updateColor(Gender selectedGender) {
  //   if (selectedGender == Gender.MALE) {
  //     if (maleColor == inactiveCardColor) {
  //       maleColor = activeCardColor;
  //       femaleColor = inactiveCardColor;
  //     } else {
  //       maleColor = inactiveCardColor;
  //     }
  //   }
  //   if (selectedGender == Gender.FEMALE) {
  //     if (femaleColor == inactiveCardColor) {
  //       femaleColor = activeCardColor;
  //       maleColor = inactiveCardColor;
  //     } else {
  //       femaleColor = inactiveCardColor;
  //     }
  //   }
  // }

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
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Colors.pinkAccent,
                    inactiveColor: Colors.grey,
                    onChanged: (newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardContainer(
                    color: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: CardContainer(
                    color: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: kBottomHeight,
            color: kBottomButtonColor,
          )
        ],
      ),
    );
  }
}
