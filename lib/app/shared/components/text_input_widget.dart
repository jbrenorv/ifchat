import 'package:flutter/material.dart';
import 'package:ifchat/app/shared/colors/app_colors.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    Key? key,
    required this.controller,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
  }) : super(key: key);

  final Icon? prefixIcon;
  final String? hintText;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.ifGrayBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
