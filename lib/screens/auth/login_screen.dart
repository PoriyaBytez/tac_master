import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/helpers/app_colors.dart';
import 'package:tac/helpers/app_strings.dart';
import 'package:tac/helpers/app_textstyle.dart';
import 'package:tac/screens/residential/residential_screen.dart';
import 'package:tac/widgets/sized_box.dart';
import '../../helpers/app_images.dart';
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
  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
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
                      style: AppTextStyle.extraBold24(AppColors.primaryColor,
                          type: AppTextStyleType.montserrat),
                    ),
                    hBox(3.2.h),
                    CommonTextField(
                      controller: userNameController,
                      labelText: AppStrings.userName,
                    ),
                    hBox(2.h),
                    CommonTextField(
                      controller: passWordController,
                      labelText: AppStrings.password,
                      obscureText: true,
                    ),
                    hBox(4.75.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.6.h),
                      child: CommonFilledButton(
                        text: AppStrings.login,
                        onPressed: () {
                          Get.to(() => ResidentialScreen());
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
      ),
    );
  }
}
