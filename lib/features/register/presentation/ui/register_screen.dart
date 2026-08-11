import 'package:bookia/core/helper/extension.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/widgets/app_buttom.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/custom_form_feild.dart';
// import 'package:bookia/features/login/presentation/ui/login_page.dart';
import 'package:bookia/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CustomBackButton()),

      body: Padding(
        padding: EdgeInsets.all(22.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.registerwelcome.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 13.h),

            CustomFormFeild(
              hintText: LocaleKeys.username.tr(),
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 13.h),

            CustomFormFeild(
              hintText: LocaleKeys.email.tr(),
              keyboardType: TextInputType.emailAddress,
            ),

            SizedBox(height: 13.h),
            CustomFormFeild(
              hintText: LocaleKeys.password.tr(),
              keyboardType: TextInputType.visiblePassword,
              isPassword: true,
            ),
            SizedBox(height: 13.h),

            CustomFormFeild(
              hintText: LocaleKeys.confirmpassword.tr(),
              keyboardType: TextInputType.visiblePassword,
            ),

            SizedBox(height: 30.h),
            AppButtom(text: LocaleKeys.register.tr()),
            SizedBox(height: 184.h),
            Center(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.titleSmall,
                  children: [
                    TextSpan(text: LocaleKeys.haveaccount.tr()),
                    TextSpan(text: " "),
                    TextSpan(
                      text: LocaleKeys.login.tr(),
                      style: const TextStyle(color: AppColors.primaryColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => const LoginPage(),
                          //   ),
                          // );
                          // Navigator.pushNamed(context, Routes.loginScreen);
                          context.pushNamed(Routes.loginScreen);
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
