import 'dart:io';

import 'package:fise_app/sms_retriever/sms.dart';
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
                child: Row(
                  children: [
                    const Text(
                      "Roundup cart",
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Container(
                      height: 34.0,
                      width: 120,
                      decoration: BoxDecoration(
                        color: AppThemeData.lightColorScheme.primary
                            .withOpacity(0.3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(17.0)),
                      ),
                      child: const Center(child: Text("Auto-Save is Live")),
                    ),
                  ],
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
                    percent: roundUpValue / 100,
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
            ],
          );
        });
  }
}
