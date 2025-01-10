import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Widget? child;
  final void Function() onPressed;
  final BorderSide? side;
  const CustomButton({
    super.key,
    this.color = kPrimaryColor,
    required this.onPressed,
    this.child,
    this.side,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 50),
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: const RoundedRectangleBorder(),
        side: side,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
