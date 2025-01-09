import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final void Function() onPressed;
  const CustomButton({
    super.key,
    this.color = kPrimaryColor,
    required this.text,
    this.textColor = Colors.black,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 50),
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: const RoundedRectangleBorder(),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
