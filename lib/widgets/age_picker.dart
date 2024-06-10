//age date picker
import 'package:flutter/material.dart';
import 'package:hotel_app/util/app_color.dart';
import 'package:intl/intl.dart';

class DatePickerHelper {
  static Future<void> showDatePickerDialog(
      BuildContext context, TextEditingController controller) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColor.lightmode, // header background color
              onPrimary: AppColor.primaryColor, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      final DateFormat dateFormat = DateFormat('d/M/y');
      final String formattedDate = dateFormat.format(selectedDate);
      controller.text = formattedDate;
    }
  }
}
