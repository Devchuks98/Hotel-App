import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/util/app_color.dart';

Widget socialSignInButton({
  required String imageUrl,
  required VoidCallback onPressed,
  Color buttonColor = Colors.white,
  Color borderColor = Colors.grey,
}) {
  return InkWell(
    onTap: onPressed,
    borderRadius: BorderRadius.circular(30),
    splashColor: AppColor.bg,
    child: Container(
      margin: EdgeInsets.only(right: 10, left: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor.withOpacity(0.4)),
        color: buttonColor,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        imageUrl,
        height: 20,
        width: 20,
      ),
    ),
  );
}
