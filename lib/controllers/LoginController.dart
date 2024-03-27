import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tac/screens/residential/residential_screen.dart';
import 'package:tac/utils/app_strings.dart';
import '../Helper/SharePrefs.dart';
import '../models/UserModel.dart';
import '../widgets/TSnackBar.dart';

class LoginController extends GetxController {
  /// VARIABLES
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
}
