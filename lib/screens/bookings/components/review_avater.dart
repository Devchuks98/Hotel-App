import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/util/app_color.dart';

class ReviewerAvatars extends StatelessWidget {
  final List<String> imagePaths;

  ReviewerAvatars({required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: imagePaths.map((imagePath) {
        return Align(
          widthFactor: 0.7,
          child: CircleAvatar(
            backgroundColor: AppColor.greyColor9,
            backgroundImage: AssetImage(imagePath),
            radius: 10.r,
          ),
        );
      }).toList(),
    );
  }
}
