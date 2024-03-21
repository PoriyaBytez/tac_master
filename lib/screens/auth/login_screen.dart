import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/controllers/SigninController.dart';
import 'package:tac/utils/app_colors.dart';
import 'package:tac/utils/app_strings.dart';
import 'package:tac/widgets/TValidator.dart';
import '../../utils/app_textstyle.dart';
import 'package:tac/screens/residential/residential_screen.dart';
import 'package:tac/widgets/sized_box.dart';
import '../../widgets/common_back_button.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_home_image.dart';
import '../../widgets/common_textfield.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SigninController controller = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        hBox(4.h),
                        commonHomeImage(),
                        hBox(5.h),
                        Text(
                          textAlign: TextAlign.center,
                          AppStrings.pickUpWhereYouLeft,
                          style: AppTextStyle.extraBold24(AppColors.blueSmoke,
                              type: AppTextStyleType.montserrat),
                        ),
                        hBox(3.2.h),
                        Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              CommonTextField(
                                controller: controller.userNameController,
                                labelText: AppStrings.userName,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return AppStrings.errorTxtUsernameEmpty;
                                  }
                                  return null;
                                },
                              ),
                              hBox(2.h),
                              CommonTextField(
                                controller: controller.passWordController,
                                labelText: AppStrings.password,
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return AppStrings.errorTxtPassEmpty;
                                  } else if (value.length < 8) {
                                    return AppStrings.errorTxtPassLength;
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        hBox(4.75.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.6.h),
                          child: CommonFilledButton(
                            text: AppStrings.login,
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                log("----FORM VALIDATE LOGIN SCREEN----");
                                controller.login();
                                // Get.to(() => const ResidentialScreen());
                              }
                            },
                          ),
                        ),
                        hBox(2.h),
                        CommonTextButton(
                            text: AppStrings.forgotYourPassword, onPressed: () {})
                      ],
                    ),
                    Positioned(top: 1.h, child: const CommonBackButton()),
                  ],
                ),
              ),
            ),
            Obx(() => controller.isLoading.value
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
        ),
      ),
    );
  }
}
