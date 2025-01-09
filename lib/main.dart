import 'package:day_task/constants.dart';
import 'package:day_task/views/onboarding/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DayTask());
}

class DayTask extends StatelessWidget {
  const DayTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: const SplashView(),
    );
  }
}
