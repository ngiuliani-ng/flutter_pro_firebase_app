import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  /// '/folder/file'
  static String routeName = '/auth/splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
