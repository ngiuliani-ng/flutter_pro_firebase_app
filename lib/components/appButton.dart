import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  /// Componente custom riutilizzabile all'interno dell'app.
  AppButton({
    required this.height,
    required this.minWidth,
    required this.color,
    required this.textColor,
    required this.borderRadius,
    required this.child,
    required this.onPressed,
  });

  final double height;
  final double minWidth;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      minWidth: minWidth,
      color: color,
      textColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
      onPressed: onPressed,
    );
  }
}
