import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tac/screens/appraisal_services/appraisal_services.dart';
import 'package:tac/screens/earn_extra_income/earn_extra_income_screen.dart';
import 'package:tac/screens/home_screen/home_screen.dart';
import 'package:tac/screens/onboarding_screen.dart';
import 'package:tac/screens/request_page/request_page.dart';
import 'package:tac/screens/residential/residential_screen.dart';
import 'package:tac/utils/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'Helper/SharePrefs.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => {log("Firebase Connected --$value")});
  await SpUtil.getInstance();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.whiteColor,
      systemNavigationBarColor: AppColors.whiteColor,
      statusBarIconBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("USER ____>> ${SpUtil.getString(SpConstUtil.currentUser)}");
    print("USER 11 ____>> ${SpUtil.getString("name")}");
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
        home: SpUtil.getString(SpConstUtil.currentUser) == ""
            ? const OnBoardingScreen()
            : const ResidentialScreen(),
      );
    });
  }
}
