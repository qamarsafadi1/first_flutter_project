import 'package:flutter/material.dart';

import '../utils/constants.dart';

class BottomButton extends StatelessWidget {
  final String title;
  Function()? onClick;

  BottomButton({required this.title, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        child: Center(
          child: Text(
            '$title',
            style: kTextButtonStyle,
          ),
        ),
        width: double.infinity,
        height: kBottomHeight,
        color: kBottomButtonColor,
      ),
    );
  }
}
