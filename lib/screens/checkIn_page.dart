import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/widgets/small_text.dart';
import 'package:lottie/lottie.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            "assets/animations/website-maintenance.json",
            height: 200.h,
            width: 200.w,
          ),
          SmallText(
            text: 'No check In Yet',
            size: 15.sp,
          ),
        ],
      ),
    );
  }
}
