import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class CreateTaskTextField extends StatelessWidget {
  final int maxLines;
final String? Function(String?)? validator;
  const CreateTaskTextField({
    super.key,
    this.maxLines = 1, this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: validator,
      decoration: const InputDecoration(
        fillColor: kSecondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
