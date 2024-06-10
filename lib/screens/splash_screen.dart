import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/screens/onboarding_screen.dart';
import 'package:hotel_app/util/app_color.dart';
import 'package:hotel_app/util/navigator/page_navigator.dart';
import 'package:hotel_app/widgets/height_spacer.dart';
import 'package:hotel_app/widgets/small_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _opacityAnimation;
  late final Animation<Offset> _textOffsetAnimation;
  late final Animation<Offset> _iconOffsetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1700),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _textOffsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 0.5),
    ));

    _iconOffsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.5, 0.8),
    ));

    // Forward the animation, then delay for 4 seconds before navigating
    _animationController.forward().then((_) {
      Future.delayed(const Duration(seconds: 1), () {
        NavigationHelper.navigateToPage(
          context,
          OnboardingScreen(),
        );
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Align(
        alignment: Alignment.center,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SlideTransition(
                position: _iconOffsetAnimation,
                child: Image.asset(
                  'assets/icons/eden.png',
                  height: 300.h,
                  width: 300.w,
                ),
              ),
              SlideTransition(
                position: _textOffsetAnimation,
                child: SmallText(
                  style: FontStyle.italic,
                  text: 'Your Paradise Awaits',
                  size: 14.sp,
                  color: AppColor.whiteColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
