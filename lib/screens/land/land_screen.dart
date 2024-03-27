import 'package:flutter/material.dart';
import 'package:tac/utils/app_images.dart';

import 'package:tac/screens/residential/show_bottomsheet.dart';
import 'package:tac/screens/talk_to_professional/talk_to_professional_screen.dart';
import 'package:tac/widgets/common_button.dart';
import 'package:tac/widgets/common_date_picker.dart';
import 'package:tac/widgets/common_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/utils/app_colors.dart';
import 'package:tac/utils/app_strings.dart';

import '../../utils/app_textstyle.dart';
import '../../widgets/common_yes_no_toggle.dart';
import '../../widgets/sized_box.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LandScreen extends StatefulWidget {
  const LandScreen({super.key});

  @override
  State<LandScreen> createState() => _LandScreenState();
}

class _LandScreenState extends State<LandScreen> {
  TextEditingController zoningController = TextEditingController();
  TextEditingController slotSizeController = TextEditingController();
  TextEditingController utilitiesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: AppColors.whiteColor,
        title: Text(AppStrings.land,
            style: AppTextStyle.extraBold24(AppColors.blueSmoke,
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
                controller: zoningController,
                labelText: AppStrings.bedroom,
              ),
              hBox(2.h),
              CommonTextField(
                controller: slotSizeController,
                labelText: AppStrings.slotSize,
                keyboardType: TextInputType.number,
              ),
              hBox(2.h),
              CommonTextField(
                controller: utilitiesController,
                labelText: AppStrings.utilities,
              ),
              hBox(37.h),
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
                      Get.to(() => const TalkToProfessional());
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
