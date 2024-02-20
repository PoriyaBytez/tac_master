import 'package:flutter/material.dart';
import 'package:tac/helpers/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../helpers/app_textstyle.dart';

enum ButtonType { filledButton, outlineButton, textButton }

abstract class CommonButtonBase extends StatelessWidget {
  void Function()? onPressed;
  final String text;
  final bool isLoading;
  final bool isEnabled;

  CommonButtonBase(
      {required this.text,
      this.isLoading = false,
      this.isEnabled = true,
      this.buttonType,
      this.onPressed,
      super.key});

  ButtonType? buttonType = ButtonType.filledButton;
  late final ButtonStyle? buttonStyle = getButtonStyle();
  late final TextStyle? calculateButtonTextStyle = getButtonTextStyle();

  Widget buildButtonContent(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.whiteColor,
            ),
          )
        : Text(
            text,
            style: calculateButtonTextStyle,
          );
  }

  TextStyle? getButtonTextStyle() {
    if (buttonType == ButtonType.filledButton) {
      return AppTextStyle.bold18(AppColors.whiteColor,
          type: AppTextStyleType.ptSerif);
    } else if (buttonType == ButtonType.textButton) {
      return AppTextStyle.bold14(
        AppColors.primaryColor,
      );
    } else if (buttonType == ButtonType.outlineButton) {
      return AppTextStyle.bold18(
        AppColors.primaryColor,
        type: AppTextStyleType.ptSerif,
      );
    }
    return null;
  }

  ButtonStyle? getButtonStyle() {
    if (buttonType == ButtonType.filledButton) {
      return ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              getButtonShape()),
          backgroundColor:
              MaterialStateColor.resolveWith((Set<MaterialState> states) {
            return AppColors.primaryColor;
          }));
    } else if (buttonType == ButtonType.textButton) {
      return TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size(50, 25),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.center);
    } else if (buttonType == ButtonType.outlineButton) {
      return ButtonStyle(
        shape:
            MaterialStateProperty.all<RoundedRectangleBorder>(getButtonShape()),
        textStyle:
            MaterialStateProperty.all<TextStyle>(calculateButtonTextStyle!),
      );
    }
    return null;
  }

  RoundedRectangleBorder getButtonShape() {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.whiteColor));
  }
}

class CommonFilledButton extends CommonButtonBase {
  CommonFilledButton({
    super.key,
    required String text,
    required Function()? onPressed,
    ButtonType buttonType = ButtonType.filledButton,
  }) : super(
          text: text,
          buttonType: buttonType,
          onPressed: onPressed,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 7.h,
      child: FilledButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: buildButtonContent(context),
      ),
    );
  }
}

class CommonTextButton extends CommonButtonBase {
  CommonTextButton({
    super.key,
    required String text,
    required Function()? onPressed,
    ButtonType buttonType = ButtonType.textButton,
  }) : super(
          text: text,
          buttonType: buttonType,
          onPressed: onPressed,
        );

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: buildButtonContent(context),
    );
  }
}

class CommonOutlinedButton extends CommonButtonBase {
  CommonOutlinedButton({
    super.key,
    required String text,
    required Function()? onPressed,
    ButtonType buttonType = ButtonType.outlineButton,
  }) : super(
          text: text,
          buttonType: buttonType,
          onPressed: onPressed,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      width: MediaQuery.of(context).size.width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: buildButtonContent(context),
      ),
    );
  }
}
