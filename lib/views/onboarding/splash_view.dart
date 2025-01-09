import 'package:day_task/constants.dart';
import 'package:day_task/widgets/custom_button.dart';
import 'package:flutter/material.dart';

const String splashViewRoute = '/splash';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 75,
              ),
              const Spacer(),
              Expanded(
                flex: 26,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/splash_image.png',
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              RichText(
                text: const TextSpan(
                  text: 'Manage ',
                  style: TextStyle(
                    height: 1,
                    fontFamily: 'Pilat Extended',
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'your\n',
                    ),
                    TextSpan(
                      text: 'Task with\n',
                    ),
                    TextSpan(
                      text: 'DayTask',
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/log_in');
                },
                text: 'Let\'s Start',
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
