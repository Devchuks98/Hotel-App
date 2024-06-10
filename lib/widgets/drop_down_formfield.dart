import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/util/app_color.dart';

class CustomDropDownButtonField extends StatelessWidget {
  final String initialValue;
  final List<String> items;
  final void Function(String?)? onChanged;
  final EdgeInsetsGeometry? padding;
  const CustomDropDownButtonField({
    Key? key,
    required this.initialValue,
    required this.items,
    this.onChanged,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: DropdownButtonFormField(
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        menuMaxHeight: 300,
        isExpanded: true,

        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: AppColor.primaryColor,
          size: 20,
        ),
        value: initialValue,

        borderRadius: BorderRadius.circular(15),

        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            alignment: Alignment.centerLeft,
            value: value,
            child: Text(
              value,
              style: TextStyle(
                color: Color(0xFF868686),
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,

        // style: const TextStyle(
        //   color: Colors.black,
        //   fontWeight: FontWeight.bold,
        //   fontSize: 19,
        // ),

        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.greyColor5,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.greyColor5,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.primaryColor,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          hintText: "Select",
          hintStyle: TextStyle(
            color: Color(0xFFCDCDCD),
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),

        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select your state';
          }
          return null;
        },
      ),
    );
  }
}
