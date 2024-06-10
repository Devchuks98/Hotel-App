import 'package:flutter/material.dart';
import 'package:hotel_app/screens/onboarding_screen.dart';
import 'package:hotel_app/screens/splash_screen.dart';

class AppRoutes {
  // Route names
  static const String splashScreen = 'splashScreen';
  static const String bottomNavScreen = 'bottomNavScreen';
  static const String emailAuth = 'emailAuth';
  static const String onboardingScreen = 'onboardingScreen';

  // Define routes using named routes
  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    // bottomNavScreen: (context) => LandingScreen(),
    //emailAuth: (context) => EmailAuth(),
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
