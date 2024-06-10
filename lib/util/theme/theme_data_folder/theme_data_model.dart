import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  ThemeMode _currentTheme = ThemeMode.system;

  ThemeMode get currentTheme => _currentTheme;

  set currentTheme(ThemeMode theme) {
    _currentTheme = theme;
    notifyListeners();
  }
}
