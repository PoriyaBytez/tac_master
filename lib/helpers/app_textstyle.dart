import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppTextStyleType {
  montserrat,
  ptSerif,
  inter,
}

class AppTextStyle {
  static final Map<AppTextStyleType, Function> _fontStyles = {
    AppTextStyleType.ptSerif: GoogleFonts.ptSerif,
    AppTextStyleType.montserrat: GoogleFonts.montserrat,
    AppTextStyleType.inter: GoogleFonts.inter,
  };

  static TextStyle _regular(double size, Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _fontStyles[type]!(
      fontWeight: FontWeight.w400,
      fontSize: size,
      color: color,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle _medium(double size, Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _fontStyles[type]!(
      fontWeight: FontWeight.w500,
      fontSize: size,
      color: color,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle _semiBold(double size, Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _fontStyles[type]!(
      fontWeight: FontWeight.w600,
      fontSize: size,
      color: color,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle _bold(double size, Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _fontStyles[type]!(
      fontWeight: FontWeight.w700,
      fontSize: size,
      color: color,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle _extraBold(double size, Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _fontStyles[type]!(
      fontWeight: FontWeight.w800,
      fontSize: size,
      color: color,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle bold10(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(10, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold11(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(11, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold12(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(12, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold13(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(13, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold14(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(14, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold15(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(15, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold16(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(16, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold17(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(17, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold18(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(18, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold19(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(19, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold20(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(20, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold21(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(21, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold22(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(22, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold23(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(23, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold24(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(24, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold25(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(25, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold26(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(26, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold27(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(27, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold28(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(28, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold29(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(29, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold30(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(30, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold31(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(31, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle bold32(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _bold(32, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold10(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(10, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold11(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(11, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold12(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(12, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold13(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(13, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold14(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(14, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold15(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(15, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold16(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(16, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold17(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(17, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold18(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(18, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold19(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(19, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold20(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(20, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold21(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(21, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold22(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(22, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold23(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(23, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold24(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(24, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold25(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(25, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold26(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(26, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold27(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(27, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold28(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(28, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold29(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(29, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold30(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(30, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold31(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(31, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle semiBold32(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _semiBold(32, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular10(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(10, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular11(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(11, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular12(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(12, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular13(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(13, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular14(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(14, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular15(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(15, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular16(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(16, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular17(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(17, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular18(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(18, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular19(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(19, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular20(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(20, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular21(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(21, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular22(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(22, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular23(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(23, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular24(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(24, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular25(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(25, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular26(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(26, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular27(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(27, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular28(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(28, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular29(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(29, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular30(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(30, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular31(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(31, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle regular32(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _regular(32, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium10(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(10, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium11(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(11, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium12(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(12, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium13(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(13, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium14(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(14, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium15(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(15, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium16(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(16, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium17(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(17, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium18(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(18, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium19(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(19, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium20(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(20, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium21(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(21, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium22(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(22, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium23(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(23, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium24(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(24, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium25(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(25, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium26(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(26, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium27(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(27, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium28(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(28, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium29(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(29, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium30(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(30, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium31(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(31, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle medium32(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _medium(32, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold14(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(14, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold15(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(15, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold16(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(16, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold17(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(17, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold18(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(18, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold19(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(19, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold20(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(20, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold21(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(21, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold22(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(22, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold23(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(23, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold24(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(24, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold25(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(25, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold26(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(26, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold27(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(27, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold28(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(28, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold29(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(29, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold30(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(30, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold31(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(31, color, isUnderline: isUnderline, type: type);
  }

  static TextStyle extraBold32(Color color,
      {bool isUnderline = false,
      AppTextStyleType type = AppTextStyleType.inter}) {
    return _extraBold(32, color, isUnderline: isUnderline, type: type);
  }
}
