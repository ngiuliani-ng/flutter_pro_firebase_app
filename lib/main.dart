import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_pro_firebase_app/pages/general/error.dart';
import 'package:flutter_pro_firebase_app/pages/auth/splash.dart';
import 'package:flutter_pro_firebase_app/pages/auth/signIn.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

/// Qui utilizziamo uno [StatefulWidget] perchè ci permette di creare la [Future],
/// quindi di inizializzare FlutterFire, solo una volta; non importa quante volte [App] verrà ricostruita da Flutter.
///
/// Se invece avessimo mantenuto uno [StatelessWidget] sarebbe stato re-inizializzato FlutterFire ogni volta,
/// facendo rientrare l'applicazione, nel [FutureBuilder], in stato di caricamento.
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// Inizializzazione FlutterFire.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

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
      home: FutureBuilder(
        /// Inizializzazione FlutterFire.
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorPage();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return SignInPage();
          } else if (snapshot.connectionState == ConnectionState.none) {
            return ErrorPage();
          } else {
            return SplashPage();
          }
        },
      ),
    );
  }
}
