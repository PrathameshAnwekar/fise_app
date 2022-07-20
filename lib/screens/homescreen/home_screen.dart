import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/screens/asset_screens/assetclass_page.dart';
import 'package:fise_app/screens/homescreen/general_returns_widget.dart';
import 'package:fise_app/screens/homescreen/general_status_widget.dart';
import 'package:fise_app/screens/settings/settings_page.dart';
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
        title: Text(
          'Hi Akshat',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return SettingsPage();
              })));
            },
            //
            // onPressed: () {
            //   Navigator.of(context).pushNamed(SettingsPage.routeName);
            // },
            icon: FaIcon(FontAwesomeIcons.circleUser, color: Colors.black),
          ),
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
                // height: SizeConfig.screenHeight * 0.8,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    FinancialAssetTile(),
                    Divider(
                      thickness: 2,
                    ),
                    FinancialAssetTile(),
                    Divider(
                      thickness: 2,
                    ),
                    FinancialAssetTile(),
                    Divider(
                      thickness: 2,
                    ),
                    FinancialAssetTile(),
                    Divider(
                      thickness: 2,
                    ),
                    FinancialAssetTile(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FinancialAssetTile extends StatelessWidget {
  const FinancialAssetTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return FinancialAssetPage(title: 'gold',);
          }));
        },
        title: Text('Crypto'),
        subtitle: Text('Invested 700.29'),
        leading: Icon(
          Icons.monetization_on_outlined,
          size: 50,
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '+25.02',
              style: AppThemeData.textTheme.labelSmall,
            ),
            Text(
              '+2.3%',
              style: AppThemeData.textTheme.labelSmall,
            )
          ],
        ),
      ),
    );
  }
}
