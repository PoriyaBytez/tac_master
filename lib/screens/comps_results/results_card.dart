import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tac/helpers/app_colors.dart';
import 'package:tac/helpers/app_images.dart';
import 'package:tac/helpers/app_strings.dart';
import 'package:tac/helpers/app_textstyle.dart';
import 'package:tac/widgets/sized_box.dart';

class ResultsCard extends StatefulWidget {
  const ResultsCard({super.key});

  @override
  State<ResultsCard> createState() => _ResultsCardState();
}

class _ResultsCardState extends State<ResultsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Container(
        // padding: const EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 1.5.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(16, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildImageBox(),
                wBox(2.5.w),
                compsDetails(),
              ],
            ),
            Image.asset(AppImages.map)
          ],
        ),
      ),
    );
  }

  Widget buildImageBox() {
    return Stack(
      children: [
        SizedBox(
          width: 18.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  child: buildImageSubBox(13, 18, AppImages.homeCard)),
              const SizedBox(height: 1),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildImageSubBox(17, 9, AppImages.image2),
                  const SizedBox(width: 1),
                  Column(
                    children: [
                      buildImageSubBox(8.5, 8.8, AppImages.image3),
                      const SizedBox(height: 1),
                      buildImageSubBox(8.4, 8.8, AppImages.image4,
                          isCover: true),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
            top: 0.8.h,
            right: 0.8.h,
            child: CircleAvatar(
                maxRadius: 1.8.h,
                backgroundColor: AppColors.whiteColor,
                child:
                    SvgPicture.asset(AppImages.iconBlackHeart, width: 1.8.h))),
        Positioned(
            top: 0,
            left: 0,
            child: Image.asset(AppImages.statusCard, width: 7.25.h)),
      ],
    );
  }

  Widget buildImageSubBox(double height, double width, String imagePath,
      {bool isCover = false}) {
    return Container(
      height: height.h,
      width: width.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: isCover
              ? ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken)
              : null,
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: isCover
          ? Center(
              child: Text(
                "5+",
                style: AppTextStyle.bold18(AppColors.whiteColor),
              ),
            )
          : null,
    );
  }

  Widget compsDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        hBox(1.h),
        SizedBox(
          width: 40.w,
          child: Text(
            "The Lodge at Camp Margaritaville",
            style: AppTextStyle.bold14(AppColors.blackColor),
          ),
        ),
        hBox(1.2.h),
        SizedBox(
          width: 48.w,
          child: Text(
            textAlign: TextAlign.start,
            "149 Cates Lane, Pigeon Forge, TN 37863,US",
            style: AppTextStyle.regular8(AppColors.blackColor),
          ),
        ),
        hBox(1.2.h),
        Row(
          children: [
            Column(
              children: [
                hotelDetailsCard(
                    title: "Type : Condo", image: AppImages.iconType),
                hBox(1.h),
                hotelDetailsCard(
                    title: "Yr Built: 2010", image: AppImages.iconYearBuilt),
                hBox(1.h),
                hotelDetailsCard(
                    title: "Upgrade: Pool", image: AppImages.iconPool),
                hBox(1.h),
                hotelDetailsCard(
                    title: "Sqr Footage: 4", image: AppImages.iconSqrFootage),
              ],
            ),
            wBox(1.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hotelDetailsCard(title: "4 Beds", image: AppImages.iconBed),
                hBox(1.h),
                hotelDetailsCard(
                    title: "3 Bathrooms", image: AppImages.iconBathroom),
                hBox(1.h),
                hotelDetailsCard(
                    title: "1, 0023 Sqrft", image: AppImages.iconSqrt),
                hBox(1.h),
                hotelDetailsCard(
                    title: "Swimming Pool", image: AppImages.iconSwimmingPool),
              ],
            ),
          ],
        ),
        hBox(1.2.h),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.dayOnMarket,
                  style: AppTextStyle.regular8(AppColors.grey),
                ),
                hBox(0.4.h),
                Text(
                  "12 days before sold",
                  style: AppTextStyle.regular8(AppColors.blackColor),
                ),
              ],
            ),
            wBox(1.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.sourceOfData,
                  style: AppTextStyle.regular8(AppColors.grey),
                ),
                hBox(0.4.h),
                Text(
                  "12 days before sold",
                  style: AppTextStyle.regular8(AppColors.blackColor),
                ),
              ],
            ),
          ],
        ),
        hBox(1.3.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.soldPrice,
                  style: AppTextStyle.regular8(AppColors.grey),
                ),
                wBox(1.h),
                Text(
                  "\$945,890",
                  style: AppTextStyle.bold14(AppColors.primaryColor),
                ),
              ],
            ),
            wBox(1.5.h),
            Container(
              height: 3.h,
              width: 1,
              color: AppColors.blackColor.withOpacity(0.1),
            ),
            wBox(1.5.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.soldDate,
                  style: AppTextStyle.regular8(AppColors.grey),
                ),
                wBox(1.h),
                Text(
                  "4/12/23",
                  style: AppTextStyle.bold14(AppColors.primaryColor),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget hotelDetailsCard({required String title, required String image}) {
    return Row(
      children: [
        SvgPicture.asset(
          image,
        ),
        wBox(0.5.h),
        Text(
          title,
          style: AppTextStyle.regular8(AppColors.blackColor),
        )
      ],
    );
  }
}
