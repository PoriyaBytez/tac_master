import 'package:flutter/material.dart';
import 'package:tac/helpers/app_colors.dart';
import 'package:tac/helpers/app_images.dart';
import 'package:tac/helpers/app_strings.dart';
import 'package:tac/helpers/app_textstyle.dart';
import 'package:tac/widgets/common_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/widgets/sized_box.dart';

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
            body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Image.asset(
                AppImages.home,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.yourCompValue,
                    style: AppTextStyle.extraBold24(AppColors.primaryColor,
                        type: AppTextStyleType.montserrat),
                  ),
                  hBox(3.h),
                  Text(
                    AppStrings.searchForComps,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.regular14(
                      AppColors.blueAccent,
                      type: AppTextStyleType.ptSerif,
                    ),
                  ),
                  hBox(8.5.h),
                  CommonFilledButton(
                      text: AppStrings.login,
                      onPressed: () {
                        print('Login button pressed');
                      }),
                  hBox(2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.doNotHaveAnAccount,
                        style: AppTextStyle.regular14(
                          AppColors.blueAccent,
                        ),
                      ),
                      wBox(0.4.h),
                      CommonTextButton(
                          text: AppStrings.signUp, onPressed: () {})
                    ],
                  ),
                  hBox(11.h),
                  Text(
                    AppStrings.allRightsReserved,
                    style: AppTextStyle.regular10(AppColors.blueAccent),
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
