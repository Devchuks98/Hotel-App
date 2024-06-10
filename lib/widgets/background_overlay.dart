import 'package:flutter/material.dart';

class BackgroundImageWithOverlay extends StatelessWidget {
  final Widget child;
  final String imagePath;

  const BackgroundImageWithOverlay({
    Key? key,
    required this.child,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        // Dark overlay at the bottom
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.0001),
                ],
              ),
            ),
          ),
        ),
        // Content
        child,
      ],
    );
  }
}
