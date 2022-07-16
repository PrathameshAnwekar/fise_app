import 'package:auto_size_text/auto_size_text.dart';
import 'package:fise_app/constants/app_theme.dart';
import 'package:fise_app/constants/constants.dart';
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
      body: Stack(children: [
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.4,
          decoration: BoxDecoration(
            color: AppThemeData.lightColorScheme.primary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: SizeConfig.screenWidth,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                width: SizeConfig.screenWidth * 0.20,
                child: Image.asset(
                  'assets/images/financialAssets/gold.png',
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
                child: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Center(
                        child: AutoSizeText.rich(
                          TextSpan(children: [
                            TextSpan(
                              text: 'Total Value\n\n',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w100),
                            ),
                            TextSpan(
                                text: '\u20B9 1,00,000',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                          ]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: SizeConfig.screenHeight * 0.08,
                      color: Colors.white,
                    ),
                    const Expanded(
                      flex: 1,
                      child: Center(
                        child: AutoSizeText.rich(
                          TextSpan(children: [
                            TextSpan(
                              text: 'Total Value\n\n',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w100),
                            ),
                            TextSpan(
                                text: '\u20B9 1,00,000',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                          ]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              AutoSizeText.rich(
                TextSpan(children: [
                  const TextSpan(
                    text: 'allocating ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const TextSpan(
                    text: '20% ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'of your roundups in ${widget.title}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ]),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                  onPressed: null,
                  child: Text('Invest More',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w100)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 255, 187, 0,)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              ))))
            ],
          ),
        ),
      ]),
    );
  }
}
