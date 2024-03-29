import 'package:fise_app/screens/authentication/gmail_auth.dart';
import 'package:fise_app/screens/authentication/phone_auth.dart';
import 'package:fise_app/screens/authentication/signupPage.dart';
import 'package:fise_app/screens/homescreen/homescreen.dart';
import 'package:fise_app/screens/settings/user_info/personal_info.dart';
import 'package:fise_app/util/initializer.dart';
import 'package:flutter/material.dart';
import '../screens/settings/settings_page.dart';

var customRoutes = <String, WidgetBuilder>{
  InitializerWidget.routeName: (context) => InitializerWidget(),
  GmailAuthScreen.routeName: (context) => GmailAuthScreen(),
  PhoneAuth.routeName: (context) => PhoneAuth(),
  Homescreen.routeName: (context) => Homescreen(),
  SettingsPage.routeName: (context) => SettingsPage(),
  PersonalInfoPage.routeName: (context) => PersonalInfoPage(),
  SignupPage.routeName:(context) => SignupPage(),
};
