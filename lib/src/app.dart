import 'package:flutter/material.dart';
import 'package:quiz/src/ui/home/home_screen.dart';
import 'package:quiz/src/utils/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: aplicationTheme(),
      home: HomeScreen(),
    );
  }
}
