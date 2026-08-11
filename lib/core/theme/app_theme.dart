import 'package:bookia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'DM',
    textTheme: TextTheme(
      titleMedium: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
      titleSmall: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w400),
    ),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorLight,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffoldBackgroundColorLight,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white.withValues(alpha: 0.7),
      filled: true,
      hintStyle: TextStyle(color: AppColors.hintColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.borderColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.borderColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'DM',
    textTheme: TextTheme(
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w400),
    ),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffoldBackgroundColorDark,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.black.withValues(alpha: 0.7),
      filled: true,
      hintStyle: TextStyle(color: AppColors.hintColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.borderColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.borderColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
      ),
    ),
  );
}
