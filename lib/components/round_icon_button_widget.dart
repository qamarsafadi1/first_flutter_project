import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData iconData;
  Function()? onClick;
  RoundedIconButton({required this.iconData, this.onClick});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onClick,
      elevation: 6.0,
      child: Icon(
        iconData,
        color: Colors.white,
      ),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
