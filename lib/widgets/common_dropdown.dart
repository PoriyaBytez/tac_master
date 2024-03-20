// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:tac/utils/app_colors.dart';
// import '../screens/appraisal_services/appraisal_services.dart';
//
// Widget commonDropdown({
//   required List<String> dropDownList,
//   required void Function(String?)? onChanged,
//   required String hintText,
//   required String? value,
// }) {
//   return GetBuilder<DropdownController>(builder: (controller) {
//     return Container(
//       alignment: Alignment.centerLeft,
//       height: 7.h,
//       padding: EdgeInsets.symmetric(horizontal: 2.w),
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColors.whiteAccent),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       width: double.infinity,
//       child: DropdownButton<String>(
//         hint: Text(
//           hintText,
//           style: const TextStyle(
//             color: AppColors.grey,
//           ),
//         ),
//         value: value,
//         isExpanded: true,
//         underline: Container(),
//         onChanged: onChanged,
//         items: [
//           ...dropDownList.map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//         ],
//       ),
//     );
//   });
// }

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/utils/app_colors.dart';

import '../screens/appraisal_services/appraisal_services.dart';
import '../utils/app_textstyle.dart';

class CommonDropdown extends StatelessWidget {
  final DropdownController dropdownController;
  final List<String> dropDownList;
  final String hintText;
  String? value;
  ValueChanged onChanged;

  CommonDropdown(
      {super.key,
      required this.dropdownController,
      required this.hintText,
      this.value,
      required this.dropDownList,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 7.h,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.whiteAccent),
        borderRadius: BorderRadius.circular(5),
      ),
      width: double.infinity,
      child: DropdownButton<String>(
        hint: Text(
          hintText,
          style: AppTextStyle.regular14(
            AppColors.grey,
          ),
        ),
        value: value,
        isExpanded: true,
        underline: Container(),
        onChanged: onChanged,
        items: [
          ...dropDownList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: AppTextStyle.regular14(
                  AppColors.blackColor,
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
