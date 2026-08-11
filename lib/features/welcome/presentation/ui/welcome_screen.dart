import 'package:bookia/core/helper/extension.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/widgets/app_buttom.dart';
import 'package:bookia/gen/assets.gen.dart';
import 'package:bookia/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookia/features/welcome/presentation/ui/widgets/welcome_setting.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('DEBUG: WelcomeScreen.build called');
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.onboarding.image().image,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 135.h),
            Assets.images.splashLogo.image(),
            SizedBox(height: 28.h),
            Text(
              LocaleKeys.welcome.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 28.h),
            WelcomeSetting(),
            SizedBox(height: 150.h),
            AppButtom(
              text: LocaleKeys.login.tr(),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const LoginPage()),
                // );
                // Navigator.pushNamed(context, Routes.loginScreen);
                context.pushNamed(Routes.loginScreen);
              },
            ),
            SizedBox(height: 15.h),
            AppButtom(
              text: LocaleKeys.register.tr(),
              backgroundColor: AppColors.secondaryColor,
              onPressed: () {
                // Navigator.pushNamed(context, Routes.registerScreen);
                context.pushNamed(Routes.registerScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
