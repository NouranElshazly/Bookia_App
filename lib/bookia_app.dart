import 'package:bookia/core/routes/app_router.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class BookiaApp extends StatelessWidget {
  final String? token;
  const BookiaApp({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    debugPrint('DEBUG: BookiaApp.build, token=$token');
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        debugPrint('DEBUG: ScreenUtilInit builder called');
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            debugPrint(
              'DEBUG: BlocBuilder builder called, building MaterialApp',
            );
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: context.read<ThemeCubit>().currentTheme,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              onGenerateRoute: AppRouter.onGenerateRoute,
              initialRoute: token == null
                  ? Routes.welcomeScreen
                  : Routes.welcomeScreen, //change by login
            );
          },
        );
      },
    );
  }
}
