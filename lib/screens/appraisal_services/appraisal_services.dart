import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:tac/utils/app_images.dart';
import 'package:tac/widgets/common_button.dart';
import 'package:tac/widgets/common_date_picker.dart';
import 'package:tac/widgets/common_textfield.dart';
import 'package:tac/widgets/sized_box.dart';
import 'package:tac/utils/app_colors.dart';
import 'package:tac/utils/app_strings.dart';
import '../../utils/app_textstyle.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/common_dropdown.dart';

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
  TextEditingController selectPurposeOfAppraisalController =
      TextEditingController();
  TextEditingController appraisalEffectiveDateController =
      TextEditingController();
  TextEditingController appraiserQualificationsController =
      TextEditingController();
  TextEditingController propertyValueController = TextEditingController();
  TextEditingController appraisalFeeController = TextEditingController();

  TextEditingController contactNameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController contactEmailController = TextEditingController();

  final DropdownController dropdownController = Get.put(DropdownController());

  List<String> propertyTypeList = [
    'Single Family',
    'Condo',
    'Townhouse',
    'Multi Family',
    'Mobile Home',
    'Land',
    'Commercial',
    'Other',
  ];
  List<String> bedRoomsList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];

  List<String> bathRoomsList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];
  List<String> specialFeatureList = [
    'Pool',
    'Fireplace',
    'Garage',
    'Basement',
    'Waterfront',
    'Golf Course',
    'Horse Property',
    'RV Parking',
    'Guest House',
    'New Construction',
  ];

  List<String> paymentOptionsList = [
    'Credit Card',
    'Debit Card',
    'Net Banking',
    'UPI',
    'Wallet',
  ];

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                hBox(3.25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonTextField(
                      width: 20.h,
                      controller: cityController,
                      labelText: AppStrings.city,
                      hintText: AppStrings.enterCity,
                    ),
                    CommonTextField(
                      width: 20.h,
                      controller: stateController,
                      labelText: AppStrings.state,
                      hintText: AppStrings.enterState,
                    ),
                  ],
                ),
                commonHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonTextField(
                        width: 20.h,
                        controller: streetController,
                        labelText: AppStrings.street,
                        hintText: AppStrings.enterStreet),
                    CommonTextField(
                      width: 20.h,
                      controller: zipController,
                      labelText: AppStrings.zipCode,
                      hintText: AppStrings.enterZip,
                    ),
                  ],
                ),
                commonHeight,
                GetBuilder<DropdownController>(
                  builder: (dropdownController) {
                    return CommonDropdown(
                      dropdownController: dropdownController,
                      dropDownList: propertyTypeList,
                      hintText: AppStrings.selectPropertyType,
                      value: dropdownController.selectPropertyType,
                      onChanged: (value) {
                        dropdownController.selectPropertyType = value!;
                        dropdownController.update();
                      },
                    );
                  },
                ),
                commonHeight,
                CommonTextField(
                  controller: glaController,
                  hintText: AppStrings.enterPropertyGla,
                  labelText: AppStrings.propertyGla,
                ),
                commonHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GetBuilder<DropdownController>(
                        builder: (dropdownController) {
                          return CommonDropdown(
                            dropdownController: dropdownController,
                            dropDownList: bedRoomsList,
                            hintText: AppStrings.selectBedRooms,
                            value: dropdownController.selectBedRooms,
                            onChanged: (value) {
                              dropdownController.selectBedRooms = value!;
                              dropdownController.update();
                            },
                          );
                        },
                      ),
                    ),
                    wBox(2.w),
                    Expanded(
                      child: GetBuilder<DropdownController>(
                        builder: (dropdownController) {
                          return CommonDropdown(
                            dropdownController: dropdownController,
                            dropDownList: bathRoomsList,
                            hintText: AppStrings.selectBathRooms,
                            value: dropdownController.selectBathRooms,
                            onChanged: (value) {
                              dropdownController.selectBathRooms = value!;
                              dropdownController.update();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                commonHeight,
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        onTap: () {
                          commonDatePicker(context);
                        },
                        readOnly: true,
                        controller: yearBuiltController,
                        decoration: InputDecoration(
                          hintText: AppStrings.selectYearBuilt,
                          hintStyle: AppTextStyle.regular14(
                            AppColors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.whiteAccent),
                            borderRadius: BorderRadius.circular(0.5.h),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.whiteAccent),
                            borderRadius: BorderRadius.circular(0.5.h),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.whiteAccent),
                            borderRadius: BorderRadius.circular(0.5.h),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              height: 2.5.h,
                              width: 2.5.w,
                              AppImages.iconCalender,
                            ),
                          ),
                        ),
                      ),
                    ),
                    wBox(2.w),
                    Expanded(
                      child: GetBuilder<DropdownController>(
                        builder: (dropdownController) {
                          return CommonDropdown(
                            dropdownController: dropdownController,
                            dropDownList: specialFeatureList,
                            hintText: AppStrings.selectFeature,
                            value: dropdownController.selectFeature,
                            onChanged: (value) {
                              dropdownController.selectFeature = value!;
                              dropdownController.update();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                commonHeight,
                CommonTextField(
                  controller: selectPurposeOfAppraisalController,
                  labelText: AppStrings.selectPurposeOfAppraisal,
                  hintText: AppStrings.enterEnterAppraisal,
                ),
                commonHeight,
                CommonTextField(
                  controller: appraisalEffectiveDateController,
                  labelText: AppStrings.selectAppraisalEffectiveDate,
                  readOnly: true,
                  onTap: () {
                    commonDatePicker(context);
                  },
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      height: 2.5.h,
                      width: 2.5.w,
                      AppImages.iconCalender,
                    ),
                  ),
                ),
                commonHeight,
                CommonTextField(
                  controller: appraiserQualificationsController,
                  labelText: AppStrings.selectAppraiserQualifications,
                  hintText: AppStrings.enterEnterYearsExperience,
                ),
                commonHeight,
                CommonTextField(
                  controller: propertyValueController,
                  labelText: AppStrings.selectPropertyValue,
                  hintText: AppStrings.enterEnterEstimatedValue,
                ),
                commonHeight,
                CommonTextField(
                  controller: appraisalFeeController,
                  labelText: AppStrings.selectAppraisalFee,
                  hintText: AppStrings.enterEnterEstimatedVFee,
                ),
                commonHeight,
                GetBuilder<DropdownController>(
                  builder: (dropdownController) {
                    return CommonDropdown(
                      dropdownController: dropdownController,
                      dropDownList: paymentOptionsList,
                      hintText: AppStrings.selectPayment,
                      value: dropdownController.selectPayment,
                      onChanged: (value) {
                        dropdownController.selectPayment = value!;
                        dropdownController.update();
                      },
                    );
                  },
                ),
                commonHeight,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.contactInformation,
                    style: AppTextStyle.semiBold20(
                      AppColors.blackColor,
                      type: AppTextStyleType.inter,
                    ),
                  ),
                ),
                commonHeight,
                CommonTextField(
                  controller: contactNameController,
                  labelText: AppStrings.contactName,
                  hintText: AppStrings.enterEnterName,
                ),
                commonHeight,
                CommonTextField(
                  controller: contactNumberController,
                  labelText: AppStrings.contactPhoneNumber,
                  hintText: AppStrings.enterEnterNumber,
                ),
                commonHeight,
                CommonTextField(
                  controller: contactEmailController,
                  labelText: AppStrings.contactEmailAddress,
                  hintText: AppStrings.enterEnterEmail,
                ),
                commonHeight,
                CommonFilledButton(
                  text: AppStrings.submit,
                  onPressed: () {},
                ),
                commonHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.privacyPolicy,
                      style: AppTextStyle.bold14(
                        AppColors.blueSmoke,
                        type: AppTextStyleType.inter,
                      ),
                    ),
                    wBox(1.h),
                    Container(
                      height: 1.5.h,
                      width: 0.1.h,
                      color: AppColors.blueSmoke,
                    ),
                    wBox(1.h),
                    Text(
                      AppStrings.termsAndCondition,
                      style: AppTextStyle.bold14(
                        AppColors.blueSmoke,
                        type: AppTextStyleType.inter,
                      ),
                    ),
                  ],
                ),
                hBox(3.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DropdownController extends GetxController {
  String? selectPropertyType;
  String? selectBedRooms;
  String? selectBathRooms;
  String? selectYearBuilt;
  String? selectFeature;
  String? selectPayment;
}
