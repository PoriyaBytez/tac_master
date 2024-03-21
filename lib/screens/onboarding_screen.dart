import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tac/utils/app_colors.dart';
import 'package:tac/utils/app_strings.dart';
import 'package:tac/screens/auth/login_screen.dart';
import 'package:tac/screens/auth/register_screen.dart';
import 'package:tac/widgets/common_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/widgets/sized_box.dart';
import 'package:get/get.dart';
import '../utils/app_textstyle.dart';
import '../widgets/common_home_image.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    hBox(4.h),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.h),
                        child: commonHomeImage()),
                    hBox(5.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.yourCompValue,
                            style: AppTextStyle.extraBold24(
                                AppColors.blueSmoke,
                                type: AppTextStyleType.montserrat),
                          ),
                          hBox(3.h),
                          Text(
                            AppStrings.searchForComps,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.regular14(
                              AppColors.grey,
                              type: AppTextStyleType.ptSerif,
                            ),
                          ),
                          hBox(8.5.h),
                          CommonFilledButton(
                              text: AppStrings.login,
                              onPressed: () {
                                Get.to(() => const LoginScreen());
                                log('Login button pressed');
                              }),
                          hBox(2.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.doNotHaveAnAccount,
                                style: AppTextStyle.regular14(
                                  AppColors.grey,
                                ),
                              ),
                              wBox(0.4.h),
                              CommonTextButton(
                                  text: AppStrings.signUp,
                                  onPressed: () {
                                    Get.to(() => const RegisterScreen());
                                  })
                            ],
                          ),
                          hBox(11.h),
                          Text(
                            AppStrings.allRightsReserved,
                            style: AppTextStyle.regular10(AppColors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
