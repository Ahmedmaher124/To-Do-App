import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/commons/commons.dart';
import 'package:to_do_app/core/database/cache/cache_helper.dart';
import 'package:to_do_app/core/services/services_locator.dart';
//import 'package:to_do_app/core/utlis/app_assets.dart';
import 'package:to_do_app/core/utlis/app_colors.dart';
import 'package:to_do_app/core/utlis/app_strings.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';
import 'package:to_do_app/core/widgets/custom_text_button.dart';
import 'package:to_do_app/features/auth/data/model/on_boarding_model.dart';
import 'package:to_do_app/features/task/presentation/screens/home_screen.dart';

class OnBoardingScreens extends StatelessWidget {
  OnBoardingScreens({super.key});

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: PageView.builder(
            controller: controller,
            itemCount: OnBoardingModel.onBoardingScreens.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // Skip button
                  index != 2
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: CustomTextButton(
                            text: AppStrings.skip,
                            onPressed: () {
                              controller.jumpToPage(2);
                            },
                          ),
                        )
                      : SizedBox(height: 54),
                  SizedBox(height: 16),
                  // Image
                  Image.asset(OnBoardingModel.onBoardingScreens[index].imgpath),
                  SizedBox(height: 16),
                  // Dots indicator
                  SmoothPageIndicator(
                    controller: controller, // Use the existing controller
                    count: 3,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.primary,
                      dotHeight: 10,
                      spacing: 8,
                    ),
                  ),
                  SizedBox(height: 52),
                  // Title
                  Text(
                    OnBoardingModel.onBoardingScreens[index].title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 42),
                  // Subtitle
                  Text(OnBoardingModel.onBoardingScreens[index].subtitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayMedium),
                  const SizedBox(height: 106),
                  //buttons
                  Row(
                    children: [
                      // Back button
                      index != 0
                          ? CustomTextButton(
                              text: AppStrings.back,
                              onPressed: () {
                                controller.previousPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                );
                              },
                            )
                          : Container(),

                      const Spacer(),
                      // Next button
                      index != 2
                          ? CustomButton(
                              text: AppStrings.next,
                              onPressed: () {
                                controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                );
                              })
                          //
                          : CustomButton(
                              text: AppStrings.getStarted,
                              onPressed: () {
                                () async {
                                  await sl<CacheHelper>()
                                      .saveData(
                                          key: AppStrings.onBoardingKey,
                                          value: true)
                                      .then((value) {
                                    print('is visited');

                                    navigate(
                                        context: context,
                                        screen: const HomeScreen());
                                    // Navigate to the home screen
                                  }).catchError((e) {
                                    print(e.toString());
                                  });
                                };
                              })
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
