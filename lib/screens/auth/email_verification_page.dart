import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/screens/residential/residential_screen.dart';
import 'package:tac/utils/app_colors.dart';
import 'package:tac/utils/app_textstyle.dart';
import '../../Helper/SharePrefs.dart';
import '../../Helper/cloud_firestore_helper.dart';
import '../../Helper/firebase_auth_helper.dart';
import '../../widgets/common_home_image.dart';
import '../../widgets/sized_box.dart';

// ignore: must_be_immutable
class EmailVerificationPage extends StatefulWidget {
  String id;
  String name;
  String email;
  String password;



  EmailVerificationPage({
    super.key,
    required this.name,
    required this.email,
    required this.password,

    required this.id,
  });

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  Future<void> checkEmail() async {
    await CloudFirestoreHelper.cloudFirestoreHelper.insertUserDetail(
      email: widget.email,
      password: widget.password,
      name: widget.name,
      id: widget.id,
    );
    bool emailVerified =
    await FireBaseAuthHelper.fireBaseAuthHelper.isEmailVerified();
    if (emailVerified) {
      SpUtil.putString(
          SpConstUtil.currentUser,
          jsonEncode(
              CloudFirestoreHelper.cloudFirestoreHelper.userModel.toMap()));
      Get.offAll(const ResidentialScreen());
    }
  }

  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (_) async {
      await FireBaseAuthHelper.fireBaseAuthHelper.isEmailVerified();
      checkEmail();
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hBox(4.h),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.h),
                  child: commonHomeImage()),
              hBox(4.h),
              Text("Verify your email",style: AppTextStyle.medium18(AppColors.primaryColor),),
               SizedBox(height: 2.h),
               Text(
                "Check your email, We sent you a link in your email",style: AppTextStyle.medium12(AppColors.grey),
              ),
              SizedBox(height:4.h),
              const CircularProgressIndicator(color: AppColors.primaryColor,),
            ],
          ),
        ),
      ),
    );
  }
}
