// FLUTTER IMPORTS
import 'package:fise_app/screens/authentication/gmail_auth.dart';
import 'package:fise_app/screens/authentication/phone_auth.dart';
import 'package:fise_app/screens/homescreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fise_app/firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

// FILE IMPORTS
import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/util/initializer.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await FlutterDisplayMode.setHighRefreshRate();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterNativeSplash.preserve(
      widgetsBinding:
          widgetsBinding); //PRESERVE SPLASH SCREEN WHILE INITIALIZATION

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppThemeData.themeData(
          AppThemeData.lightColorScheme, AppThemeData.lightFocusColor),
      home: InitializerWidget(),
      routes: {
        InitializerWidget.routeName: (context) => InitializerWidget(),
        GmailAuthScreen.routeName: (context) => GmailAuthScreen(),
        PhoneAuth.routeName: (context) => PhoneAuth(),
        HomeScreen.routeName: (context) => HomeScreen()
      },
    );
  }
}
