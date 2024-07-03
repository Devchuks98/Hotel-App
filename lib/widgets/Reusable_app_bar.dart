import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:hotel_app/util/app_color.dart';
import 'package:hotel_app/widgets/small_text.dart';

class ReusableAppBar extends StatelessWidget {
  final String titleText;
  // final ThemeMode currentThemeMode;
  final double titleFontSize;
  final VoidCallback onTapNotificationIcon;
  final bool willContainNotificationIcon;
  Widget? leading;
  ReusableAppBar({
    Key? key,
    required this.titleText,
    this.leading,
    // required this.currentThemeMode,
    required this.titleFontSize,
    required this.onTapNotificationIcon,
    this.willContainNotificationIcon = true,
    required bool automaticallyImplyLeading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: true,
      title: SmallText(
          text: titleText,
          fontWeight: FontWeight.bold,
          size: titleFontSize,
          color: AppColor.blackColor),
      actions: [
        willContainNotificationIcon == true
            ? IconButton(
                onPressed: onTapNotificationIcon,
                icon: SvgPicture.asset(
                  'assets/svg/Notification.svg',
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
