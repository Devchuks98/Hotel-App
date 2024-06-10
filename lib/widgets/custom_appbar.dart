import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final double elevation;
  final IconThemeData? iconTheme;
  final String? action;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.backgroundColor = Colors.transparent,
    this.elevation = 0,
    this.iconTheme,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevation: elevation,
      backgroundColor: backgroundColor,
      iconTheme: iconTheme,
      actions: [
        Container(
          margin: EdgeInsets.only(right: 16),
          child: SvgPicture.asset(
            '$action',
            // color: AppColor.primaryColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
