import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Widget? child;
  final void Function() onPressed;
  final double width;
  final double height;
  final BorderSide? side;
  const CustomButton({
    super.key,
    this.color = kPrimaryColor,
    required this.onPressed,
    this.child,
    this.side,
    this.width = double.infinity,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
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
