import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/utils/app_images.dart';

import 'package:tac/utils/app_colors.dart';
import 'package:tac/utils/app_strings.dart';
import '../../utils/app_textstyle.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_home_image.dart';
import '../../widgets/sized_box.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ApplyingProprietary extends StatefulWidget {
  const ApplyingProprietary({super.key});

  @override
  State<ApplyingProprietary> createState() => _ApplyingProprietaryState();
}

class _ApplyingProprietaryState extends State<ApplyingProprietary> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                hBox(4.h),
                commonHomeImage(),
                hBox(4.h),
                Text(
                  AppStrings.applyingProprietary,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.extraBold30(AppColors.primaryColor,
                      type: AppTextStyleType.montserrat),
                ),
                hBox(1.5.h),
                Text(
                  AppStrings.mostWeightGivenToRecent,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.regular14(AppColors.grey,
                      type: AppTextStyleType.ptSerif),
                ),
                hBox(7.6.h),
                SpinKitCircle(
                  color: AppColors.primaryColor,
                  size: 7.h,
                ),
                hBox(7.6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.getQuoteFor,
                      style: AppTextStyle.regular14(
                        AppColors.grey,
                      ),
                    ),
                    CommonTextButton(
                      text: AppStrings.appraisalServices,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
