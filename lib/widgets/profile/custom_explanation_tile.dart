import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class CustomExplanationTile extends StatelessWidget {
  const CustomExplanationTile({super.key, required this.leadingIcon, required this.title, required this.children});

  final IconData leadingIcon;
  final String title;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return  ExpansionTile(
      leading: Icon(
        leadingIcon,
        color: kTextColor,
      ),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      iconColor: kTextColor,
      collapsedIconColor: kTextColor,
      backgroundColor: kSecondaryColor,
      collapsedBackgroundColor: kSecondaryColor,
      children: children,
    );
  }
}
