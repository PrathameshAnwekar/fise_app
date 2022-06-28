// FLUTTER IMPORTS
import 'package:fise_app/util/initializer.dart';
import 'package:flutter/material.dart';
// FILE IMPORTS
import 'package:fise_app/constants/constants.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding); //PRESERVE SPLASH SCREEN WHILE INITIALIZATION
  // FlutterNativeSplash.remove();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemeData.lightThemeData,
      home: InitializerWidget(),
    );
  }
}
