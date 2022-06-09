import 'package:first_flutter_project/components/round_icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/constants.dart';
import 'card_container_widget.dart';

class CounterWidget extends StatelessWidget {
  int valueOf;
  String title;
  Function()? onClick;

  CounterWidget({required this.valueOf, required this.title, this.onClick});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      color: kActiveCardColor,
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$title',
            style: kTextStyle,
          ),
          Text(
            '$valueOf',
            style: kNumberTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedIconButton(
                iconData: FontAwesomeIcons.add,
                onClick: onClick,
              ),
              SizedBox(
                width: 15,
              ),
              RoundedIconButton(
                iconData: FontAwesomeIcons.minus,
                onClick: onClick,
              )
            ],
          )
        ],
      ),
    );
  }
}
