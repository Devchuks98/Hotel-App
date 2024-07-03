import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/res/app_images.dart';
import 'package:hotel_app/screens/auth/personal_info.dart';
import 'package:hotel_app/util/app_color.dart';
import 'package:hotel_app/widgets/background_overlay.dart';
import 'package:hotel_app/widgets/default_button.dart';
import 'package:hotel_app/widgets/form_text.dart';
import 'package:hotel_app/widgets/height_spacer.dart';
import 'package:hotel_app/widgets/small_text.dart';
import 'package:ionicons/ionicons.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _continueToPersonalInfo() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PersonalInfoScreen(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImageWithOverlay(
        imagePath: AppImages.hotelbg,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black
              .withOpacity(0.5), // Adjust opacity to match your overlay
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100.h),
                  SmallText(
                    text: "New to Eden Hotel?",
                    color: Colors.white,
                    size: 24.sp,
                    fontWeight: FontWeight.w600,
                    align: TextAlign.center,
                  ),
                  const SmallText(
                    text: "Create an account",
                    color: Colors.white,
                  ),
                  const HeightSpacer(40),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormText(
                          fillColor: AppColor.greyColor5.withOpacity(.5),
                          filled: true,
                          hintText: 'Email address',
                          keyboardType: TextInputType.emailAddress,
                          suffixIcon: const Icon(
                            Ionicons.mail,
                            color: Colors.white,
                          ),
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        FormText(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Ionicons.eye_off
                                  : Ionicons.eye,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          fillColor: AppColor.greyColor5.withOpacity(.5),
                          filled: true,
                          hintText: 'Password',
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        FormText(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword
                                  ? Ionicons.eye_off
                                  : Ionicons.eye,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
                              });
                            },
                          ),
                          fillColor: AppColor.greyColor5.withOpacity(.5),
                          filled: true,
                          hintText: 'Confirm Password',
                          controller: _confirmPasswordController,
                          obscureText: _obscureConfirmPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            } else if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const HeightSpacer(200),
                  DefaultButton(
                    onpressed: _continueToPersonalInfo,
                    title: 'Continue',
                    enabled: true,
                  ),
                  const HeightSpacer(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SmallText(
                        text: 'Already have an account?',
                        color: Colors.white,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const SmallText(
                          text: 'Login',
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  //const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
