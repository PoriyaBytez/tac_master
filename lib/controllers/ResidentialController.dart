import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/Helper/firebase_auth_helper.dart';
import 'package:tac/utils/app_colors.dart';
import 'package:tac/utils/app_textstyle.dart';
import 'package:tac/widgets/sized_box.dart';
import '../Helper/SharePrefs.dart';
import '../models/UserModel.dart';
import '../utils/app_strings.dart';
import '../widgets/common_button.dart';

class ResidentialController extends GetxController {
  /// VARIABLES
  TextEditingController bedroomController = TextEditingController();
  TextEditingController bathroomController = TextEditingController();
  TextEditingController lotSizeController = TextEditingController();
  TextEditingController livingAreaController = TextEditingController();
  TextEditingController propertyController = TextEditingController();
  TextEditingController poolController = TextEditingController();
  TextEditingController attachedDetachedController = TextEditingController();
  UserModel userModel = UserModel();

  /// GET CURRENT USER
  getCurrentUser() {
    String? userDataString = SpUtil.getString(SpConstUtil.currentUser);
    if (userDataString != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userDataString);
      userModel = UserModel.fromMap(userDataMap);
      log("CURRENT USER -- ${userModel.email}");
    }
  }

  /// ON INIT
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }

  Future pickerShowBottomSheet(context) {
    propertyController.text = 'Option 1';
    poolController.text = 'Option 1';
    attachedDetachedController.text = 'Option 1';
    List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200.0,
          child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(options[index]),
                onTap: () {
                  propertyController.text = options[index];
                  poolController.text = options[index];
                  attachedDetachedController.text = options[index];
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }

  dialog() {
    Get.defaultDialog(
        title: AppStrings.lblConfirmLogout,
        backgroundColor: AppColors.whiteColor,
        titleStyle: AppTextStyle.bold20(AppColors.blueSmoke),
        buttonColor: AppColors.primaryColor,
        barrierDismissible: false,
        contentPadding: EdgeInsets.zero,
        radius: 12,
        content: SizedBox(
          width: 320,
          child: Column(
            children: [
              const Divider(
                color: AppColors.grey,
              ),
              hBox(1.h),
              Text(
                AppStrings.txtLogout,
                style: AppTextStyle.medium16(AppColors.grey),
              ),
              hBox(2.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 5.5.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColors.primaryColor, width: 1.8)),
                            child: Center(
                              child: Text(
                                AppStrings.btnTxtCancel,
                                style: AppTextStyle.bold14(AppColors.blueSmoke),
                              ),
                            ),
                          ),
                        )),
                    wBox(2.w),
                    Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            FireBaseAuthHelper.fireBaseAuthHelper.signOut();
                          },
                          child: Container(
                              height: 5.5.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.primaryColor),
                              child: Center(
                                child: Text(
                                  AppStrings.btnTxtConfirm,
                                  style: AppTextStyle.bold14(AppColors.whiteColor),
                                ),
                              )),
                        )),
                  ],
                ),
              )
            ],
          ),
        )
      );
  }
}
