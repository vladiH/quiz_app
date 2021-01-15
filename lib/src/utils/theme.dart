import 'package:flutter/material.dart';
import 'package:quiz/src/utils/colors.dart';

ThemeData aplicationTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      iconTheme: IconThemeData(color: Colors.grey[800], size: 20.0, opacity: 1),
      primaryColor: primaryColor,
      errorColor: Color(0xffE60042),
      cardColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Color(0xFFF5F5F5),
      indicatorColor: Color(0xFF807A6B),
      accentColor: Color(0xFFFFF8E1),
      buttonColor: primaryColor,
      buttonTheme: ButtonThemeData(),
      backgroundColor: Colors.white,
      tabBarTheme: base.tabBarTheme.copyWith(
        labelColor: Color(0xffce107c),
        unselectedLabelColor: Colors.grey,
      ));
}
