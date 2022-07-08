import 'package:fise_app/constants/constants.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const routeName = '/settingspag';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage(
                  'assets/images/login/enter_number_bg.png',
                ))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.fromLTRB(SizeConfig.screenWidth * 0.05,
                SizeConfig.screenHeight * 0.3, 0, 0),
            child: Text(
              'settings',
              style: AppThemeData.textTheme.headline6,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                  child: Column(
                children: const [
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                  ListTile(
                    title: Text('abcd'),
                  ),
                ],
              )),
            ),
          )
        ]),
      ),
    );
  }
}
