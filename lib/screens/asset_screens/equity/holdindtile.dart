import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fise_app/screens/asset_screens/equity/allholdinpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../constants/app_theme.dart';
import '../../../constants/size_config.dart';
import '../../../models/user_data.dart';
import '../../../util/initializer.dart';

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
      height: 420,
      // color: Colors.red,
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
          FutureBuilder(
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
                int _itemCount = snapshot.data!.docs.length;

                return Expanded(
                    child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  // itemCount: snapshot.data!.docs.length,
                  itemCount: _itemCount,
                  itemBuilder: (context, index) {
                    var docData = data[index].data()! as Map;

                    return _itemCount == 1
                        ? Column(
                            children: [
                              Holdings(
                                  equity: docData["name"],
                                  shares: docData["bought"].toString(),
                                  avgBuyPrice: docData["price"].toString()),
                              Padding(
                                padding: const EdgeInsets.only(top: 100.0),
                                child: Text(
                                  "Keep Investing!",
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ],
                          )
                        : Holdings(
                            equity: docData["name"],
                            shares: docData["bought"].toString(),
                            avgBuyPrice: docData["price"].toString());
                  },
                ));
              } else {
                return Text("You have no investments yet.");
              }
            },
          ),
        ],
      ),
    );
  }
}

class Holdings extends ConsumerStatefulWidget {
  const Holdings({
    Key? key,
    required this.equity,
    required this.shares,
    required this.avgBuyPrice,
  }) : super(key: key);
  final String equity;
  final String shares;
  final String avgBuyPrice;

  @override
  ConsumerState<Holdings> createState() => _HoldingsState();
}

class _HoldingsState extends ConsumerState<Holdings> {
  @override
  Widget build(BuildContext context) {
    var stockInfo = ref.read(basketStocksProvider.state).state;

    return Center(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(
                height: 115,
                width: SizeConfig.screenWidth,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 241, 240, 240),
                  borderRadius: BorderRadius.all(
                    Radius.circular(11),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    children: [
                      // SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 172,
                              child: Text(widget.equity,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Text(
                              "^3.75%",
                              style: TextStyle(
                                  color: AppThemeData.lightColorScheme.primary),
                            ),
                            const Spacer(),
                            Text("Wt: 50%")
                          ],
                        ),
                      ),
                      LinearPercentIndicator(
                        barRadius: const Radius.circular(16),
                        width: SizeConfig.screenWidth * 0.9,
                        lineHeight: 10.0,
                        percent: 0.75,
                        backgroundColor: AppThemeData.lightColorScheme.primary
                            .withOpacity(0.1),
                        progressColor: AppThemeData.lightColorScheme.primary,
                      ),
                      const SizedBox(height: 15),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text("₹" + stockInfo["price"].toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                Text("Current Price",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5)))
                              ],
                            ),
                            VerticalDivider(),
                            Column(
                              children: [
                                Text(widget.shares,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                Text("Shares",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5)))
                              ],
                            ),
                            VerticalDivider(),
                            Column(
                              children: [
                                Text(widget.avgBuyPrice,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                Text("Avg Buy Price",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
