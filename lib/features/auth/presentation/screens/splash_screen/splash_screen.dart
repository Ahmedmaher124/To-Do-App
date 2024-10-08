import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/core/utlis/app_assets.dart';
import 'package:to_do_app/core/utlis/app_colors.dart';
import 'package:to_do_app/core/utlis/app_strings.dart';

import 'package:to_do_app/core/services/services_locator.dart';
import 'package:to_do_app/core/database/cache/cache_helper.dart';

import 'package:to_do_app/features/auth/presentation/screens/on_boarding_screens/on_boarding_screens.dart';

import 'package:to_do_app/features/auth/presentation/screens/on_boarding_screens/on_boarding_screens.dart'; // Assuming you have this import

import 'package:to_do_app/features/auth/presentation/screens/on_boarding_screens/on_boarding_screens.dart';
import 'package:to_do_app/features/task/presentation/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() {
    bool isVisted =
        sl<CacheHelper>().getData(key: AppStrings.onBoardingKey) ?? false;

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) =>
                isVisted ? const HomeScreen() : OnBoardingScreens()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logo),
            const SizedBox(height: 24.0),
            Text(
              AppStrings.appName,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
