import 'package:flutter/material.dart';
import 'package:tac/controllers/app_controller.dart';
import 'package:tac/utils/app_colors.dart';
import 'package:tac/utils/app_strings.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/widgets/sized_box.dart';
import 'package:get/get.dart';

import '../../utils/app_textstyle.dart';
import '../../widgets/common_textfield.dart';

AppController appController = Get.put(AppController());

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, required this.index});

  final int index;

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      appController.tabBarIndex.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 7.25.h,
          decoration: BoxDecoration(
            color: AppColors.white2,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTabBarItem(
                text: AppStrings.highlights,
                isSelected: appController.tabBarIndex.value == 0,
                onTap: () => _onTabSelected(0),
              ),
              CustomTabBarItem(
                text: AppStrings.details,
                isSelected: appController.tabBarIndex.value == 1,
                onTap: () => _onTabSelected(1),
              ),
              CustomTabBarItem(
                text: AppStrings.adjustment,
                isSelected: appController.tabBarIndex.value == 2,
                onTap: () => _onTabSelected(2),
              ),
            ],
          ),
        ));
  }
}

class CustomTabBarItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomTabBarItem({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blueColor : AppColors.white2,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text,
          style: AppTextStyle.regular14(
            isSelected ? AppColors.whiteColor : AppColors.grey2,
            type: AppTextStyleType.inter,
          ),
        ),
      ),
    );
  }
}

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IndexedStack(
        index: appController.tabBarIndex.value,
        children: [
          Container(height: 100, color: Colors.red), // Content for Highlights
          detailsWidget(), // Content for Details
          adjustmentWidget(), // Content for Adjustment
        ],
      ),
    );
  }
}

Widget detailsWidget() {
  return Column(
    children: [
      Expanded(
          child: Column(
        children: [
          propertyDetails(
              title: AppStrings.address, value: "149 Cates Lane, Pigeon Forge"),
          propertyDetails(title: AppStrings.status, value: "Active"),
          propertyDetails(title: AppStrings.ml, value: "TR94739524"),
          propertyDetails(title: AppStrings.apn, value: "24736752894"),
          propertyDetails(title: AppStrings.listPrice, value: "945,890"),
          propertyDetails(title: AppStrings.pricePerSqft, value: "735"),
          propertyDetails(title: AppStrings.country, value: "San Bernardino"),
          propertyDetails(title: AppStrings.propertyTypee, value: "Condo"),
          propertyDetails(title: AppStrings.bedrooms, value: "4"),
          propertyDetails(title: AppStrings.bathrooms, value: "3"),
          propertyDetails(title: AppStrings.sqft, value: "1,0023 Sqft"),
          propertyDetails(title: AppStrings.ac, value: "Yes"),
          propertyDetails(title: AppStrings.view, value: "Yes"),
          propertyDetails(title: AppStrings.pool, value: "1"),
          propertyDetails(
              title: AppStrings.area, value: "765 - Rancho Cucamonga"),
          propertyDetails(title: AppStrings.yearBuilt, value: "2010"),
          propertyDetails(title: AppStrings.saleType, value: "Standard"),
        ],
      )),
    ],
  );
}

Widget propertyDetails({required String title, required String value}) {
  return Column(
    children: [
      Row(
        children: [
          SizedBox(
            width: 16.h,
            child: Text(
              title,
              style: AppTextStyle.regular14(AppColors.grey2,
                  type: AppTextStyleType.inter),
            ),
          ),
          SizedBox(
            width: 25.h,
            child: Text(
              value,
              style: AppTextStyle.semiBold14(AppColors.blackColor,
                  type: AppTextStyleType.inter),
            ),
          ),
        ],
      ),
      hBox(1.h),
    ],
  );
}

Widget adjustmentWidget() {
  return Column(
    children: [
      Expanded(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.actualSubject,
                style: AppTextStyle.regular14(AppColors.grey2,
                    type: AppTextStyleType.inter),
              ),
              Text(
                AppStrings.comparableProperties,
                style: AppTextStyle.regular14(AppColors.grey2,
                    type: AppTextStyleType.inter),
              ),
            ],
          ),
          hBox(3.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 18.h,
                child: Text(
                  AppStrings.lodgeAtCamp,
                  style: AppTextStyle.semiBold14(AppColors.blackColor,
                      type: AppTextStyleType.inter),
                ),
              ),
              Expanded(
                child: Text(
                  textAlign: TextAlign.end,
                  "The Lodge at EPWORTH LANE",
                  style: AppTextStyle.semiBold14(AppColors.blackColor,
                      type: AppTextStyleType.inter),
                ),
              ),
            ],
          ),
          hBox(2.25.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.adjustValue,
                style: AppTextStyle.regular14(AppColors.grey2,
                    type: AppTextStyleType.inter),
              ),
              Text(
                AppStrings.adjustValue,
                style: AppTextStyle.regular14(AppColors.grey2,
                    type: AppTextStyleType.inter),
              ),
            ],
          ),
          hBox(1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$758,930",
                style: AppTextStyle.semiBold14(AppColors.blackColor,
                    type: AppTextStyleType.inter),
              ),
              Text(
                "\$674,583",
                style: AppTextStyle.semiBold14(AppColors.blackColor,
                    type: AppTextStyleType.inter),
              ),
            ],
          ),
          hBox(2.25.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.pricePerSqft,
                style: AppTextStyle.regular14(AppColors.grey2,
                    type: AppTextStyleType.inter),
              ),
              Text(
                AppStrings.pricePerSqft,
                style: AppTextStyle.regular14(AppColors.grey2,
                    type: AppTextStyleType.inter),
              ),
            ],
          ),
          hBox(1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$457",
                style: AppTextStyle.semiBold14(AppColors.blackColor,
                    type: AppTextStyleType.inter),
              ),
              Text(
                "\$345",
                style: AppTextStyle.semiBold14(AppColors.blackColor,
                    type: AppTextStyleType.inter),
              ),
            ],
          ),
        ],
      )),
    ],
  );
}
// Example Usage
