import 'package:fise_app/screens/authentication/gmail_auth.dart';
import 'package:fise_app/screens/authentication/phone_auth.dart';
import 'package:fise_app/screens/homescreen/home_screen.dart';
import 'package:fise_app/screens/settings/settings_page.dart';
import 'package:fise_app/screens/settings/user_info/personal_info.dart';
import 'package:fise_app/util/initializer.dart';
import 'package:flutter/material.dart';


var customRoutes = <String, WidgetBuilder>{
        InitializerWidget.routeName: (context) => InitializerWidget(),
        GmailAuthScreen.routeName: (context) => GmailAuthScreen(),
        PhoneAuth.routeName: (context) => PhoneAuth(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SettingsPage.routeName: (context) => SettingsPage(),
        PersonalInfoPage.routeName: (context) => PersonalInfoPage()
};