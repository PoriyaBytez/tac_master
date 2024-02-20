import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tac/helpers/app_colors.dart';
import 'package:tac/helpers/app_images.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 5.5.h,
        width: 5.5.h,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(4)),
        child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Image.asset(
              width: 1.1.h,
              height: 1.9.h,
              AppImages.backArrow,
            )),
      ),
    );
  }
}
