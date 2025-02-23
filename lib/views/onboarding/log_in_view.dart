import 'package:day_task/constants.dart';
import 'package:day_task/cubits/log_in/log_in_cubit.dart';
import 'package:day_task/helpers/functions.dart';
import 'package:day_task/widgets/misc/custom_button.dart';
import 'package:day_task/widgets/onboarding/log_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

const String logInViewRoute = '/log_in';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInCubit(),
      child: BlocListener<LogInCubit, LogInState>(
        listener: (context, state) {
          if (state is LogInLoading) {
            setState(() {
              isLoading = true;
            });
          } else if (state is LogInSuccess) {
            setState(() {
              isLoading = false;
            });
            Navigator.pushReplacementNamed(context, '/main_scaffold');
          } else if (state is LogInFailure) {
            setState(() {
              isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
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
                          width: MediaQuery.sizeOf(context).width * 0.3,
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
                      const LogInForm(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              color: kTextColor,
                              endIndent: 16,
                            ),
                          ),
                          Text(
                            'Or Continue with',
                            style: TextStyle(
                              color: kTextColor,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: kTextColor,
                              indent: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        onPressed: () async {
                          try {
                            await signInWithGoogle();
                            if (context.mounted) {
                              Navigator.pushReplacementNamed(
                                context,
                                '/main_scaffold',
                              );
                            }
                          } on Exception catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(e.toString()),
                                ),
                              );
                            }
                          }
                        },
                        width: MediaQuery.sizeOf(context).width,
                        color: kBackgroundColor,
                        side: const BorderSide(color: Colors.white, width: 2),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Google',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () => Navigator.pushReplacementNamed(
                              context, '/sign_up'),
                          child: RichText(
                            text: const TextSpan(
                              text: 'Don\'t have an account? ',
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
