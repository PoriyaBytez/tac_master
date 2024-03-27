import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_textstyle.dart';

class EarnExtraIncome extends StatefulWidget {
  const EarnExtraIncome({super.key});

  @override
  State<EarnExtraIncome> createState() => _EarnExtraIncomeState();
}

class _EarnExtraIncomeState extends State<EarnExtraIncome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: AppColors.whiteColor,
        title: Text(AppStrings.lblTxtEarnExtraIncome,
            style: AppTextStyle.extraBold24(AppColors.blueSmoke,
                type: AppTextStyleType.montserrat)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(children: [
        Text("Subject:",
            style: AppTextStyle.bold12(AppColors.blackColor,
                type: AppTextStyleType.inter)),
        Text("Subject:",
            style: AppTextStyle.bold12(AppColors.blackColor,
                type: AppTextStyleType.inter)),
      ],),
    );
  }
}
