import 'package:fise_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GmailAuthScreen extends StatefulWidget {
  const GmailAuthScreen({Key? key}) : super(key: key);

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
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/login/gmail_screen.png'),
                  fit: BoxFit.cover)),
        )
      ]),
    );
  }
}
