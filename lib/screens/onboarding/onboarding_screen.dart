import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/screens/onboarding/models/onboarding_content.dart';
import 'package:hotel_app/screens/register_screen.dart';
import 'package:hotel_app/util/app_color.dart';
import 'package:hotel_app/util/navigator/page_navigator.dart';
import 'package:hotel_app/widgets/default_button.dart';
import 'package:hotel_app/widgets/height_spacer.dart';
import 'package:hotel_app/widgets/small_text.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<OnboardingContent> _contentList = [
    OnboardingContent(
      imagePath: 'assets/images/hot1.jpeg',
      title: 'Welcome to Luxury',
      description: 'Experience the finest stays and exceptional service.',
    ),
    OnboardingContent(
      imagePath: 'assets/images/hot2.jpeg',
      title: 'Book with Ease',
      description: 'Simple and intuitive booking process at your fingertips.',
    ),
    OnboardingContent(
      imagePath: 'assets/images/hot3.jpeg',
      title: 'Unmatched Comfort',
      description: 'Enjoy world-class amenities and unparalleled comfort.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: _contentList.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  _contentList[index].imagePath,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          // Blurry part at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 200.h,
                  color: Colors.black.withOpacity(0.5),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SmallText(
                          text: _contentList[_currentPage].title,
                          size: 24.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(height: 10),
                        SmallText(
                          text: _contentList[_currentPage].description,
                          size: 14.sp,
                          color: Colors.white,
                          align: TextAlign.center,
                        ),
                        const HeightSpacer(40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildPageIndicator(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Skip button at the top right
          Positioned(
            top: 40.h,
            right: 20.w,
            child: TextButton(
              onPressed: () {
                _pageController.jumpToPage(_contentList.length - 1);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              child: SmallText(
                text: 'Skip',
                fontWeight: FontWeight.w500,
                color: Colors.white,
                size: 15.sp,
              ),
            ),
          ),
          // "Get Started" button at the bottom
          if (_currentPage == _contentList.length - 1)
            Positioned(
              bottom: 30.h,
              left: 20.w,
              right: 20.w,
              child: DefaultButton(
                onpressed: () {
                  NavigationHelper.navigateToPage(
                      context, const RegisterScreen());
                },
                title: 'Explore!',
                enabled: true,
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _contentList.length; i++) {
      indicators.add(
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 2,
          width: _currentPage == i ? 11.w : 11.w,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color:
                _currentPage == i ? AppColor.primaryColor : AppColor.greyColor3,
          ),
        ),
      );
    }
    return indicators;
  }
}
