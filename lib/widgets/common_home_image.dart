import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/app_images.dart';

Widget commonHomeImage() {
  return Image.asset(
    AppImages.home,
    fit: BoxFit.contain,
  );
}
