import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tac/screens/earn_extra_income_page/earn_extra_income_page.dart';
import 'package:tac/screens/request_page/request_page.dart';
import 'package:tac/utils/app_colors.dart';
import 'package:tac/screens/appraisal_services/appraisal_services.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.whiteColor,
      systemNavigationBarColor: AppColors.whiteColor,
      statusBarIconBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        title: 'TAC',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            scrolledUnderElevation: 0,
            elevation: 0,
          ),
          datePickerTheme: const DatePickerThemeData(
            backgroundColor: AppColors.whiteColor,
            // dayBackgroundColor: MaterialStatePropertyAll<Color>(
            //   AppColors.primaryColor.withOpacity(0.3),
            // ),
            // rangePickerBackgroundColor: AppColors.whiteColor,
          ),
        ),
        home: const EarnExtraIncomePage(),
      );
    });
  }
}
