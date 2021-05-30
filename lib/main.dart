import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_pro_firebase_app/pages/auth/signIn.dart';
import 'package:flutter_pro_firebase_app/pages/auth/signUp.dart';
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
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        SignInPage.routeName: (_) => SignInPage(),
        SignUpPage.routeName: (_) => SignUpPage(),
        HomePage.routeName: (_) => HomePage(),
      },
      initialRoute: SignInPage.routeName,
    );
  }
}
