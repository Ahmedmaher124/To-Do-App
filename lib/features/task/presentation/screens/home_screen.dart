import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importing intl package
import 'package:to_do_app/core/utlis/app_assets.dart';
import 'package:to_do_app/core/utlis/app_colors.dart';
import 'package:to_do_app/core/utlis/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMEd()
                    .format(DateTime.now()), // Corrected DateFormat
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 12),
              Text(
                AppStrings.today,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 8.0), // Add padding to avoid overflow
                child: DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: AppColors.primary,
                  selectedTextColor: AppColors.white,
                  dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                  dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                  monthTextStyle: Theme.of(context).textTheme.displayMedium!,
                  onDateChange: (date) {
                    // BlocProvider.of<TaskCubit>(context).getSelectedDate(date);
                  },
                ),
              ),
              const SizedBox(height: 50),
              //no tasks
              noTasksWidget(context),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Column noTasksWidget(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.noTasks),
        Text(
          AppStrings.noTaskTitle,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: 24, color: Colors.white),
        ),
        Text(
          AppStrings.noTaskSubTitle,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.white),
        )
      ],
    );
  }
}
