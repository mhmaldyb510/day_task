import 'package:day_task/widgets/onboarding/log_in_form.dart';
import 'package:flutter/material.dart';

const String logInViewRoute = '/log_in';

class LogInView extends StatelessWidget {
  const LogInView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const LogInForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
