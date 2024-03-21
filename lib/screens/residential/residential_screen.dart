import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tac/SharePref/SharePrefs.dart';
import 'package:tac/controllers/ResidentialController.dart';
import 'package:tac/utils/app_images.dart';

import 'package:tac/utils//app_textstyle.dart';
import 'package:tac/screens/land/land_screen.dart';
import 'package:tac/screens/residential/show_bottomsheet.dart';
import 'package:tac/widgets/common_button.dart';
import 'package:tac/widgets/common_date_picker.dart';
import 'package:tac/widgets/common_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/utils/app_colors.dart';
import 'package:tac/utils/app_strings.dart';
import '../../widgets/common_yes_no_toggle.dart';
import '../../widgets/sized_box.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ResidentialScreen extends StatefulWidget {
  const ResidentialScreen({super.key});

  @override
  State<ResidentialScreen> createState() => _ResidentialScreenState();
}

class _ResidentialScreenState extends State<ResidentialScreen> {
  TextEditingController bedroomController = TextEditingController();
  TextEditingController bathroomController = TextEditingController();
  TextEditingController lotSizeController = TextEditingController();
  TextEditingController livingAreaController = TextEditingController();

  ResidentialController controller = Get.put(ResidentialController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(AppStrings.residential,
            style: AppTextStyle.extraBold24(AppColors.primaryColor,
                type: AppTextStyleType.montserrat)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              hBox(4.h),
              CommonTextField(
                onTap: () {
                  pickerShowBottomSheet(context, setState);
                },
                controller: TextEditingController(text: "hiii"),
                labelText: AppStrings.propertyType,
                suffixIcon: IconButton(
                  onPressed: () {
                    pickerShowBottomSheet(context, setState);
                  },
                  icon: Icon(Icons.arrow_drop_down),
                ),
              ),
              hBox(2.h),
              CommonTextField(
                controller: bedroomController,
                labelText: AppStrings.bedroom,
              ),
              hBox(2.h),
              CommonTextField(
                controller: bathroomController,
                labelText: AppStrings.bathRoom,
                keyboardType: TextInputType.number,
              ),
              hBox(2.h),
              CommonTextField(
                controller: lotSizeController,
                labelText: AppStrings.lotSize,
                keyboardType: TextInputType.number,
              ),
              hBox(2.h),
              CommonTextField(
                controller: livingAreaController,
                labelText: AppStrings.grossLivingArea,
                keyboardType: TextInputType.number,
              ),
              hBox(2.h),
              CommonTextField(
                controller: livingAreaController,
                labelText: AppStrings.grossLivingArea,
                keyboardType: TextInputType.number,
              ),
              hBox(2.h),
              CommonTextField(
                onTap: () async {
                  await commonDatePicker(context);
                },
                readOnly: true,
                controller: livingAreaController,
                labelText: AppStrings.grossLivingArea,
                keyboardType: TextInputType.number,
                suffixIcon: IconButton(
                  onPressed: () async {
                    await commonDatePicker(context);
                  },
                  icon: SvgPicture.asset(AppImages.iconDate),
                ),
              ),
              hBox(2.h),
              CommonTextField(
                onTap: () {
                  pickerShowBottomSheet(context, setState);
                },
                readOnly: true,
                controller: TextEditingController(),
                labelText: AppStrings.pool,
                suffixIcon: IconButton(
                  onPressed: () {
                    pickerShowBottomSheet(context, setState);
                  },
                  icon: Icon(Icons.arrow_drop_down),
                ),
              ),
              hBox(2.h),
              CommonTextField(
                onTap: () {
                  pickerShowBottomSheet(context, setState);
                },
                readOnly: true,
                controller: TextEditingController(),
                labelText: AppStrings.attachedDetached,
                suffixIcon: IconButton(
                  onPressed: () {
                    pickerShowBottomSheet(context, setState);
                  },
                  icon: Icon(Icons.arrow_drop_down),
                ),
              ),
              hBox(2.h),
              CommonTextField(
                onTap: () async {
                  await commonDatePicker(context);
                },
                readOnly: true,
                controller: livingAreaController,
                labelText: AppStrings.recentUpgrades,
                keyboardType: TextInputType.number,
                suffixIcon: IconButton(
                  onPressed: () async {
                    await commonDatePicker(context);
                  },
                  icon: SvgPicture.asset(AppImages.iconDate),
                ),
              ),
              hBox(6.5.h),
              Text(
                AppStrings.areThisDetailsCorrect,
                style: AppTextStyle.regular14(AppColors.grey,
                    type: AppTextStyleType.ptSerif),
              ),
              hBox(2.5.h),
              YesNoToggle(isYesSelected: true),
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
                    onPressed: () {
                      Get.to(() => const LandScreen());
                    },
                  ),
                ],
              ),
              hBox(2.5.h),
            ],
          ),
        ),
      ),
    ));
  }
}
