import 'package:tac/utils/app_strings.dart';

class TValidator {
  static String? validateEmptyText(String? value, String? filedName){
    if (value == null || value.isEmpty) {
      return "$filedName is required";
    }
    return null;
  }


  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorTxtEmailEmpty;
    }

    final emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (!emailRegExp.hasMatch(value)) {
      return AppStrings.errorTxtUnValidEmail;
    }

    return null;
  }

  static String? validatePassword(String? value){
    if(value == null || value.isEmpty){
      return AppStrings.errorTxtPassEmpty;
    }

    if(value.length < 8){
      return AppStrings.errorTxtPassLength;
    }
    return null;

  }

  static String? validateConfirmPass(String? value,String? password){
    if(value == null || value.isEmpty){
      return AppStrings.errorTxtConfirmPassEmpty;
    }
    if(value.length < 8){
      return AppStrings.errorTxtPassLength;
    }

    if(value != password){
      return AppStrings.errorTxtConfirmPass;
    }
    return null;


  }
}
