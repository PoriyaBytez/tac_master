import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/helpers/app_colors.dart';
import 'package:tac/helpers/app_strings.dart';
import 'package:tac/helpers/app_textstyle.dart';
import 'package:tac/widgets/sized_box.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_home_image.dart';
import '../comps_results/comps_results_screen.dart';
import 'package:get/get.dart';

class DisplayCompsScreen extends StatefulWidget {
  const DisplayCompsScreen({super.key});

  @override
  State<DisplayCompsScreen> createState() => _DisplayCompsScreenState();
}

class _DisplayCompsScreenState extends State<DisplayCompsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: Stack(
            children: [
              SingleChildScrollView(
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
                      AppStrings.compsWereFoundWithin,
                      style: AppTextStyle.regular14(AppColors.grey,
                          type: AppTextStyleType.ptSerif),
                    ),
                    hBox(1.5.h),
                    Text(
                      "5",
                      style: AppTextStyle.extraBold30(AppColors.primaryColor,
                          type: AppTextStyleType.montserrat),
                    ),
                    hBox(1.5.h),
                    Text(
                      textAlign: TextAlign.center,
                      AppStrings.milesAnimatedNumber,
                      style: AppTextStyle.regular14(AppColors.grey,
                          type: AppTextStyleType.ptSerif),
                    ),
                    hBox(2.75.h),
                    CommonOutlinedButton(
                        text: AppStrings.displayComps,
                        onPressed: () {
                          Get.to(() => const CompsResultScreen());
                        }),
                    hBox(1.h),
                    CommonFilledButton(
                        text: AppStrings.talkToAProfessional, onPressed: () {}),
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
            ],
          ),
        ),
      ),
    );
  }
}
