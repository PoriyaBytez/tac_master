import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/utils/app_colors.dart';
import 'package:tac/utils/app_strings.dart';
import '../../utils/app_textstyle.dart';
import 'package:tac/screens/residential/residential_screen.dart';
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
  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
                      textAlign: TextAlign.center,
                      AppStrings.createNewAccount,
                      style: AppTextStyle.extraBold24(AppColors.primaryColor,
                          type: AppTextStyleType.montserrat),
                    ),
                    hBox(6.5.h),
                    CommonTextField(
                      controller: userNameController,
                      labelText: AppStrings.userName,
                    ),
                    hBox(2.h),
                    CommonTextField(
                      controller: emailController,
                      labelText: AppStrings.email,
                    ),
                    hBox(2.h),
                    CommonTextField(
                      controller: passWordController,
                      labelText: AppStrings.password,
                      obscureText: true,
                    ),
                    hBox(2.h),
                    CommonTextField(
                      controller: confirmPasswordController,
                      labelText: AppStrings.confirmPassword,
                      obscureText: true,
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
                              style: AppTextStyle.regular14(AppColors.blueSmoke,
                                  type: AppTextStyleType.ptSerif)),
                          TextSpan(
                              text: AppStrings.and,
                              style: AppTextStyle.regular14(AppColors.grey,
                                  type: AppTextStyleType.ptSerif)),
                          TextSpan(
                              text: AppStrings.privacyPolicy,
                              style: AppTextStyle.regular14(AppColors.blueSmoke,
                                  type: AppTextStyleType.ptSerif)),
                        ])),
                    hBox(4.90.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.6.h),
                      child: CommonFilledButton(
                        text: AppStrings.signUp,
                        onPressed: () {
                          Get.to(() => ResidentialScreen());
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
        ),
      ),
    );
  }
}
