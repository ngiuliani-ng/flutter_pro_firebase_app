import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  /// Componente custom riutilizzabile all'interno dell'app.
  AppDivider({
    required this.height,
    required this.color,
  });

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(height / 2),
        ),
      ),
    );
  }
}
