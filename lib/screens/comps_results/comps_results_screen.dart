import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/utils/app_images.dart';
import 'package:tac/screens/comps_results/results_card.dart';
import 'package:tac/screens/lodge_camp/lodge_camp_screen.dart';
import 'package:tac/utils/app_colors.dart';
import 'package:tac/utils/app_strings.dart';
import '../../utils/app_textstyle.dart';
import '../../widgets/sized_box.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CompsResultScreen extends StatefulWidget {
  const CompsResultScreen({super.key});

  @override
  State<CompsResultScreen> createState() => _CompsResultScreenState();
}

class _CompsResultScreenState extends State<CompsResultScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          leading: const SizedBox(),
          backgroundColor: AppColors.whiteColor,
          title: Text(AppStrings.compsResults,
              style: AppTextStyle.extraBold24(AppColors.primaryColor,
                  type: AppTextStyleType.montserrat)),
          centerTitle: true,
          elevation: 0,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  hBox(0.5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            // width: 30.h,
                            height: 4.87.h,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: AppColors.whiteAccent,
                                  ),
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 0),
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(AppImages.iconFilter),
                                ),
                                labelText: AppStrings.forSale,
                                labelStyle: AppTextStyle.regular12(
                                  AppColors.blackColor,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: AppColors.blueSmoke,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        wBox(1.h),
                        SizedBox(
                          width: 10.5.h,
                          height: 4.87.h,
                          child: FilledButton(
                              onPressed: () {
                                Get.to(() => const LodgeCampScreen());
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(horizontal: 1.h)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.primaryColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        side: const BorderSide(
                                            color: AppColors.whiteColor))),
                              ),
                              child: Center(
                                child: Text(
                                  AppStrings.saveFilter,
                                  style: AppTextStyle.regular10(
                                    AppColors.whiteColor,
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  hBox(1.2.h),
                  ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ResultsCard();
                      })
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  width: 100.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.whiteColor.withOpacity(0.1),
                        AppColors.whiteColor.withOpacity(0.5),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
