import 'package:flutter/material.dart';
import 'package:quiz/src/utils/colors.dart';
import 'package:quiz/src/utils/text_style.dart';

class CounterText extends StatelessWidget {
  final int number;
  CounterText(this.number);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: primaryColorOpacity,
        shape: BoxShape.circle,
      ),
      child: Text(
        number.toString(),
        style: title,
      ),
    );
  }
}
