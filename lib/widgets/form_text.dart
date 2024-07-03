import 'package:flutter/material.dart';
import 'package:hotel_app/util/app_color.dart';

class FormText extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final Color? fillColor;
  final GestureTapCallback? onTap;
  final String? labelText;
  final String? textViewTitle;
  final String? hintText;
  final bool readOnly;
  final bool autofocus;
  final bool autocorrect;
  final bool obscureText;
  final double borderRadius;
  final double borderWidth;
  final bool isDense;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? borderColor;
  final int? maxLines;
  final int? maxLength;
  final bool filled;
  final String? prefixText;
  final String? helperText;
  final Color? iconColor;
  final Color? textColor;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;

  final EdgeInsetsGeometry? contentPadding;
  const FormText({
    Key? key,
    this.onChanged,
    this.controller,
    this.fillColor,
    this.onTap,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.readOnly = false,
    this.autofocus = false,
    this.autocorrect = false,
    this.obscureText = false,
    this.isDense = true,
    this.labelText,
    this.hintText,
    this.onFieldSubmitted,
    this.borderRadius = 6.0,
    this.borderWidth = 0.5,
    this.suffixIcon,
    this.iconColor,
    this.textColor = Colors.white,
    this.prefixIcon,
    this.borderColor,
    this.filled = true,
    this.prefixText,
    this.autofillHints,
    this.focusNode,
    this.helperText,
    this.maxLength,
    this.maxLines = 1,
    this.contentPadding,
    this.textViewTitle = '',
  }) : super(key: key);

  OutlineInputBorder _border(BuildContext context) => OutlineInputBorder(
      borderSide: BorderSide(
          width: borderWidth,
          color: borderColor ?? Theme.of(context).shadowColor.withOpacity(0.3),
          style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)));

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
              primary: Theme.of(context).colorScheme.secondary)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            validator: validator,
            onChanged: onChanged,
            onTap: onTap,
            autocorrect: autocorrect,
            readOnly: readOnly,
            autofocus: autofocus,
            obscureText: obscureText,
            maxLines: maxLines,
            maxLength: maxLength,
            autofillHints: autofillHints,
            onFieldSubmitted: onFieldSubmitted,
            focusNode: focusNode,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.normal, fontSize: 14),
            decoration: InputDecoration(
                border: _border(context),
                enabledBorder: _border(context),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(
                        width: borderWidth,
                        color: AppColor.whiteColor,
                        style: BorderStyle.solid)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(
                        width: borderWidth,
                        color: borderColor ??
                            Theme.of(context).colorScheme.secondary,
                        style: BorderStyle.solid)),
                errorBorder: _border(context),
                disabledBorder: _border(context),
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.white, fontSize: 13.5),
                labelText: labelText,
                contentPadding: contentPadding,
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                filled: filled,
                isDense: isDense,
                fillColor: fillColor ??
                    Theme.of(context).shadowColor.withOpacity(0.05),
                helperText: helperText,
                helperMaxLines: 2,
                helperStyle: const TextStyle(fontSize: 10),
                prefixText: prefixText,
                prefixIcon: prefixIcon,
                iconColor: iconColor,
                prefixIconColor: iconColor,
                suffixIcon: suffixIcon,
                suffixIconColor: AppColor.lightcolor),
          ),
        ],
      ),
    );
  }
}
