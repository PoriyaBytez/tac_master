import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/screens/auth/new_password_screen.dart';
import 'package:tac/utils/app_colors.dart';
import 'package:tac/utils/app_strings.dart';
import '../../utils/app_textstyle.dart';
import 'package:tac/widgets/sized_box.dart';
import '../../widgets/common_back_button.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_home_image.dart';
import '../../widgets/common_textfield.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  final formKey = GlobalKey<FormState>();
  double? height;
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
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
                          AppStrings.lblOtpVerification,
                          style: AppTextStyle.bold20(AppColors.blueSmoke,
                              type: AppTextStyleType.montserrat),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          AppStrings.txtEmailVerification,
                          style: AppTextStyle.medium14(AppColors.grey,
                              type: AppTextStyleType.inter),
                        ),
                        hBox(3.2.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _textFieldOTP(
                                  first: true,
                                  last: false,
                                  controller: controller1),
                              _textFieldOTP(
                                  first: false,
                                  last: false,
                                  controller: controller2),
                              _textFieldOTP(
                                  first: false,
                                  last: false,
                                  controller: controller3),
                              _textFieldOTP(
                                  first: false,
                                  last: true,
                                  controller: controller4),
                            ],
                          ),
                        ),
                        hBox(1.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Resend Code After',
                              style: AppTextStyle.medium14(AppColors.grey),
                            ),
                            wBox(2.w),
                            InkWell(
                              onTap:enableResend ? _resendCode : null,
                              child: Text(
                                !enableResend ?'00:$secondsRemaining':"Resend",
                                style: AppTextStyle.bold14(AppColors.primaryColor),
                              ),
                            )

                          ],
                        ),

                        /*  Form(
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
                        ),*/
                        hBox(4.75.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.6.h),
                          child: CommonFilledButton(
                            text: AppStrings.btnTxtNext,
                            onPressed: () {
                              Get.to(NewPasswordScreen());
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

  Widget _textFieldOTP({bool? first, last, TextEditingController? controller}) {
    return SizedBox(
      height: 7.5.h,
      child: AspectRatio(
        aspectRatio: 0.9,
        child: TextField(
          controller: controller,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: AppColors.grey),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: AppColors.grey),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }

  void _resendCode() {
    print("PRINT");
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  dispose() {
    timer!.cancel();
    super.dispose();
  }
}
