import 'package:day_task/constants.dart';
import 'package:day_task/cubits/sign_up/sign_up_cubit.dart';
import 'package:day_task/helpers/firebase_helpers.dart';
import 'package:day_task/views/onboarding/log_in_view.dart';
import 'package:day_task/widgets/misc/custom_button.dart';
import 'package:day_task/widgets/onboarding/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
              inAsyncCall: state is SignUpLoading,
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
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Create your account',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const SignUpForm(),
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
                                context.read<SignUpCubit>().holding();
                                await continueWithGoogle();
                                if (context.mounted) {
                                  context.read<SignUpCubit>().unHolding();
                                  Navigator.pop(context);
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
                            side:
                                const BorderSide(color: Colors.white, width: 2),
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
                              onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LogInView(),
                                ),
                              ),
                              child: RichText(
                                text: const TextSpan(
                                  text: 'Already have an account ',
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontSize: 16,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Log In',
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
              ));
        },
      ),
    );
  }
}
