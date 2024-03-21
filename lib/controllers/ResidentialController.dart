import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import '../SharePref/SharePrefs.dart';
import '../models/UserModel.dart';

class ResidentialController extends GetxController {

  UserModel userModel = UserModel();

  getCurrentUser() {
    String? userDataString = SpUtil.getString(SpConstUtil.currentUser);
    if (userDataString != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userDataString);
      UserModel user = UserModel.fromMap(userDataMap);
      log("CURRENT USER -- ${user.email}");
    } else {
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }
}
