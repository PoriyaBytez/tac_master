import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/widgets/common_textfield.dart';
import 'package:tac/widgets/sized_box.dart';
import '../../helpers/app_colors.dart';
import '../../helpers/app_images.dart';
import '../../helpers/app_strings.dart';
import '../../helpers/app_textstyle.dart';
import 'package:flutter_svg/svg.dart';

class AppraisalServices extends StatefulWidget {
  const AppraisalServices({super.key});

  @override
  State<AppraisalServices> createState() => _AppraisalServicesState();
}

class _AppraisalServicesState extends State<AppraisalServices> {
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController propertyTypeController = TextEditingController();
  TextEditingController glaController = TextEditingController();
  TextEditingController bedRoomsController = TextEditingController();
  TextEditingController bathRoomsController = TextEditingController();
  TextEditingController yearBuiltController = TextEditingController();
  TextEditingController specialFeatureController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var commonHeight = hBox(1.5.h);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          leading: const SizedBox(),
          backgroundColor: AppColors.whiteColor,
          title: SizedBox(
            width: 30.h,
            child: Column(
              children: [
                Text(AppStrings.appraisalServices,
                    style: AppTextStyle.extraBold24(AppColors.primaryColor,
                        type: AppTextStyleType.montserrat)),
                Text(AppStrings.getQuota,
                    textAlign: TextAlign.justify,
                    style: AppTextStyle.bold10(AppColors.primaryColor,
                        type: AppTextStyleType.ptSerif)),
              ],
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: Column(
            children: [
              hBox(3.25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonTextField(
                    width: 20.h,
                    controller: TextEditingController(),
                    labelText: AppStrings.city,
                  ),
                  CommonTextField(
                    width: 20.h,
                    controller: TextEditingController(),
                    labelText: AppStrings.state,
                  ),
                ],
              ),
              commonHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonTextField(
                    width: 20.h,
                    controller: TextEditingController(),
                    labelText: AppStrings.street,
                  ),
                  CommonTextField(
                    width: 20.h,
                    controller: TextEditingController(),
                    labelText: AppStrings.zipCode,
                  ),
                ],
              ),
              commonHeight,
              CommonTextField(
                onTap: () async {},
                readOnly: true,
                controller: TextEditingController(),
                labelText: AppStrings.grossLivingArea,
                keyboardType: TextInputType.number,
                suffixIcon: IconButton(
                  onPressed: () async {},
                  icon: Icon(Icons.arrow_drop_down),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
