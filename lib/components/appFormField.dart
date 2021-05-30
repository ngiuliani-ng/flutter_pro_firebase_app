import 'package:flutter/material.dart';

class AppFormField extends StatelessWidget {
  /// Componente custom riutilizzabile all'interno dell'app.
  AppFormField({
    required this.color,
    required this.radius,
    required this.textInputType,
    required this.hintText,
    required this.obscureText,
    this.controller,
    this.iconButton = false,
    this.icon,
    this.onPressed,
  });

  /// Proprietà del [Container].
  final Color color;

  /// Proprietà del [Container].
  final double radius;

  final TextInputType textInputType;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;

  /// Proprietà del [Visibility] e dell'[IconButton].
  ///
  /// Se l'[iconButton] è true viene mostrata l'[icon] passata all'[AppFormField].
  ///
  /// Se l'[iconButton] è false non viene mostrata l'[icon] passata all'[AppFormField].
  final bool iconButton;

  /// Proprietà dell'[IconButton].
  final IconData? icon;

  /// Proprietà dell'[IconButton].
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: radius),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              keyboardType: textInputType,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
              obscureText: obscureText,
              controller: controller,
            ),
          ),
          Visibility(
            visible: iconButton,
            child: SizedBox(width: radius),
          ),
          Visibility(
            visible: iconButton,
            child: IconButton(
              icon: Icon(icon),
              splashRadius: 18,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
