import 'package:day_task/constants.dart';
import 'package:day_task/views/onboarding/log_in_view.dart';
import 'package:day_task/views/onboarding/sign_up_view.dart';
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
      routes: {
        splashViewRoute: (context) => const SplashView(),
        logInViewRoute: (context) => const LogInView(),
        signUpViewRoute: (context) => const SignUpView()
      },
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      initialRoute: '/splash',
    );
  }
}
