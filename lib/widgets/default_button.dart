import 'package:flutter/material.dart';
import 'package:hotel_app/util/app_color.dart';
import 'package:hotel_app/widgets/small_text.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    Key? key,
    required this.onpressed,
    required this.title,
    this.buttonWidth = double.infinity,
    this.buttonHeight = 48,
    this.buttonTextFontSize = 15,
    this.buttonColor = AppColor.primaryColor,
    this.buttonTextColor = AppColor.whiteColor,
    this.bordercolor = AppColor.primaryColor,
    this.isLoading = false, // Added isLoading parameter
    required bool enabled,
    Null Function()? onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback? onpressed;
  final double buttonWidth;
  final double buttonHeight;
  final double buttonTextFontSize;
  final Color buttonColor;
  final Color buttonTextColor;
  final Color bordercolor;
  final bool isLoading; // Added isLoading parameter

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onpressed, // Disable tap when isLoading
        splashColor: AppColor.primaryColor.withOpacity(0.5), // Splash color
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: buttonHeight,
          width: buttonWidth,
          decoration: BoxDecoration(
            border: Border.all(color: bordercolor, width: 0.5),
            borderRadius: BorderRadius.circular(10),
            color: buttonColor,
          ),
          child: Center(
            child: isLoading // Conditional rendering based on isLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : SmallText(
                    text: title,
                    color: buttonTextColor,
                    fontWeight: FontWeight.w600,
                    size: buttonTextFontSize,
                  ),
          ),
        ),
      ),
    );
  }
}
