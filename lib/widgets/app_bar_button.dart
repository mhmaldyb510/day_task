import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  const AppBarButton({
    super.key,
    required this.title,
    this.backgroundColor = kPrimaryColor,
    this.textColor = Colors.black,
    this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor,
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        fixedSize: WidgetStatePropertyAll<Size>(
          Size(
            width ?? (MediaQuery.of(context).size.width - 80) / 2,
            height ?? 40,
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
        ),
      ),
    );
  }
}
