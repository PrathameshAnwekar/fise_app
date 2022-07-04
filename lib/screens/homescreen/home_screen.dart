import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/screens/homescreen/general_return_widget.dart';
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
        backgroundColor: AppThemeData.lightColorScheme.primary,
        appBar: AppBar(
          title: Text('Hi Akshat'),
          actions: [
            IconButton(
                onPressed: null,
                icon: FaIcon(FontAwesomeIcons.circleUser, color: Colors.black))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              decoration:
                  BoxDecoration(color: AppThemeData.lightColorScheme.primary),
              padding: EdgeInsets.fromLTRB(
                  SizeConfig.screenWidth * 0.1,
                  SizeConfig.screenHeight * 0.04,
                  0,
                  SizeConfig.screenHeight * 0.04),
              child: Row(children: [
                GeneralStatusWidget(),
                Expanded(child: Container()),
                GeneralReturnsWidget()
              ]),
            ),
            SingleChildScrollView(
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: SizeConfig.screenHeight * 0.8,
                  child: ListView(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        child: ListTile(
                          
                          title: Text('Crypto'),
                          subtitle: Text('Invested 700.29'),
                          leading: Icon(
                            Icons.monetization_on_outlined,
                            size: 50,
                          ),
                          trailing: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                            Text(
                              '+25.02',
                              style: AppThemeData.textTheme.labelSmall,
                            ),
                            Text('+2.3%',style: AppThemeData.textTheme.labelSmall,)
                          ]),
                        ),
                      ), Divider(thickness: 2,)
                    ],
                  )),
            )
          ]),
        ));
  }
}
