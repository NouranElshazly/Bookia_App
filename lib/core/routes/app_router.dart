import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/features/home/presentation/ui/home_screen.dart';
import 'package:bookia/features/login/presentation/ui/login_page.dart';
import 'package:bookia/features/notfound/presentation/ui/page_not_found.dart';
import 'package:bookia/features/register/presentation/cubit/cubit/login_cubit.dart';
import 'package:bookia/features/register/presentation/ui/register_screen.dart';
import 'package:bookia/features/welcome/presentation/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(),
            child: LoginPage(),
          ),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => PageNotFound());
    }
  }
}
