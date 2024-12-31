import 'package:flutter/material.dart';
import '/Pages/splash_page.dart';
import '/routes/approute.dart';

void main() {
  runApp(MyApp(
    appRoute: AppRoute(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRoute appRoute;
  const MyApp({super.key, required this.appRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Cairo'),
      title: 'Oreders App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoute.generateroute,
      home: SplashPage(),
    );
  }
}
