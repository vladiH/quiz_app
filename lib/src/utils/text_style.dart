import 'package:flutter/material.dart';
import 'package:quiz/src/utils/colors.dart';

final TextStyle buttonText = TextStyle(
    fontFamily: 'Open Sans',
    color: primary2TextColor,
    fontWeight: FontWeight.w500,
    shadows: [
      Shadow(color: Colors.black, offset: Offset(5, 5), blurRadius: 15)
    ]);

final TextStyle title = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontFamily: 'Open Sans',
    color: primary2TextColor);

final TextStyle title1 = TextStyle(
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w600,
    fontFamily: 'Open Sans',
    color: primaryTextColor);

final TextStyle subTitle = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto Light',
    color: primaryTextColor);

final TextStyle subTitle1 = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    fontFamily: 'Open Sans',
    color: primaryColor);

final TextStyle spamText = TextStyle(
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    fontFamily: 'Open Sans',
    color: complementaryColor,
    fontSize: 12);

final TextStyle spamText1 = TextStyle(
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    fontFamily: 'Open Sans',
    color: secondaryColorOpacity,
    fontSize: 12);

final TextStyle spamText2 = TextStyle(
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    fontFamily: 'Open Sans',
    color: primaryTextColor,
    fontSize: 12);

final TextStyle subText = TextStyle(
  color: primaryTextColor,
  fontWeight: FontWeight.w400,
  fontSize: 12,
  fontStyle: FontStyle.italic,
);
