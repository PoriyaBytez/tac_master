import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:tac/widgets/sized_box.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_textstyle.dart';
import '../../widgets/common_back_button.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_home_image.dart';
import '../../widgets/common_textfield.dart';
import 'display_comps_screen.dart';
import 'package:get/get.dart';

class TalkToProfessional extends StatefulWidget {
  const TalkToProfessional({super.key});

  @override
  State<TalkToProfessional> createState() => _TalkToProfessionalState();
}

class _TalkToProfessionalState extends State<TalkToProfessional> {
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
                      "0",
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
                      AppStrings.milesOfYourLocation,
                      style: AppTextStyle.regular14(AppColors.grey,
                          type: AppTextStyleType.ptSerif),
                    ),
                    hBox(11.h),
                    CommonFilledButton(
                        text: AppStrings.talkToAProfessional,
                        onPressed: () {
                          Get.to(() => DisplayCompsScreen());
                        }),
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
              Positioned(top: 1.h, child: const CommonBackButton()),
            ],
          ),
        ),
      ),
    );
  }
}
