// FLUTTER IMPORTS
import 'package:firebase_core/firebase_core.dart';
import 'package:fise_app/firebase_options.dart';
import 'package:fise_app/util/initializer.dart';
import 'package:flutter/material.dart';
// FILE IMPORTS
import 'package:fise_app/constants/constants.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding); //PRESERVE SPLASH SCREEN WHILE INITIALIZATION
  // FlutterNativeSplash.remove();

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
    );
  }
}
