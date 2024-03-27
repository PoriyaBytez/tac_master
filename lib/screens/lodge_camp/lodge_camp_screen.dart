import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/controllers/app_controller.dart';
import 'package:tac/utils/app_colors.dart';
import 'package:tac/utils/app_strings.dart';
import 'package:tac/utils/app_textstyle.dart';
import '../../widgets/common_back_button.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_home_image.dart';
import '../../widgets/common_textfield.dart';
import '../../widgets/sized_box.dart';
import '../comps_results/comps_results_screen.dart';
import 'package:get/get.dart';

import 'custom_tabbar.dart';

class LodgeCampScreen extends StatefulWidget {
  const LodgeCampScreen({super.key});

  @override
  State<LodgeCampScreen> createState() => _LodgeCampScreenState();
}

class _LodgeCampScreenState extends State<LodgeCampScreen> {
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
          child: Scaffold(
              body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Obx(
          () => Stack(
            children: [
              Column(
                children: [
                  hBox(1.h),
                  SizedBox(
                    width: 50.w,
                    child: Text(AppStrings.lodgeAtCamp,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.bold16(
                          AppColors.blackColor,
                        )),
                  ),
                  hBox(2.h),
                  Container(
                    height: 7.25.h,
                    decoration: BoxDecoration(
                      color: AppColors.white2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomTabBar(index: appController.tabBarIndex.value),
                  ),
                  hBox(3.75.h),
                  CustomTabBarView(),
                ],
              ),
              Positioned(top: 1.h, child: const CommonBackButton()),
            ],
          ),
        ),
      ))),
    );
  }
}
