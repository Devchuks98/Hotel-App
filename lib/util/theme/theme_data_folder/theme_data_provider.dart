// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ThemeProvider with ChangeNotifier {
//   int _stepCount = 5;

//   ThemeProvider(SharedPreferences sharedPreferences); // Default step count

//   int get stepCount => _stepCount; // Getter for step count

//   late SharedPreferences _prefs; // Store the SharedPreferences instance
//   late ThemeMode _currentTheme = ThemeMode.light;

//   ThemeMode get currentTheme => _currentTheme;

//   // Initialize the theme provider with the saved theme preference
//   Future<void> initializeTheme() async {
//     _prefs = await SharedPreferences.getInstance();
//     final savedTheme = _prefs.getString('theme');
//     _currentTheme = savedTheme == 'ThemeMode.dark'
//         ? ThemeMode.dark
//         : ThemeMode.light; // Default to light theme if preference not found
//     notifyListeners();
//   }

//   // Toggle between light and dark themes
//   void toggleTheme() {
//     _currentTheme =
//         _currentTheme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
//     _prefs.setString('theme', _currentTheme.toString());
//     notifyListeners();
//   }

//   static ThemeProvider of(BuildContext context, {bool listen = true}) =>
//       Provider.of<ThemeProvider>(context, listen: listen);
// }
