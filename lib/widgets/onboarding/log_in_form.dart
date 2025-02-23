import 'package:day_task/constants.dart';
import 'package:day_task/cubits/log_in/log_in_cubit.dart';
import 'package:day_task/widgets/misc/custom_button.dart';
import 'package:day_task/widgets/onboarding/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Email Address',
              style: TextStyle(
                color: kTextColor,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextFormField(
            prefixIcon: Icons.email,
            hintText: 'example@daytask.com',
            textInputAction: TextInputAction.next,
            onChanged: (p0) => email = p0,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Email.';
              } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return 'valid email address';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Password',
              style: TextStyle(
                color: kTextColor,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextFormField(
            prefixIcon: Icons.lock,
            hintText: '********',
            isPassword: true,
            textInputAction: TextInputAction.done,
            onChanged: (p0) => password = p0,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Password';
              }
              return null;
            },
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
            onPressed: () {
              setState(() {
                autovalidateMode = AutovalidateMode.always;
              });
              if (_formKey.currentState!.validate()) {
                BlocProvider.of<LogInCubit>(context)
                    .logIn(email: email!, password: password!);
              }
            },
            width: MediaQuery.sizeOf(context).width,
            color: kPrimaryColor,
            child: const Text(
              'Log In',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
