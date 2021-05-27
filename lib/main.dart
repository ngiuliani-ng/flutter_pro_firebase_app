import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_pro_firebase_app/pages/auth/login.dart';
import 'package:flutter_pro_firebase_app/pages/auth/register.dart';
import 'package:flutter_pro_firebase_app/pages/home/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        /// Colors.
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,

        /// Brightness.
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        LoginPage.routeName: (_) => LoginPage(),
        RegisterPage.routeName: (_) => RegisterPage(),
        HomePage.routeName: (_) => HomePage(),
      },
      initialRoute: LoginPage.routeName,
    );
  }
}
