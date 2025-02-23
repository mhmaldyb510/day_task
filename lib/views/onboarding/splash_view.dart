import 'package:day_task/constants.dart';
import 'package:day_task/widgets/misc/custom_button.dart';
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
                width: MediaQuery.sizeOf(context).width * 0.2,
              ),
              const Spacer(),
              Image.asset(
                'assets/images/splash_image.png',
              ),
              const Spacer(),
              RichText(
                text: TextSpan(
                  text: 'Manage ',
                  style: TextStyle(
                    height: 1,
                    fontFamily: 'Pilat Extended',
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.148,
                    fontWeight: FontWeight.bold,
                  ),
                  children: const [
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
              const Spacer(),
              CustomButton(
                width: MediaQuery.sizeOf(context).width,
                onPressed: () {
                  Navigator.pushNamed(context, '/log_in');
                },
                child: const Text(
                  'Let\'s Start',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
