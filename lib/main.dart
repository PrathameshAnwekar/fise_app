// FLUTTER IMPORTS

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fise_app/firebase_options.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
// FILE IMPORTS
import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/util/initializer.dart';
import 'package:fise_app/util/custom_routes.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await FlutterDisplayMode.setHighRefreshRate();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


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
      routes: customRoutes,
    );
  }
}
