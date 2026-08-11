import 'package:bookia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtom extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final void Function()? onPressed;
  const AppButtom({
    super.key,
    required this.text,
    this.backgroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,

      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22.w),
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: backgroundColor == null
                  ? AppColors.secondaryColor
                  : AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
