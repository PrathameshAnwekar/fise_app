import 'package:auto_size_text/auto_size_text.dart';
import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/screens/stock_data.dart';
import 'package:fise_app/screens/asset_screens/gold/investmore_gold.dart';
import 'package:flutter/material.dart';

class AssetReturnsWidget extends StatelessWidget {
  const AssetReturnsWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        text: 'Current Value\n\n',
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
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'of your roundups in ${title}',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ]),
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: Container(),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => InvestMoreGold()));
              },
              child: Text('Invest More',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w100)),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(
                    255,
                    255,
                    187,
                    0,
                  )),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )))),
        )
      ],
    );
  }
}
