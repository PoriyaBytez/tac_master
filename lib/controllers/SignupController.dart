import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tac/SharePref/SharePrefs.dart';
import 'package:tac/utils/app_strings.dart';
import 'package:tac/widgets/TSnackBar.dart';
import '../models/UserModel.dart';
import '../screens/residential/residential_screen.dart';

class SignupController extends GetxController {
  /// VARIABLES
  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  RxBool isLoading = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  /// SIGN UP
  signUp() async {
    try {
      isLoading.value = true;
      await auth
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passWordController.text,
      )
          .then((value) async {
        String userID = value.user!.uid;
        await addUser(userID);
        isLoading.value = false;
        TSnackBar.snackBar(title: "Register",message: "User Register Successfully");
        Get.offAll(() => const ResidentialScreen());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        isLoading.value = false;
        print("object---------");
        Fluttertoast.showToast(
            msg: AppStrings.errorTxtWeakPass,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        isLoading.value = false;
        Fluttertoast.showToast(
            msg: AppStrings.errorTxtEmailAlreadyRegister,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        log('The account already exists for that email.');
      }
    } catch (e) {
      isLoading.value = false;
      Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      log(e.toString());
    }
  }

  /// ADD USER FIRESTORE DATABASE
  Future<void> addUser(String userID) async {
    UserModel user = UserModel(
      id: userID,
      username: userNameController.text,
      email: emailController.text,
      password: passWordController.text,
    );
    await db.collection("users").doc(userID).set(user.toMap()).then((value) {
      SpUtil.putString(SpConstUtil.currentUser, jsonEncode(user.toMap()));
    });
  }
}
