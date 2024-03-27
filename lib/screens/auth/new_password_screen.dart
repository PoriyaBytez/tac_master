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

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
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
                          AppStrings.lblNewPassword,
                          style: AppTextStyle.extraBold24(AppColors.blueSmoke,
                              type: AppTextStyleType.montserrat),
                        ),
                        hBox(3.2.h),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              CommonTextField(
                                controller: newPasswordController,
                                labelText: AppStrings.txtNewPass,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return AppStrings.errorTxtPassEmpty;
                                  }
                                  return null;
                                },
                              ),
                              hBox(2.h),
                              CommonTextField(
                                controller: confirmPassController,
                                labelText: AppStrings.confirmPassword,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return AppStrings.errorTxtUsernameEmpty;
                                  } else if (value !=
                                      newPasswordController.text) {
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
                            text: AppStrings.btnTxtResetPass,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {}
                            },
                          ),
                        ),
                      ],
                    ),
                    // Positioned(top: 1.h, child: const CommonBackButton()),
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
