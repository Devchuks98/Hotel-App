import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/res/app_routes.dart';
import 'package:hotel_app/res/app_strings.dart';
import 'package:hotel_app/util/theme/theme_data_folder/theme_data.dart';
import 'package:hotel_app/util/theme/theme_data_folder/theme_data_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/homesceen/home.dart';
import 'screens/landing_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final themeProvider = ThemeProvider(sharedPreferences);
  await themeProvider.initializeTheme();
  final initialTheme = themeProvider.currentTheme;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>.value(value: themeProvider),
        ChangeNotifierProvider<PageProvider>(create: (_) => PageProvider()),
      ],
      child: HotelApp(initialTheme: initialTheme),
    ),
  );
}

class HotelApp extends StatefulWidget {
  final ThemeMode initialTheme;

  const HotelApp({
    super.key,
    required this.initialTheme,
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
          navigatorKey: navigatorKey,
          theme: ThemingUtility.lightTheme,
          darkTheme: ThemingUtility.darkTheme,
          themeMode: Provider.of<ThemeProvider>(context).currentTheme,
          home: Home(),
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          routes: AppRoutes.routes,
          initialRoute: AppRoutes.userInfo,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
