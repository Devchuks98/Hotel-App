import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/res/app_images.dart';
import 'package:hotel_app/screens/landing_screen.dart';
import 'package:hotel_app/util/app_color.dart';
import 'package:hotel_app/util/navigator/page_navigator.dart';
import 'package:hotel_app/widgets/background_overlay.dart';
import 'package:hotel_app/widgets/default_button.dart';
import 'package:hotel_app/widgets/form_text.dart';
import 'package:hotel_app/widgets/height_spacer.dart';
import 'package:hotel_app/widgets/small_text.dart';

class PersonalInfoScreen extends StatefulWidget {
  final String email;
  final String password;

  const PersonalInfoScreen(
      {Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _finalizeSignUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      try {
        // Simulate sign-up logic here
        await Future.delayed(const Duration(seconds: 2));
        Navigator.of(context).pop(); // Remove the loading indicator

        // Navigate to the LandingScreen
        NavigationHelper.navigateAndClearStack(
          context,
          LandingScreen(
            currentPage: 0,
            firstName: _firstNameController.text,
          ),
        );
      } catch (e) {
        Navigator.of(context).pop(); // Remove the loading indicator
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Account creation failed: $e')),
        );
      }
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
                    text: "Personal Information",
                    color: Colors.white,
                    size: 24.sp,
                    fontWeight: FontWeight.w600,
                    align: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormText(
                          fillColor: AppColor.greyColor5.withOpacity(.5),
                          filled: true,
                          hintText: 'First Name',
                          controller: _firstNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        FormText(
                          fillColor: AppColor.greyColor5.withOpacity(.5),
                          filled: true,
                          hintText: 'Last Name',
                          controller: _lastNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        FormText(
                          fillColor: AppColor.greyColor5.withOpacity(.5),
                          filled: true,
                          hintText: 'Phone Number',
                          keyboardType: TextInputType.phone,
                          controller: _phoneNumberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            } else if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const HeightSpacer(200),
                  DefaultButton(
                    onpressed: _finalizeSignUp,
                    title: 'Sign Up',
                    enabled: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
