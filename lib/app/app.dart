import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/theme.dart';
//import 'package:to_do_app/core/utlis/app_colors.dart';

import 'package:to_do_app/core/utlis/app_strings.dart';
import 'package:to_do_app/features/auth/presentation/screens/splash_screen/splash_screen.dart'; // Assuming you have this import

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppStrings.appName,
        theme: getAppTheme(),
        darkTheme: getAppDarkTheme(),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
