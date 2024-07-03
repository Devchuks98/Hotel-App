import 'package:flutter/material.dart';
import 'package:hotel_app/screens/landing_screen.dart';
import 'package:hotel_app/screens/onboarding/onboarding_screen.dart';
import 'package:hotel_app/screens/onboarding/splash_screen.dart';

import '../screens/auth/personal_info.dart';

class AppRoutes {
  // Route names
  static const String splashScreen = 'splashScreen';
  static const String landingscreen = 'landingscreen';
  static const String emailAuth = 'emailAuth';
  static const String onboardingScreen = 'onboardingScreen';
  static const String userInfo = 'userInfo';

  // Define routes using named routes
  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    landingscreen: (context) => const LandingScreen(
          firstName: '',
        ),
    userInfo: (context) => const PersonalInfoScreen(
          email: '',
          password: '',
        ),
  };

  // Generate routes dynamically
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboardingScreen:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        );
      default:
        return _errorRoute(settings.name!);
    }
  }

  // Error route
  static Route<dynamic> _errorRoute(String name) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('404: Route $name not found'),
        ),
      ),
    );
  }
}
