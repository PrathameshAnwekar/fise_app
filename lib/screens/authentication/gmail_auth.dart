import 'package:flutter/material.dart';

import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/screens/authentication/google_button.dart';

class GmailAuthScreen extends StatefulWidget {
  const GmailAuthScreen({Key? key}) : super(key: key);

  static const routeName = 'gmailauth';

  @override
  State<GmailAuthScreen> createState() => _GmailAuthScreenState();
}

class _GmailAuthScreenState extends State<GmailAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/login/gmail_screen.png'),
                  fit: BoxFit.cover)),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(SizeConfig.screenWidth * 0.1,
              SizeConfig.screenHeight * 0.35, SizeConfig.screenWidth * 0.1, 0),
          child: Text(
              'For seamless one-tap logins, please use your Google account to continue.',
              style: AppThemeData.textTheme.headline2),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(SizeConfig.screenWidth * 0.45,
              SizeConfig.screenHeight * 0.5, 0, 0),
          child: GoogleButton(),
        ),
      ]),
    );
  }
}
