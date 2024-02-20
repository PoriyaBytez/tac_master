import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/helpers/app_colors.dart';
import 'package:tac/helpers/app_strings.dart';
import 'package:tac/helpers/app_textstyle.dart';

class YesNoToggle extends StatefulWidget {
  YesNoToggle({super.key, required this.isYesSelected});
  bool isYesSelected;
  @override
  _YesNoToggleState createState() => _YesNoToggleState();
}

class _YesNoToggleState extends State<YesNoToggle> {
  Widget buildButton(String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: 15.5.h,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(4),
        child: AnimatedContainer(
          height: 7.h,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Container(
            child: Center(
              child: Text(
                text,
                style: AppTextStyle.bold18(
                  color == AppColors.white2
                      ? AppColors.grey
                      : AppColors.whiteColor,
                  type: AppTextStyleType.ptSerif,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 31.h,
      height: 7.h,
      child: Stack(
        children: [
          Positioned(
            right: widget.isYesSelected ? 0 : 0.8.h,
            child: buildButton(
              AppStrings.no,
              widget.isYesSelected ? AppColors.blueColor : AppColors.white2,
              () => setState(() => widget.isYesSelected = true),
            ),
          ),
          Positioned(
            child: buildButton(
              AppStrings.yes,
              widget.isYesSelected ? AppColors.white2 : AppColors.blueColor,
              () => setState(() => widget.isYesSelected = false),
            ),
          ),
        ],
      ),
    );
  }
}
