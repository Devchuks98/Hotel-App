import 'package:flutter/material.dart';
import 'package:hotel_app/res/app_strings.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight fontWeight;
  final TextAlign align;
  final TextDecoration decoration;
  final FontStyle? style;

  const SmallText({
    Key? key,
    required this.text,
    this.size = 13,
    this.color,
    this.fontWeight = FontWeight.w500,
    this.align = TextAlign.left,
    this.decoration = TextDecoration.none,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontStyle: style,
        color: color,
        fontSize: size,
        fontFamily: AppStrings.poppins,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
    );
  }
}
