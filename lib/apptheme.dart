import 'package:flutter/material.dart';

class AppTheme {
  Color splashBack = Colors.white; // SplashScreen Background
  Color homeBack = Colors.white; //Home Background
  List<List<Color>> gradients = [
    [Colors.blue, Colors.blue.shade400, Colors.blue.shade200],
    [Colors.red.shade300, Colors.red.shade400, Colors.deepOrange.shade300],
    [Colors.purple.shade300, Colors.purple.shade200, Colors.purple.shade100]
  ]; // Tile Gradient Colors

  List<Color> getColors(int i) {
    return gradients[i % gradients.length];
  } // Home Gradient Color List

  TextStyle getStyle(double size, Color color, FontWeight fw) {
    return TextStyle(
        color: color, fontSize: size, fontFamily: 'Alata', fontWeight: fw);
  } // Home Text Style

}
