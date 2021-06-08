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
    required this.controller,
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
  final TextEditingController controller;

  /// Proprietà del [Text] e del [Visibility] padre.
  final String error;

  /// Proprietà dell'[IconButton] e del [Visibility] padre.
  final IconData? icon;

  /// Proprietà dell'[IconButton].
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool _iconVisibility = icon != null ? true : false;
    final bool _errorVisibility = error != '' ? true : false;

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: borderRadius),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: _errorVisibility ? Colors.red : borderColor,
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
                visible: _iconVisibility,
                child: SizedBox(width: borderRadius),
              ),
              Visibility(
                visible: _iconVisibility,
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
          visible: _errorVisibility,
          child: SizedBox(height: borderRadius),
        ),
        Visibility(
          visible: _errorVisibility,
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
