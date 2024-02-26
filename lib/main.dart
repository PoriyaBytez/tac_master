import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tac/helpers/app_colors.dart';
import 'package:tac/screens/applying_proprietary/applying_proprietary.dart';
import 'package:tac/screens/appraisal_services/appraisal_services.dart';
import 'package:tac/screens/comps_results/comps_results_screen.dart';
import 'package:tac/screens/home_screen/home_screen.dart';
import 'package:tac/screens/onboarding_screen.dart';
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
          datePickerTheme: DatePickerThemeData(
            backgroundColor: AppColors.whiteColor,
            // dayBackgroundColor: MaterialStatePropertyAll<Color>(
            //   AppColors.primaryColor.withOpacity(0.3),
            // ),
            // rangePickerBackgroundColor: AppColors.whiteColor,
          ),
        ),
        home: const AppraisalServices(),
      );
    });
  }
}
