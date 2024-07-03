import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/util/app_color.dart';
import 'package:hotel_app/widgets/small_text.dart';
import 'package:hotel_app/widgets/width_spacer.dart';

Widget buildIconButton({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    splashColor: AppColor.greyColor1.withOpacity(.3),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      margin: EdgeInsets.symmetric(vertical: 7.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColor.greyColor4,
            size: 22.r,
          ),
          const WidthSpacer(10),
          SmallText(
            text: title,
            size: 15.sp,
            color: AppColor.greyColor4,
          ),
        ],
      ),
    ),
  );
}
