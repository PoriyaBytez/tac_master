import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';
import 'package:tac/helpers/app_colors.dart';
import 'package:tac/helpers/app_textstyle.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconButton? suffixIcon;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final bool readOnly;
  CommonTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.5.h,
      child: TextField(
          readOnly: readOnly,
          onTap: onTap,
          controller: controller,
          decoration: inputDecoration(),
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: textStyle()),
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: textStyle(color: AppColors.grey),
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        suffixIcon: suffixIcon);
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.whiteAccent),
      borderRadius: BorderRadius.circular(0.5.h),
    );
  }

  TextStyle textStyle({Color color = AppColors.blackColor}) {
    return AppTextStyle.regular14(
      color,
    );
  }
}