import 'dart:io';

import 'package:fise_app/sms_retriever/sms.dart';
import 'package:fise_app/util/sharedPrefs.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../constants/app_theme.dart';
import '../../constants/size_config.dart';

var roundUpValue = 0;

class GenralRoundups extends StatefulWidget {
  const GenralRoundups({Key? key}) : super(key: key);

  @override
  State<GenralRoundups> createState() => _GenralRoundupsState();
}

class _GenralRoundupsState extends State<GenralRoundups> {
  var multiplier = UserSharedPrefs().getInt("multiplier") ?? 1;

  @override
  void initState() {
    // TODO: implement initState
    todaysRoundUp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: todaysRoundUp(),
      builder: (context, val) {
        if (val.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        roundUpValue = int.parse(val.data.toString());
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: const Text(
                "Roundup cart",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22.0, 0, 0, 15),
              child: Container(
                height: 2,
                color: Colors.grey.withOpacity(0.5),
                width: SizeConfig.screenWidth * 0.4,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: Text(
                  "your roundups will be automatically invested once the cart is filled"),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 4),
              child: Text(
                "₹  $roundUpValue/ ₹ 100",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: LinearPercentIndicator(
                  barRadius: const Radius.circular(16),
                  width: SizeConfig.screenWidth * 0.9,
                  lineHeight: 20.0,
                  percent: roundUpValue / 100 > 1 ? 1 : roundUpValue / 100,
                  backgroundColor:
                      AppThemeData.lightColorScheme.primary.withOpacity(0.1),
                  progressColor: AppThemeData.lightColorScheme.primary,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                //
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("See previous roundups investments"),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(child: RoundupPayTile())
          ],
        );
      },
    );
  }
}

class RoundupPayTile extends StatelessWidget {
  const RoundupPayTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.89,
      decoration: BoxDecoration(
        color: Color(0xffECF1F1),
        borderRadius: BorderRadius.all(
          Radius.circular(11),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(7, 18, 7, 18),
            child: Column(
              children: [
                Text(
                  "Your cart is filled, please do the required payment",
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  "to continue your investing journey!",
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
          ),
          Container(
            // height: 80,
            width: 180,
            child: OutlinedButton(
              onPressed: () {
                // Payment gateway
              },
              style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.2, color: Color(0xff005251)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // dot image here Image here
                  Text(
                    "Pay " + "₹120",
                    style: TextStyle(
                      color: Color(0xff005251),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Icon(Icons.arrow_forward_ios_sharp)
                ],
              ),
            ),
          ),
          const SizedBox(height: 12)
        ],
      ),
    );
  }
}
