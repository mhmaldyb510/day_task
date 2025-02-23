import 'package:day_task/constants.dart';
import 'package:day_task/cubits/sign_up/sign_up_cubit.dart';
import 'package:day_task/widgets/misc/custom_button.dart';
import 'package:day_task/widgets/onboarding/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<SignUpForm> {
  String? name, email, password;
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
              'Full Name',
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
            hintText: 'Mohamed Naser Aldeeb',
            textInputAction: TextInputAction.next,
            onChanged: (p0) => name = p0,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Your Name.';
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
            height: 20,
          ),
          BlocListener<SignUpCubit, SignUpState>(
            listener: (context, state) {},
            child: CustomButton(
              onPressed: () {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                  if (_formKey.currentState!.validate()) {
                    context.read<SignUpCubit>().signUp(
                          email: email!,
                          password: password!,
                          name: name!,
                        );
                  }
                });
              },
              color: kPrimaryColor,
              width: MediaQuery.sizeOf(context).width,
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
