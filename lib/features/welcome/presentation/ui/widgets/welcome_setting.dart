import 'package:bookia/core/theme/app_theme.dart';
import 'package:bookia/core/theme/cubit/theme_cubit.dart';
import 'package:bookia/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeSetting extends StatelessWidget {
  const WelcomeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.w),
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: context.read<ThemeCubit>().currentTheme == AppTheme.lightTheme
            ? Colors.white.withValues(alpha: 0.85)
            : Colors.black.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.h),

          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.darkMode.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Switch.adaptive(
                    value:
                        context.read<ThemeCubit>().currentTheme ==
                        AppTheme.darkTheme,
                    onChanged: (bool value) {
                      context.read<ThemeCubit>().changeTheme();
                    },
                  ),
                ],
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.switchLanguage.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Switch.adaptive(
                value: context.locale.languageCode == 'en',
                onChanged: (bool value) {
                  final newLocale = value ? Locale('en') : Locale('ar');
                  context.setLocale(newLocale);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
