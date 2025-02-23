import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: kPrimaryTextStyle,
        ),
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      );
  }
}