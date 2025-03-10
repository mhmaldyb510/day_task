import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final Color color;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? hintText;
  final bool isPassword;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const CustomTextFormField({
    super.key,
    this.color = kSecondaryColor,
    this.prefixIcon,
    this.hintText,
    this.isPassword = false,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.suffixIcon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscure = false;
  @override
  void initState() {
    _isObscure = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction,
      obscureText: _isObscure,
      onChanged: widget.onChanged,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Inter',
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w100,
          color: Colors.white,
          fontFamily: 'Inter',
          fontSize: 18,
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Colors.white,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
              )
            : Icon(
                widget.suffixIcon,
                color: Colors.white,
              ),
        filled: true,
        fillColor: kSecondaryColor,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(
              0,
            ),
          ),
        ),
      ),
      validator: widget.validator,
    );
  }
}
