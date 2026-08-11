import 'package:bookia/bookia_app.dart';
import 'package:bookia/core/helper/app_constant.dart';
import 'package:bookia/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString(AppConstant.userTokenKey);
  EasyLocalization(
    supportedLocales: [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    fallbackLocale: Locale('en'),

    child: BlocProvider(
      create: (_) => ThemeCubit(),
      child: BookiaApp(token: token),
    ),
  );
}
