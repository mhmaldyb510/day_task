import 'package:day_task/constants.dart';
import 'package:day_task/views/home/home_view.dart';
import 'package:day_task/views/onboarding/log_in_view.dart';
import 'package:day_task/views/onboarding/sign_up_view.dart';
import 'package:day_task/views/onboarding/splash_view.dart';
import 'package:day_task/widgets/scaffold/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        signUpViewRoute: (context) => const SignUpView(),
        mainScaffold: (context) => const MainScaffold(),
        homeViewRoute: (context) => const HomeView(),
      },
      theme: ThemeData(
        splashFactory: InkRipple.splashFactory,
        canvasColor: const Color(0xff273238),
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      initialRoute: '/main_scaffold',
    );
  }
}
