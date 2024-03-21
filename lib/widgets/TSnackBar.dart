import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tac/utils/app_colors.dart';

class TSnackBar {
  static snackBar({required title, message = ""}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: AppColors.primaryColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
    );
  }
}
