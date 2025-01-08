import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_languages_project/Cubits/auth_cubit/auth_cubit.dart';
import 'package:programming_languages_project/Pages/home_page.dart';
import 'package:programming_languages_project/Pages/signin_page.dart';
import 'package:programming_languages_project/Pages/signup_page.dart';

import '../core/api/custom_dio.dart';

class AppRoute {
  Route? generateroute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case 'homepage':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );

      case 'signin':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(DioClients(dio: Dio())),
            child: const SignInPage(),
          ),
        );
      case 'signup':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(DioClients(dio: Dio())),
            child: const SignUpPage(),
          ),
        );
    }
    return MaterialPageRoute(
      builder: (_) => const HomePage(),
    );
  }
}
