import 'package:flutter/material.dart';

final ButtonStyle dialogButtonStyle = TextButton.styleFrom(
  foregroundColor: Colors.white,
  backgroundColor: Colors.red, // Background color
  minimumSize: Size(88, 36), // Minimum size
  padding: EdgeInsets.symmetric(horizontal: 16.0), // Padding
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0), // Rounded corners
  ),
);
