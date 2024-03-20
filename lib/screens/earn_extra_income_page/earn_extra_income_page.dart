import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tac/widgets/sized_box.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_textstyle.dart';
import '../../widgets/common_button.dart';

class EarnExtraIncomePage extends StatefulWidget {
  const EarnExtraIncomePage({super.key});

  @override
  State<EarnExtraIncomePage> createState() => _EarnExtraIncomePageState();
}

class _EarnExtraIncomePageState extends State<EarnExtraIncomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: AppColors.whiteColor,
        title: Text(
          AppStrings.earnExtraIncome,
          style: AppTextStyle.extraBold24(
            AppColors.blueSmoke,
            type: AppTextStyleType.montserrat,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.subject,
                style: AppTextStyle.bold12(
                  AppColors.blackColor,
                  type: AppTextStyleType.inter,
                ),
              ),
              hBox(1.h),
              Text(
                AppStrings.introducing,
                style: AppTextStyle.medium12(
                  AppColors.blackColor,
                  type: AppTextStyleType.inter,
                ),
              ),
              hBox(2.h),
              Row(
                children: [
                  Text(
                    AppStrings.hello,
                    style: AppTextStyle.regular12(
                      AppColors.grey,
                      type: AppTextStyleType.inter,
                    ),
                  ),
                  wBox(1.w),
                  Text(
                    AppStrings.salesChampion,
                    style: AppTextStyle.medium12(
                      AppColors.blueColor,
                      type: AppTextStyleType.inter,
                    ),
                  ),
                ],
              ),
              hBox(2.h),
              Text(
                AppStrings.paraGraph,
                style: AppTextStyle.medium12(
                  AppColors.grey,
                  type: AppTextStyleType.inter,
                ),
              ),
              hBox(2.h),
              Text(
                AppStrings.affiliateProgram,
                style: AppTextStyle.medium12(
                  AppColors.blackColor,
                  type: AppTextStyleType.inter,
                ),
              ),
              hBox(2.h),
              Text(
                AppStrings.businessInformation,
                style: AppTextStyle.medium12(
                  AppColors.grey,
                  type: AppTextStyleType.inter,
                ),
              ),
              hBox(2.h),
              Text(
                AppStrings.access,
                style: AppTextStyle.medium12(
                  AppColors.grey,
                  type: AppTextStyleType.inter,
                ),
              ),
              hBox(2.h),
              Text(
                AppStrings.promote,
                style: AppTextStyle.medium12(
                  AppColors.grey,
                  type: AppTextStyleType.inter,
                ),
              ),
              hBox(2.h),
              Text(
                AppStrings.samplePayout,
                style: AppTextStyle.medium12(
                  AppColors.blackColor,
                  type: AppTextStyleType.inter,
                ),
              ),
              hBox(2.h),
              Text(
                AppStrings.price,
                style: AppTextStyle.medium12(
                  AppColors.grey,
                  type: AppTextStyleType.inter,
                ),
              ),
              hBox(2.h),
              Text(
                AppStrings.thriving,
                style: AppTextStyle.medium12(
                  AppColors.grey,
                  type: AppTextStyleType.inter,
                ),
              ),
              hBox(2.h),
              Text(
                AppStrings.opportunity,
                style: AppTextStyle.medium12(
                  AppColors.grey,
                  type: AppTextStyleType.inter,
                ),
              ),
              hBox(2.h),
              Text(
                AppStrings.bestRegards,
                style: AppTextStyle.medium12(
                  AppColors.grey,
                  type: AppTextStyleType.inter,
                ),
              ),
              hBox(2.h),
              Text(
                AppStrings.founder,
                style: AppTextStyle.medium12(
                  AppColors.blackColor,
                  type: AppTextStyleType.inter,
                ),
              ),
              hBox(2.h),
              CommonFilledButton(
                text: AppStrings.agreeAndSign,
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              height: 60.h,
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 1.h),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Column(
                                  children: [
                                    hBox(5.h),
                                    SvgPicture.asset(
                                      AppImages.iconLock,
                                    ),
                                    hBox(2.h),
                                    Text(
                                      AppStrings.unlock,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.bold20(
                                        AppColors.blackColor,
                                        type: AppTextStyleType.inter,
                                      ),
                                    ),
                                    hBox(2.h),
                                    Text(
                                      AppStrings.potential,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.regular15(
                                        AppColors.grey,
                                        type: AppTextStyleType.inter,
                                      ),
                                    ),
                                    const Spacer(),
                                    CommonFilledButton(
                                      text: AppStrings.continueText,
                                      onPressed: () {},
                                    ),
                                    hBox(2.h),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 5.h,
                              width: 5.h,
                              padding: const EdgeInsets.all(1),
                              decoration: const BoxDecoration(
                                color: AppColors.whiteColor,
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: AppColors.blackColor,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              hBox(2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.viewFullAgreement,
                    style: AppTextStyle.bold14(
                      AppColors.grey,
                      type: AppTextStyleType.inter,
                    ),
                  ),
                  wBox(1.w),
                  Text(
                    AppStrings.pdf,
                    style: AppTextStyle.bold14(
                      AppColors.blueColor,
                      type: AppTextStyleType.inter,
                    ),
                  ),
                ],
              ),
              hBox(2.h),
            ],
          ),
        ),
      ),
    );
  }
}
