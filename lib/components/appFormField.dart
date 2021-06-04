import 'package:flutter/material.dart';

class AppFormField extends StatelessWidget {
  /// Componente custom riutilizzabile all'interno dell'app.
  AppFormField({
    required this.color,
    required this.borderRadius,
    required this.borderColor,
    required this.textInputType,
    required this.hintText,
    required this.obscureText,
    this.controller,
    this.error = '',
    this.icon,
    this.onPressed,
  });

  /// Proprietà del [Container].
  final Color color;

  /// Proprietà del [Container].
  final double borderRadius;

  /// Proprietà del [Container].
  final Color borderColor;

  /// Proprietà del [TextFormField].
  final TextInputType textInputType;

  /// Proprietà del [TextFormField].
  final String hintText;

  /// Proprietà del [TextFormField].
  final bool obscureText;

  /// Proprietà del [TextFormField].
  final TextEditingController? controller;

  /// Proprietà del [Text] e del [Visibility] padre.
  final String error;

  /// Proprietà dell'[IconButton] e del [Visibility] padre.
  final IconData? icon;

  /// Proprietà dell'[IconButton].
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool _iconButtonVisibility = icon != null ? true : false;
    final bool _errorTextVisibility = error != '' ? true : false;

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: borderRadius),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: _errorTextVisibility ? Colors.red : borderColor,
            ),
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
                visible: _iconButtonVisibility,
                child: SizedBox(width: borderRadius),
              ),
              Visibility(
                visible: _iconButtonVisibility,
                child: IconButton(
                  icon: Icon(icon),
                  splashRadius: 18,
                  onPressed: onPressed,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: _errorTextVisibility,
          child: SizedBox(height: borderRadius),
        ),
        Visibility(
          visible: _errorTextVisibility,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: borderRadius),
            child: Row(
              children: [
                Text(
                  error,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
