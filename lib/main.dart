import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/res/app_routes.dart';
import 'package:hotel_app/res/app_strings.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(
    const HotelApp(),
  );
}

class HotelApp extends StatefulWidget {
  const HotelApp({
    super.key,
  });

  @override
  State<HotelApp> createState() => _HotelAppState();
}

class _HotelAppState extends State<HotelApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          home: const HomePage(),
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          routes: AppRoutes.routes,
          initialRoute: AppRoutes.splashScreen,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
