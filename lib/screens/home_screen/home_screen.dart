import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/helpers/app_images.dart';
import '../../helpers/app_colors.dart';
import '../../helpers/app_strings.dart';
import '../../helpers/app_textstyle.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_home_image.dart';
import '../../widgets/sized_box.dart';
import '../applying_proprietary/applying_proprietary.dart';
import '../talk_to_professional/display_comps_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                hBox(5.h),
                Text(
                  "56",
                  style: AppTextStyle.extraBold30(AppColors.primaryColor,
                      type: AppTextStyleType.montserrat),
                ),
                hBox(1.5.h),
                Text(
                  AppStrings.basedOnComps,
                  style: AppTextStyle.regular14(AppColors.grey,
                      type: AppTextStyleType.ptSerif),
                ),
                hBox(1.5.h),
                Text(
                  "8",
                  style: AppTextStyle.extraBold30(AppColors.primaryColor,
                      type: AppTextStyleType.montserrat),
                ),
                hBox(1.5.h),
                Text(
                  textAlign: TextAlign.center,
                  AppStrings.compsFromDayFound,
                  style: AppTextStyle.regular14(AppColors.grey,
                      type: AppTextStyleType.ptSerif),
                ),
                hBox(1.5.h),
                Text(
                  "3",
                  style: AppTextStyle.extraBold30(AppColors.primaryColor,
                      type: AppTextStyleType.montserrat),
                ),
                hBox(1.5.h),
                Text(
                  textAlign: TextAlign.center,
                  AppStrings.milesTheSubjectProperty,
                  style: AppTextStyle.regular14(AppColors.grey,
                      type: AppTextStyleType.ptSerif),
                ),
                hBox(2.h),
                InkWell(
                  onTap: () {
                    Get.to(() => ApplyingProprietary());
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(AppImages.blueCard),
                      Text(
                        "1,000,000\$\n1,200,000\$",
                        style: AppTextStyle.extraBold30(AppColors.whiteColor,
                            type: AppTextStyleType.montserrat),
                      ),
                    ],
                  ),
                ),
                hBox(2.5.h),
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
