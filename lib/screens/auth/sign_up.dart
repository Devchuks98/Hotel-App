import 'package:flutter/material.dart';
import 'package:hotel_app/res/app_images.dart';
import 'package:hotel_app/widgets/background_overlay.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundImageWithOverlay(
        imagePath: AppImages.hotelbg,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
