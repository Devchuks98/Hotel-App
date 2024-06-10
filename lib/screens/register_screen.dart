import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/res/app_images.dart';
import 'package:hotel_app/screens/auth/sign_up.dart';
import 'package:hotel_app/util/app_color.dart';
import 'package:hotel_app/util/navigator/page_navigator.dart';
import 'package:hotel_app/widgets/background_overlay.dart';
import 'package:hotel_app/widgets/default_button.dart';
import 'package:hotel_app/widgets/height_spacer.dart';
import 'package:hotel_app/widgets/small_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isLoading = false;

  void _navigateToSignUp() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Simulate a network request or any other async operation
      await Future.delayed(const Duration(seconds: 2));

      // Navigate to the SignUp screen
      NavigationHelper.navigateToPage(context, const SignUp());
    } catch (e) {
      // Handle exceptions properly
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImageWithOverlay(
        imagePath: AppImages.hotelbg,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(),
                  SmallText(
                    text: "Let’s begin your Experience with our app",
                    color: Colors.white,
                    size: 22.sp,
                    fontWeight: FontWeight.w600,
                    align: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const SmallText(
                    text:
                        "Whether you're planning a relaxing getaway, a business trip, or a family vacation, we have everything you need to make your stay exceptional",
                    color: Colors.white,
                    align: TextAlign.center,
                  ),
                  const Spacer(),
                  DefaultButton(
                    onpressed: _navigateToSignUp,
                    title: 'Create Account',
                    enabled: true,
                  ),
                  const SizedBox(height: 20),
                  // Login Button
                  DefaultButton(
                    buttonColor: Colors.transparent,
                    bordercolor: Colors.white,
                    onpressed: () {},
                    title: 'Login',
                    enabled: true,
                  ),
                  const HeightSpacer(35),
                ],
              ),
            ),
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColor.primaryColor),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
