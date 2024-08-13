import 'package:flutter/material.dart';

import 'package:to_do_app/core/utlis/app_assets.dart';
import 'package:to_do_app/core/utlis/app_colors.dart';
import 'package:to_do_app/core/utlis/app_strings.dart'; // Assuming you have this import

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Image.asset(AppAssets.logo),
        ),
      ),
    );
  }
}
