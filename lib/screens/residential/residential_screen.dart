import 'package:flutter/material.dart';
import 'package:tac/Helper/firebase_auth_helper.dart';
import 'package:tac/controllers/LoginController.dart';
import 'package:tac/controllers/RegisterController.dart';
import 'package:tac/controllers/ResidentialController.dart';
import 'package:tac/utils/app_images.dart';
import 'package:tac/utils//app_textstyle.dart';
import 'package:tac/screens/land/land_screen.dart';
import 'package:tac/widgets/common_button.dart';
import 'package:tac/widgets/common_date_picker.dart';
import 'package:tac/widgets/common_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/utils/app_colors.dart';
import 'package:tac/utils/app_strings.dart';
import '../../Helper/SharePrefs.dart';
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
  ResidentialController controller = Get.put(ResidentialController());
  RegisterController registerController = Get.put(RegisterController());
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: AppBar(
              backgroundColor: AppColors.whiteColor,
              title: Text(AppStrings.residential,
                  style: AppTextStyle.extraBold24(AppColors.blueSmoke,
                      type: AppTextStyleType.montserrat)),
              centerTitle: true,
              elevation: 0,
              actions: [
                Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.w),
                    child: InkWell(
                      onTap: () {
                        controller.dialog();
                      },
                      child: Image.asset(
                        AppImages.iconLogOut,
                        height: 3.5.h,
                        width: 3.5.h,
                        fit: BoxFit.fill,
                        color: AppColors.blueSmoke,
                      ),
                    ))
              ],
            ),
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.h),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        hBox(4.h),
                        CommonTextField(
                          onTap: () {
                            controller.pickerShowBottomSheet(context);
                          },
                          controller: controller.propertyController,
                          labelText: AppStrings.propertyType,
                          suffixIcon: const Icon(Icons.arrow_drop_down),
                          readOnly: true,
                        ),
                        hBox(2.h),
                        CommonTextField(
                          controller: controller.bedroomController,
                          labelText: AppStrings.bedroom,
                        ),
                        hBox(2.h),
                        CommonTextField(
                          controller: controller.bathroomController,
                          labelText: AppStrings.bathRoom,
                          keyboardType: TextInputType.number,
                        ),
                        hBox(2.h),
                        CommonTextField(
                          controller: controller.lotSizeController,
                          labelText: AppStrings.lotSize,
                          keyboardType: TextInputType.number,
                        ),
                        hBox(2.h),
                        CommonTextField(
                          controller: controller.livingAreaController,
                          labelText: AppStrings.grossLivingArea,
                          keyboardType: TextInputType.number,
                        ),
                        hBox(2.h),
                        CommonTextField(
                          controller: controller.livingAreaController,
                          labelText: AppStrings.grossLivingArea,
                          keyboardType: TextInputType.number,
                        ),
                        hBox(2.h),
                        CommonTextField(
                          onTap: () async {
                            await commonDatePicker(context);
                          },
                          readOnly: true,
                          controller: controller.livingAreaController,
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
                            controller.pickerShowBottomSheet(context);
                          },
                          readOnly: true,
                          controller: controller.poolController,
                          labelText: AppStrings.pool,
                          suffixIcon: const Icon(Icons.arrow_drop_down),
                        ),
                        hBox(2.h),
                        CommonTextField(
                          onTap: () {
                            controller.pickerShowBottomSheet(context);
                          },
                          readOnly: true,
                          controller: controller.attachedDetachedController,
                          labelText: AppStrings.attachedDetached,
                          suffixIcon: const Icon(Icons.arrow_drop_down),
                        ),
                        hBox(2.h),
                        CommonTextField(
                          onTap: () async {
                            await commonDatePicker(context);
                          },
                          readOnly: true,
                          controller: controller.livingAreaController,
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
                Obx(() => registerController.isLoading.value
                    ? SizedBox(
                        height: 90.h,
                        width: double.infinity,
                        child: const Center(
                            child: SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator())),
                      )
                    : const SizedBox())
              ],
            )));
  }
}
