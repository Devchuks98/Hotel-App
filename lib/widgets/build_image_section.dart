import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/util/app_color.dart';
import 'package:hotel_app/widgets/big_text.dart';
import 'package:hotel_app/widgets/form_text.dart';
import 'package:hotel_app/widgets/height_spacer.dart';
import 'package:hotel_app/widgets/small_text.dart';
import 'package:ionicons/ionicons.dart';

class ImageSectionWidget extends StatelessWidget {
  final String backgroundImageAsset;
  final String title;
  final String subtitle;
  final bool showAppBar;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onNotificationsPressed;

  const ImageSectionWidget({
    Key? key,
    required this.backgroundImageAsset,
    required this.title,
    required this.subtitle,
    this.showAppBar = true,
    this.onMenuPressed,
    this.onNotificationsPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double heightFactor = showAppBar ? 0.35 : 0.30;

    return Stack(
      children: [
        // Background Image
        Container(
          height: size.height * heightFactor,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImageAsset),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Overlaying Content
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showAppBar)
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: const Text(''),
                  leading: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 18.r,
                    ),
                    onPressed: onMenuPressed,
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(
                        Ionicons.notifications,
                        color: Colors.white,
                        size: 18.r,
                      ),
                      onPressed: onNotificationsPressed,
                    ),
                  ],
                ),
              if (showAppBar) const HeightSpacer(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: showAppBar ? 0 : 80.h),
                    BigText(
                      text: title,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      size: 25,
                    ),
                    SmallText(
                      text: subtitle,
                      size: 15,
                      color: AppColor.whiteColor,
                    ),
                    SizedBox(height: 20.h),
                    const FormText(
                      borderColor: AppColor.whiteColor,
                      isDense: true,
                      hintText: 'Search',
                      iconColor: Colors.white,
                      prefixIcon: Icon(Ionicons.search),
                      borderRadius: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
