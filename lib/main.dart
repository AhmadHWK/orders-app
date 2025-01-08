import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_languages_project/Cubits/auth_cubit/auth_cubit.dart';
import 'package:programming_languages_project/core/api/custom_dio.dart';
import '/Pages/splash_page.dart';
import '/routes/approute.dart';
import 'core/cache/cache_memory.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheMemory.instance.init();
  runApp(MyApp(
    appRoute: AppRoute(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRoute appRoute;
  const MyApp({super.key, required this.appRoute});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(DioClients(dio: Dio())),
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Cairo'),
        title: 'Oreders App',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoute.generateroute,
        home: SplashPage(),
      ),
    );
  }
}
