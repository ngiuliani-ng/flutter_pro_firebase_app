import 'package:flutter/material.dart';

class AppFormField extends StatelessWidget {
  AppFormField({
    required this.color,
    required this.radius,
    required this.textInputType,
    required this.hintText,
    required this.obscureText,
    this.controller,
  });

  /// Proprietà del Container.
  final Color color;

  /// Proprietà del Container.
  final double radius;

  final TextInputType textInputType;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: radius),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: TextFormField(
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
        obscureText: obscureText,
        controller: controller,
      ),
    );
  }
}
