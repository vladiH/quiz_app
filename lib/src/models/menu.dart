import 'package:flutter/material.dart';

class Menu {
  final int categoryId;
  final String name;
  final AssetImage image;
  final List<Color> colors;

  Menu({this.categoryId, this.name, this.image, this.colors});
}

final menu1 = Menu(
    categoryId: 1,
    name: "TABLA1",
    image: AssetImage("./assets/images/math.png"),
    colors: [Color(0xffed3124), Colors.cyan]);
final menu2 = Menu(
    categoryId: 2,
    name: "TABLA2",
    image: AssetImage("./assets/images/history.png"),
    colors: [Color(0xffed7124), Colors.cyan]);

final menu = [menu1, menu2];
