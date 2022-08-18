import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/screens/settings/app_settings/dailySavingsTile.dart';
import 'package:fise_app/screens/settings/app_settings/multiplierTile.dart';
import 'package:fise_app/screens/settings/app_settings/roundupstile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class AppsettingsPage extends StatefulWidget {
  const AppsettingsPage({Key? key}) : super(key: key);

  @override
  State<AppsettingsPage> createState() => _AppsettingsPageState();
}

class _AppsettingsPageState extends State<AppsettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        //
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.black26,
              height: 1.0,
            )),
        backgroundColor: Colors.white,
        title: const Text(
          "app settings",
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          Image.asset(
            "assets/images/setting_icons/App_settings.png",
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundupsTile(),
            MultiplierTile(),
            dailySavingsTile(),
//
            assetTile(
              asset: "GOLD",
              allocatedPercentage: "20",
              containerColor: Color(0xFFECC44D),
            ),
            assetTile(
              asset: "EQUITY",
              allocatedPercentage: "80",
              containerColor: Color(0xFFA0D0C8),
            ),
            assetTile(
              asset: "MUTUAL FUND",
              allocatedPercentage: "0",
              containerColor: Color(0xFFDA4C62),
            ),
            assetTile(
              asset: "BONDS",
              allocatedPercentage: "0",
              containerColor: Color(0xFF3B3D50),
            ),
            assetTile(
              asset: "US STOCKS",
              allocatedPercentage: "0",
              containerColor: Color(0xFFE7DED4),
            ),
            assetTile(
              asset: "CRYPTO",
              allocatedPercentage: "0",
              containerColor: Color(0xFF7698A0),
            ),
            Text(
              "To know more about roundups, multiplier, daily savings or asset allocation, head towards FAQ.",
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF636363),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class assetTile extends StatelessWidget {
  const assetTile({
    Key? key,
    required this.asset,
    required this.allocatedPercentage,
    required this.containerColor,
  }) : super(key: key);
  final String asset;
  final String allocatedPercentage;
  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(
            color: containerColor,
          ),
        ),
        child: Row(
          children: [
            Text(
              asset,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF636363)),
            ),
            const Spacer(),
            Text(
              allocatedPercentage + "%",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xFF636363),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
