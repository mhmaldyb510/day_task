import 'package:day_task/constants.dart';
import 'package:day_task/widgets/misc/custom_button.dart';
import 'package:day_task/widgets/onboarding/custom_text_form_field.dart';
import 'package:day_task/widgets/profile/custom_explanation_tile.dart';
import 'package:day_task/widgets/profile/profile_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const String profileViewRoute = '/profile_view';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    String name = FirebaseAuth.instance.currentUser!.displayName.toString();
    String email = FirebaseAuth.instance.currentUser!.email.toString();

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: ProfileAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              hintText: name,
              prefixIcon: Icons.person,
              suffixIcon: Icons.edit_square,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              hintText: email,
              prefixIcon: Icons.email,
              suffixIcon: Icons.edit_square,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextFormField(
              hintText: 'Password',
              prefixIcon: Icons.lock,
              suffixIcon: Icons.edit_square,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomExplanationTile(
              leadingIcon: Icons.checklist,
              title: 'My Tasks',
              children: [
                ListTile(title: Text('Task 1')),
                ListTile(title: Text('Task 2')),
                ListTile(title: Text('Task 3')),
              ],
            ),
            //privacy explanation tile
            const SizedBox(
              height: 20,
            ),
            const CustomExplanationTile(
              leadingIcon: Icons.privacy_tip,
              title: 'Privacy',
              children: [
                ListTile(title: Text('Privacy Policy')),
              ],
            ),
            //settings explanation tile
            const SizedBox(
              height: 20,
            ),
            const CustomExplanationTile(
              leadingIcon: Icons.settings,
              title: 'Settings',
              children: [
                ListTile(title: Text('Settings')),
              ],
            ),
            //logout button
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/splash',
                  (route) => false,
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 24,
                children: [
                  Icon(
                    Icons.logout,
                    color: kBackgroundColor,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(color: kBackgroundColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
