import 'package:flutter/material.dart';

Widget textDivider({
  required String text,
  TextStyle textStyle = const TextStyle(),
  Color dividerColor = Colors.grey,
  double height = 1.0,
}) {
  return Row(
    children: <Widget>[
      Expanded(
        child: Divider(
          color: dividerColor,
          height: height,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
      Expanded(
        child: Divider(
          color: dividerColor,
          height: height,
        ),
      ),
    ],
  );
}
