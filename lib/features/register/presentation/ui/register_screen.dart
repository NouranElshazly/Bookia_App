import 'package:bookia/core/helper/app_dialog.dart';
import 'package:bookia/core/helper/extension.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/widgets/app_buttom.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/custom_form_feild.dart';
import 'package:bookia/features/register/data/model/register_request_body.dart';
import 'package:bookia/features/register/presentation/cubit/register_cubit.dart';
// import 'package:bookia/features/login/presentation/ui/login_page.dart';
import 'package:bookia/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    confirmController.dispose();
    passwordController.dispose();
    cityController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CustomBackButton()),

      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            AppDialog.loadingDialog(context);

            return;
          }

          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }

          if (state is RegisterSuccess) {
            context.pushNamedAndRemoveUntil(Routes.homeScreen, false);
          } else if (state is RegisterError) {
            AppDialog.errorDialog(context);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(22.r),
          child: Form(
            key: formKey,
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
                  controller: nameController,
                  hintText: LocaleKeys.username.tr(),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 13.h),

                CustomFormFeild(
                  controller: emailController,
                  hintText: LocaleKeys.email.tr(),
                  keyboardType: TextInputType.emailAddress,
                ),
                CustomFormFeild(
                  controller: addressController,
                  hintText: LocaleKeys.address.tr(),
                  keyboardType: TextInputType.text,
                ),
                CustomFormFeild(
                  controller: cityController,
                  hintText: LocaleKeys.city.tr(),
                  keyboardType: TextInputType.text,
                ),

                SizedBox(height: 13.h),
                CustomFormFeild(
                  controller: passwordController,
                  hintText: LocaleKeys.password.tr(),
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LocaleKeys.passwordrequired.tr();
                    }
                    if (value.length < 8) {
                      return LocaleKeys.passwordtooshort.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: 13.h),

                CustomFormFeild(
                  controller: confirmController,
                  hintText: LocaleKeys.confirmpassword.tr(),
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LocaleKeys.confirmpasswordrequired.tr();
                    }
                    if (value != passwordController.text) {
                      return LocaleKeys.passwordsdonotmatch.tr();
                    }
                    return null;
                  },
                ),

                SizedBox(height: 30.h),
                AppButtom(
                  text: LocaleKeys.register.tr(),
                  onPressed: () {
                    context.read<RegisterCubit>().register(
                      RegisterRequestBody(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        confirmPassword: confirmController.text,
                        city: cityController.text,
                        address: addressController.text,
                      ),
                    );
                  },
                ),
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
        ),
      ),
    );
  }
}
