import 'package:flutter/material.dart';
import 'package:tac/utils/app_images.dart';
import 'package:tac/widgets/sized_box.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_textstyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/common_button.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

RxList<Map<String, dynamic>> selectedItems = [
  {
    'title': AppStrings.saveToYourProfile,
    'icon': AppImages.iconProfile,
    'isSelected': false.obs,
  },
  {
    'title': AppStrings.shareToEmail,
    'icon': AppImages.iconMail,
    'isSelected': false.obs,
  },
  {
    'title': AppStrings.talkToaProfessional,
    'icon': AppImages.iconCall,
    'isSelected': false.obs,
  },
  {
    'title': AppStrings.getAppraisalServicesQuote,
    'icon': AppImages.iconQuote,
    'isSelected': false.obs,
  },
  {
    'title': AppStrings.getMonthlyMarketUpdates,
    'icon': AppImages.iconUpdate,
    'isSelected': false.obs,
  },
  {
    'title': AppStrings.requestNetSheet,
    'icon': AppImages.iconDoc,
    'isSelected': false.obs,
  },
].obs;

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: AppColors.whiteColor,
        title: Text(AppStrings.nowWhat,
            style: AppTextStyle.extraBold24(AppColors.blueSmoke,
                type: AppTextStyleType.montserrat)),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        child: CommonFilledButton(
          buttonType: ButtonType.filledButton,
          text: AppStrings.continueText,
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              itemCount: selectedItems.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 22.0.h,
              ),
              itemBuilder: (context, i) {
                return Obx(
                  () => InkWell(
                    onTap: () {
                      selectedItems[i]['isSelected'].value =
                          !selectedItems[i]['isSelected'].value;
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 1.w, vertical: 0.5.h),
                      decoration: BoxDecoration(
                        color: selectedItems[i]['isSelected'].value
                            ? AppColors.primaryColor
                            : AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: selectedItems[i]['isSelected'].value
                              ? AppColors.primaryColor
                              : AppColors.whiteAccent,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          selectedItems[i]['isSelected'].value
                              ? Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: 2.w, top: 1.h),
                                    height: 2.5.h,
                                    width: 2.5.h,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.whiteColor,
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: AppColors.primaryColor,
                                      size: 1.5.h,
                                    ),
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.only(right: 2.w, top: 1.h),
                                  height: 2.5.h,
                                  width: 2.5.h,
                                ),
                          Container(
                            height: 10.h,
                            width: 10.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selectedItems[i]['isSelected'].value
                                  ? AppColors.blueAccentColor
                                  : AppColors.white2,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              selectedItems[i]['icon'],
                              color: selectedItems[i]['isSelected'].value
                                  ? AppColors.whiteColor
                                  : AppColors.grey,
                            ),
                          ),
                          hBox(1.h),
                          Container(
                            width: 30.w,
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            height: 5.h,
                            child: Text(
                              selectedItems[i]['title'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: AppTextStyle.bold14(
                                selectedItems[i]['isSelected'].value
                                    ? AppColors.whiteColor
                                    : AppColors.grey,
                                type: AppTextStyleType.ptSerif,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            hBox(1.h),
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: AppColors.whiteAccent,
                  ),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        width: 3.h,
                        child: SvgPicture.asset(
                          AppImages.iconCheck,
                          height: 3.h,
                          width: 3.h,
                          color: AppColors.grey,
                        ),
                      ),
                      wBox(3.w),
                      Text(
                        AppStrings.checkStatusOfAppraisalRequest,
                        style: AppTextStyle.bold14(
                          AppColors.grey,
                          type: AppTextStyleType.ptSerif,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            hBox(1.h),
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: AppColors.whiteAccent,
                  ),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        width: 3.h,
                        child: SvgPicture.asset(
                          AppImages.iconUnlock,
                          height: 3.h,
                          width: 3.h,
                          color: AppColors.grey,
                        ),
                      ),
                      wBox(3.w),
                      Text(
                        AppStrings.unlockYourEarningsPotential,
                        style: AppTextStyle.bold14(
                          AppColors.grey,
                          type: AppTextStyleType.ptSerif,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
