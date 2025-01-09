import 'package:day_task/constants.dart';
import 'package:day_task/widgets/custom_button.dart';
import 'package:day_task/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const Text(
            'Email Address',
            style: TextStyle(
              color: kTextColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const CustomTextFormField(
            icon: Icons.email,
            hintText: 'example@daytask.com',
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Password',
            style: TextStyle(
              color: kTextColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const CustomTextFormField(
            icon: Icons.lock,
            hintText: '********',
            isPassword: true,
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {},
            child: const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: 'Log in',
            onPressed: () {},
            color: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
