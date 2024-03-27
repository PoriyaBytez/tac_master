import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/Helper/firebase_auth_helper.dart';
import 'package:tac/controllers/LoginController.dart';
import 'package:tac/screens/auth/otp_verification_screen.dart';
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

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                          AppStrings.lblEmailVerification,
                          style: AppTextStyle.extraBold24(AppColors.blueSmoke,
                              type: AppTextStyleType.montserrat),
                        ),
                        hBox(3.2.h),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              CommonTextField(
                                controller: emailController,
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
                            ],
                          ),
                        ),
                        hBox(4.75.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.6.h),
                          child: CommonFilledButton(
                            text: AppStrings.btnTxtResendLink,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                await FireBaseAuthHelper.fireBaseAuthHelper
                                    .resetPassword(
                                  emailController.text,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Positioned(top: 1.h, child: const CommonBackButton()),
                  ],
                ),
              ),
            ),
            // Obx(() => controller.isLoading.value
            //     ? SizedBox(
            //   height: 90.h,
            //   width: double.infinity,
            //   child: const Center(
            //       child: SizedBox(
            //           height: 50,
            //           width: 50,
            //           child: CircularProgressIndicator())),
            // )
            //     : const SizedBox())
          ],
        ),
      ),
    );
  }
}
