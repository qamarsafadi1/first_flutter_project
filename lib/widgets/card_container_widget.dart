import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Color color;
  final Widget? childWidget;
  final Function()? onClick;

  CardContainer({required this.color, this.childWidget, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        child: childWidget,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
