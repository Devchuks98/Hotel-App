// import 'package:esteps/util/app_color.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../res/app_strings.dart';

// class ThemingUtility {
//   static TextStyle poppinsTextStyle({
//     double fontSize = 14,
//     FontWeight fontWeight = FontWeight.normal,
//     Color color = AppColor.blackColor,
//   }) {
//     return TextStyle(
//       fontFamily: AppStrings.poppins,
//       fontSize: fontSize,
//       fontWeight: fontWeight,
//       color: color,
//     );
//   }

//   static final ThemeData lightTheme = ThemeData(
//     fontFamily: AppStrings.poppins,
//     useMaterial3: true,
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//     appBarTheme: AppBarTheme(
//       titleTextStyle: poppinsTextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.bold,
//         color: AppColor.blackColor,
//       ),
//       actionsIconTheme: const IconThemeData(color: AppColor.primaryColor),
//       iconTheme: const IconThemeData(color: AppColor.primaryColor),
//       backgroundColor: AppColor.whiteColor,
//     ),
//     cardTheme: const CardTheme(
//       color: AppColor.whiteColor,
//     ),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//         backgroundColor: AppColor.bottomNavColor),
//     primaryColor: AppColor.primaryColor,
//     highlightColor: AppColor.primaryColor,
//     scaffoldBackgroundColor: AppColor.whiteColor,
//     textTheme: TextTheme(
//       displayLarge: poppinsTextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//         color: AppColor.blackColor,
//       ),
//       displayMedium: poppinsTextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.bold,
//         color: AppColor.blackColor,
//       ),
//       displaySmall: poppinsTextStyle(
//         fontSize: 16,
//         fontWeight: FontWeight.bold,
//         color: AppColor.blackColor,
//       ),
//       titleLarge: poppinsTextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.bold,
//         color: AppColor.blackColor,
//       ),
//       titleMedium: poppinsTextStyle(
//         fontSize: 14,
//         fontWeight: FontWeight.bold,
//         color: AppColor.blackColor,
//       ),
//       titleSmall: poppinsTextStyle(
//         fontSize: 12,
//         fontWeight: FontWeight.bold,
//         color: AppColor.blackColor,
//       ),
//       bodyLarge: poppinsTextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.w600,
//         color: AppColor.blackColor,
//       ),
//       bodyMedium: poppinsTextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.w500,
//         color: AppColor.blackColor,
//       ),
//       bodySmall: poppinsTextStyle(
//         fontSize: 12,
//         color: AppColor.blackColor.withOpacity(0.4),
//       ),
//     ),
//     iconTheme: const IconThemeData(color: AppColor.primaryColor),
//     textButtonTheme: TextButtonThemeData(
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all<Color>(AppColor.bodyColor),
//         foregroundColor: MaterialStateProperty.all<Color>(AppColor.whiteColor),
//         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//           const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(5)),
//           ),
//         ),
//       ),
//     ),
//     toggleButtonsTheme: ToggleButtonsThemeData(
//       selectedColor: AppColor.bodyColor,
//       fillColor: AppColor.bodyColor.withOpacity(0.1),
//       textStyle: const TextStyle(color: AppColor.whiteColor),
//       selectedBorderColor: AppColor.bodyColor,
//       borderRadius: BorderRadius.circular(8.0),
//     ),
//     colorScheme: ColorScheme.fromSwatch().copyWith(
//       primary: AppColor.primaryColor,
//       onPrimary: AppColor.primaryColor,
//       secondary: AppColor.secondaryColor,
//       onSecondary: AppColor.secondaryColor,
//       surface: AppColor.whiteColor,
//       onSurface: AppColor.whiteColor,
//       error: Colors.red,
//       onError: Colors.red,
//       background: AppColor.whiteColor,
//       onBackground: AppColor.whiteColor,
//       brightness: Brightness.light,
//     ),
//   );

//   static final ThemeData darkTheme = ThemeData(
//     appBarTheme: AppBarTheme(
//       titleTextStyle: poppinsTextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.bold,
//         color: AppColor.whiteColor,
//       ),
//       actionsIconTheme: const IconThemeData(color: AppColor.primaryColor),
//       iconTheme: const IconThemeData(color: AppColor.primaryColor),
//       backgroundColor: const Color(0xFF2E2E2E),
//     ),
//     cardTheme: const CardTheme(
//       color: Color(0xFF2E2E2E),
//     ),
//     primaryColor: AppColor.primaryColor,
//     highlightColor: AppColor.primaryColor,
//     scaffoldBackgroundColor: const Color(0xFF2E2E2E),
//     textTheme: TextTheme(
//       displayLarge: poppinsTextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//         color: AppColor.whiteColor,
//       ),
//       displayMedium: poppinsTextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.bold,
//         color: AppColor.whiteColor,
//       ),
//       displaySmall: poppinsTextStyle(
//         fontSize: 16,
//         fontWeight: FontWeight.bold,
//         color: AppColor.whiteColor,
//       ),
//       titleLarge: poppinsTextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.bold,
//         color: AppColor.whiteColor,
//       ),
//       titleMedium: poppinsTextStyle(
//         fontSize: 14,
//         fontWeight: FontWeight.bold,
//         color: AppColor.whiteColor,
//       ),
//       titleSmall: poppinsTextStyle(
//         fontSize: 12,
//         fontWeight: FontWeight.bold,
//         color: AppColor.whiteColor,
//       ),
//       bodyLarge: poppinsTextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.w600,
//         color: AppColor.whiteColor,
//       ),
//       bodyMedium: poppinsTextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.w500,
//         color: AppColor.whiteColor,
//       ),
//       bodySmall: poppinsTextStyle(
//         fontSize: 12,
//         color: AppColor.whiteColor.withOpacity(0.4),
//       ),
//     ),
//     iconTheme: const IconThemeData(color: AppColor.primaryColor),
//     textButtonTheme: TextButtonThemeData(
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all<Color>(AppColor.bodyColor),
//         foregroundColor: MaterialStateProperty.all<Color>(AppColor.whiteColor),
//         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//           const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(5)),
//           ),
//         ),
//       ),
//     ),
//     toggleButtonsTheme: ToggleButtonsThemeData(
//       selectedColor: const Color(0xFF2E2E2E),
//       fillColor: const Color(0xFF2E2E2E).withOpacity(0.1),
//       textStyle: const TextStyle(color: AppColor.whiteColor),
//       selectedBorderColor: const Color(0xFF2E2E2E),
//       borderRadius: BorderRadius.circular(8.0),
//     ),
//     colorScheme: ColorScheme.fromSwatch().copyWith(
//       primary: AppColor.primaryColor,
//       onPrimary: AppColor.primaryColor,
//       secondary: AppColor.secondaryColor,
//       onSecondary: AppColor.searchBackgroundColor,
//       surface: const Color(0xFF2E2E2E),
//       onSurface: const Color(0xFF2E2E2E),
//       error: Colors.red,
//       onError: Colors.red,
//       background: const Color(0xFF2E2E2E),
//       onBackground: const Color(0xFF2E2E2E),
//       brightness: Brightness.dark,
//     ),
//   );

//   static Future<ThemeMode> getInitialTheme() async {
//     final prefs = await SharedPreferences.getInstance();
//     final themeString = prefs.getString('theme');
//     if (themeString == null) return ThemeMode.light;
//     // Check if the themeString is a valid enum value before converting
//     if (ThemeMode.values.any((e) => e.toString() == themeString)) {
//       return ThemeMode.values.firstWhere((e) => e.toString() == themeString);
//     } else {
//       // If the stored value is invalid, fallback to system default
//       return ThemeMode.system;
//     }
//   }

//   static ThemeData getThemeData(ThemeMode theme, BuildContext context) {
//     switch (theme) {
//       case ThemeMode.light:
//         return lightTheme;
//       case ThemeMode.dark:
//         return darkTheme;
//       case ThemeMode.system:
//         final brightness = MediaQuery.of(context).platformBrightness;
//         return brightness == Brightness.light ? lightTheme : darkTheme;
//     }
//   }
// }
