import 'package:auto_size_text/auto_size_text.dart';
import 'package:fise_app/constants/app_theme.dart';
import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/screens/asset_screens/asset_returns_widget.dart';
import 'package:fise_app/screens/asset_screens/equity/basket_search.dart';
import 'package:fise_app/screens/homescreen/genral_transactions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FinancialAssetPage extends StatefulWidget {
  const FinancialAssetPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<FinancialAssetPage> createState() => _FinancialAssetPageState();
}

class _FinancialAssetPageState extends State<FinancialAssetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: AutoSizeText(
          widget.title,
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w100),
        ),
        backgroundColor: AppThemeData.lightColorScheme.primary,
      ),
      backgroundColor: AppThemeData.lightColorScheme.primary,
      body: Column(children: [
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.4,
          decoration: BoxDecoration(
            color: AppThemeData.lightColorScheme.primary,
          ),
          child: AssetReturnsWidget(title: widget.title),
        ),
        Expanded(
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(
                
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)), color: Colors.white),
              child: SingleChildScrollView(
                  // margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.4),
                  child: GeneralTransactions()),
            ))
      ]),
      floatingActionButton: widget.title == 'Equity'
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BasketSearchScreen(),
                  ),
                );
              },
              child: Icon(Icons.add),
            )
          : null,
    );
  }
}
