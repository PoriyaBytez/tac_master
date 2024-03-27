import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tac/Helper/SharePrefs.dart';
import 'package:tac/Helper/firebase_auth_helper.dart';
import 'package:tac/controllers/LoginController.dart';
import 'package:tac/utils/app_colors.dart';
import 'package:tac/utils/app_images.dart';
import 'package:tac/utils/app_strings.dart';
import 'package:tac/screens/auth/login_screen.dart';
import 'package:tac/screens/auth/register_screen.dart';
import 'package:tac/widgets/common_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/widgets/sized_box.dart';
import 'package:get/get.dart';
import '../controllers/RegisterController.dart';
import '../utils/app_textstyle.dart';
import '../widgets/common_home_image.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  RegisterController controller = Get.put(RegisterController());
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: Stack(
              children: [
                Center(
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
                              hBox(0.5.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                          height: 7.h,
                                          decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Image.asset(
                                                AppImages.iconApple),
                                          )),
                                    ),
                                  ),
                                  wBox(2.w),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        FireBaseAuthHelper.fireBaseAuthHelper
                                            .signWithGoogle();
                                      },
                                      child: Container(
                                          height: 7.h,
                                          decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(13),
                                            child: Image.asset(
                                                AppImages.iconGoogle),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
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
            )));
  }
}
