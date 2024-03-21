import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/controllers/SignupController.dart';
import 'package:tac/utils/app_colors.dart';
import 'package:tac/utils/app_strings.dart';
import 'package:tac/widgets/TValidator.dart';
import '../../utils/app_textstyle.dart';
import 'package:tac/widgets/sized_box.dart';
import '../../widgets/common_back_button.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_home_image.dart';
import '../../widgets/common_textfield.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: Stack(
            children: [
              Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        hBox(4.h),
                        commonHomeImage(),
                        hBox(5.h),
                        Text(
                          textAlign: TextAlign.center,
                          AppStrings.createNewAccount,
                          style: AppTextStyle.extraBold24(AppColors.blueSmoke,
                              type: AppTextStyleType.montserrat),
                        ),
                        hBox(6.5.h),
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
                                controller: controller.emailController,
                                labelText: AppStrings.email,
                                validator: (value) {
                                  final emailRegExp = RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                                  if (value!.isEmpty) {
                                    return AppStrings.errorTxtUsernameEmpty;
                                  }
                                  if (!emailRegExp.hasMatch(value)) {
                                    return AppStrings.errorTxtUnValidEmail;
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
                              hBox(2.h),
                              CommonTextField(
                                controller:
                                    controller.confirmPasswordController,
                                labelText: AppStrings.confirmPassword,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppStrings.errorTxtConfirmPassEmpty;
                                  } else if (value.length < 8) {
                                    return AppStrings.errorTxtPassLength;
                                  } else if (value !=
                                      controller.passWordController.text) {
                                    return AppStrings.errorTxtConfirmPass;
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        hBox(1.5.h),
                        RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: AppStrings.byContinueAgree,
                                  style: AppTextStyle.regular14(AppColors.grey,
                                      type: AppTextStyleType.ptSerif)),
                              TextSpan(
                                  text: AppStrings.termsAndCondition,
                                  style: AppTextStyle.regular14(
                                      AppColors.blueSmoke,
                                      type: AppTextStyleType.ptSerif)),
                              TextSpan(
                                  text: AppStrings.and,
                                  style: AppTextStyle.regular14(AppColors.grey,
                                      type: AppTextStyleType.ptSerif)),
                              TextSpan(
                                  text: AppStrings.privacyPolicy,
                                  style: AppTextStyle.regular14(
                                      AppColors.blueSmoke,
                                      type: AppTextStyleType.ptSerif)),
                            ])),
                        hBox(4.90.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.6.h),
                          child: CommonFilledButton(
                            text: AppStrings.signUp,
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                log("----FORM VALIDATE REGISTER PAGE----");
                                controller.signUp();
                              }
                            },
                          ),
                        ),
                        hBox(2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.alreadyHaveAnAccount,
                              style: AppTextStyle.regular14(
                                AppColors.grey,
                              ),
                            ),
                            wBox(0.4.h),
                            CommonTextButton(
                                text: AppStrings.login,
                                onPressed: () {
                                  Navigator.pop(context);
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(top: 1.h, child: const CommonBackButton()),
                ],
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
      ),
    );
  }
}
