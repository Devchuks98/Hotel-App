import 'package:flutter/material.dart';

Color getTextColor(ThemeData themeData) {
  // Define logic to determine text color based on theme
  return themeData.brightness == Brightness.light ? Colors.black : Colors.white;
}
