import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: Platform.isWindows ? 'MiSans' : null,
  primaryColor: Colors.white,
  toggleableActiveColor: const Color(0xFF038DFF),
  scaffoldBackgroundColor: const Color(0xFFF4F4F4),
  dividerColor: const Color(0xFFE8E8E8),
  errorColor: const Color(0xFFFF5050),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF333333),
    ),
    headline2: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF333333),
    ),
    headline3: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF333333),
    ),
    headline4: TextStyle(
      fontSize: 20.sp,
      color: const Color(0xFF333333),
      fontWeight: FontWeight.normal,
    ),
    bodyText1: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF333333),
    ),
    bodyText2: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF333333),
    ),
    subtitle1: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF666666),
    ),
    subtitle2: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF999999),
    ),
  ),
);
