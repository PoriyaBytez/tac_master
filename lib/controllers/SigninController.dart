import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tac/screens/residential/residential_screen.dart';
import 'package:tac/utils/app_strings.dart';
import '../SharePref/SharePrefs.dart';
import '../models/UserModel.dart';
import '../widgets/TSnackBar.dart';

class SigninController extends GetxController {
  /// VARIABLES
  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();

  /// LOGIN
  login() async {
    try {
      isLoading.value = true;
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('users')
          .where('username', isEqualTo: userNameController.text)
          .get();

      final List<DocumentSnapshot> documents = result.docs;
      if (documents.isNotEmpty) {
        final user = documents.first.data() as Map<String, dynamic>;
        if (user['password'] == passWordController.text) {
          isLoading.value = false;
          UserModel currentUser = UserModel(
            id: user['id'],
            username: user['username'],
            email: user['email'],
            password: user['password'],
          );
          SpUtil.putString(SpConstUtil.currentUser, jsonEncode(currentUser.toMap()));
          TSnackBar.snackBar(title: "Login",message: "User Login Successfully");
          Get.offAll(const ResidentialScreen());
          return;
        } else {
          isLoading.value = false;
          Fluttertoast.showToast(
              msg: AppStrings.errorTxtWrongPass,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } else {
        isLoading.value = false;
        Fluttertoast.showToast(
            msg: AppStrings.errorTxtInvalidUser,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      isLoading.value = false;
      log('ERROR LOGIN SCREEN: $e');
    }
  }
}
