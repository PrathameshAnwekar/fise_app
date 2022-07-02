import 'package:fise_app/constants/app_theme.dart';
import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/screens/homescreen/general_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = 'homepage';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Hi Akshat'),
          actions: [
            IconButton(
                onPressed: null,
                icon: FaIcon(FontAwesomeIcons.circleUser, color: Colors.black))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration:
                    BoxDecoration(color: AppThemeData.lightColorScheme.primary),
                    padding: EdgeInsets.fromLTRB(
                        SizeConfig.screenWidth * 0.1,
                        SizeConfig.screenHeight * 0.04,
                        0,
                        SizeConfig.screenHeight * 0.04),
                child: Row(children: [
                  Container(
                    child: GeneralStatusWidget(),
                  ),

                ]),
              )
            ],
          ),
        ));
  }
}

