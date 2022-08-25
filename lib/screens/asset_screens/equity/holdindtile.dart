import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fise_app/screens/asset_screens/equity/allholdinpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../constants/app_theme.dart';
import '../../../constants/size_config.dart';
import '../../../models/user_data.dart';

class HoldingTile extends ConsumerStatefulWidget {
  const HoldingTile({super.key});

  @override
  ConsumerState<HoldingTile> createState() => _HoldingTileState();
}

class _HoldingTileState extends ConsumerState<HoldingTile> {
  @override
  Widget build(BuildContext context) {
    var _userData = ref.watch(currentUserDataProvider);

    return Container(
      height: 470,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(22.0, 0, 0, 7.5),
            child: Text(
              "holdings",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22.0, 0, 0, 0),
            child: Container(
              height: 2,
              color: Colors.grey.withOpacity(0.5),
              width: SizeConfig.screenWidth * 0.3,
            ),
          ),
          Container(
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection("Profiles")
                  .doc(_userData?.uid)
                  .collection("basket")
                  .get(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  var data = snapshot.data!.docs;

                  return Expanded(
                      child: Container(
                    // color: Colors.lightGreenAccent,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var docData = data[index].data()! as Map;

                        return Holdings(equity: docData["name"]);
                      },
                    ),
                  ));
                } else {
                  return Text("You have no investments yet.");
                }
              },
            ),
          ),
          Center(
            child: OutlinedButton(
                onPressed: () {
                  //
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return const AllHoldingPage();
                  })));
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
                ),
                child: Text("  view all  ")),
          )
        ],
      ),
    );
  }
}

class Holdings extends StatelessWidget {
  const Holdings({Key? key, required this.equity}) : super(key: key);
  final String equity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 120,
            width: SizeConfig.screenWidth,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                children: [
                  SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 6,
                          child: Text(equity,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                        ),
                        const Flexible(
                            flex: 1, child: const SizedBox(width: 7)),
                        Flexible(
                          flex: 1,
                          child: Text(
                            "^3.75%",
                            style: TextStyle(
                                color: AppThemeData.lightColorScheme.primary),
                          ),
                        ),
                        Flexible(flex: 1, child: const SizedBox(width: 7)),
                        Flexible(flex: 1, child: Text("Wt: 50%"))
                      ],
                    ),
                  ),
                  LinearPercentIndicator(
                    barRadius: const Radius.circular(16),
                    width: SizeConfig.screenWidth * 0.9,
                    lineHeight: 10.0,
                    percent: 0.75,
                    backgroundColor:
                        AppThemeData.lightColorScheme.primary.withOpacity(0.1),
                    progressColor: AppThemeData.lightColorScheme.primary,
                  ),
                  const SizedBox(height: 15),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text("₹1397.1",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Text("Current Price",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5)))
                          ],
                        ),
                        VerticalDivider(),
                        Column(
                          children: [
                            Text("5",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Text("Shares",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5)))
                          ],
                        ),
                        VerticalDivider(),
                        Column(
                          children: [
                            Text("₹1200.4",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Text("Avg Buy Price",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5)))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
