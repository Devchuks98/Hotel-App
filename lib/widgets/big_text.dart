//big text
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/res/app_strings.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  final FontWeight fontWeight;
  final TextAlign align;
  final TextDecoration decoration;
  final FontStyle? style;
  BigText({
    super.key,
    this.color = const Color(0xFF332d2d),
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 20,
    this.fontWeight = FontWeight.w500,
    this.align = TextAlign.left,
    this.decoration = TextDecoration.none,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: size.sp,
        fontFamily: AppStrings.poppins,
        decoration: decoration,
      ),
    );
  }
}
