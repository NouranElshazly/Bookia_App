import 'package:bookia/core/helper/app_dialog.dart';
import 'package:bookia/core/helper/extension.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/widgets/app_buttom.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/custom_form_feild.dart';
import 'package:bookia/features/register/presentation/cubit/cubit/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:bookia/gen/locale_keys.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/gestures.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CustomBackButton()),

      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          // show loading dialog on loading
          if (state is LoginLoading) {
            AppDialog.loadingDialog(context);

            return;
          }

          // اقفل الـ loading dialog لو مفتوح قبل أي حاجة تانية
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }

          if (state is LoginSuccess) {
            context.pushNamedAndRemoveUntil(Routes.homeScreen, false);
          } else if (state is LoginError) {
            AppDialog.errorDialog(context);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(22.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.welcomelogin.tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 32.h),
              CustomFormFeild(
                controller: emailController,
                hintText: LocaleKeys.email.tr(),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.h),
              CustomFormFeild(
                controller: passwordController,
                hintText: LocaleKeys.password.tr(),
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      LocaleKeys.forgetpassword.tr(),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.hintColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              AppButtom(
                text: LocaleKeys.login.tr(),
                onPressed: () {
                  context.read<LoginCubit>().login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
              ),
              SizedBox(height: 285.h),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.titleSmall,
                    children: [
                      TextSpan(text: LocaleKeys.donthaveaccount.tr()),
                      TextSpan(text: " "),
                      TextSpan(
                        text: LocaleKeys.registernow.tr(),
                        style: const TextStyle(color: AppColors.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (_) => const RegisterScreen(),
                            //   ),
                            // );
                            context.pushNamed(Routes.registerScreen);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
