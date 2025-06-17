import 'dart:developer';

import 'package:day_task/constants.dart';
import 'package:day_task/views/onboarding/splash_view.dart';
import 'package:day_task/widgets/scaffold/main_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseAuth.instance.signOut();
  // FirebaseAuth.instance.currentUser?.delete();
  log(FirebaseAuth.instance.currentUser.toString());

  runApp(const DayTask());
}

class DayTask extends StatefulWidget {
  const DayTask({super.key});

  @override
  State<DayTask> createState() => _DayTaskState();
}

class _DayTaskState extends State<DayTask> {
  bool loggedIn = false;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        loggedIn = (user != null);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashFactory: InkRipple.splashFactory,
        canvasColor: const Color(0xff273238),
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: loggedIn ? const MainScaffold() : const SplashView(),
    );
  }
}
