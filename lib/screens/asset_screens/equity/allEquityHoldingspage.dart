import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fise_app/models/user_data.dart';
import 'package:fise_app/screens/asset_screens/equity/holdindtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../constants/size_config.dart';

class EquityrecentInvstment extends ConsumerStatefulWidget {
  const EquityrecentInvstment({Key? key}) : super(key: key);

  @override
  ConsumerState<EquityrecentInvstment> createState() =>
      _EquityrecentInvstmentState();
}

class _EquityrecentInvstmentState extends ConsumerState<EquityrecentInvstment> {
  @override
  Widget build(BuildContext context) {
    var _userData = ref.watch(currentUserDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("equity portfolio"),
        elevation: 2,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection("Profiles")
                  .doc(_userData!.uid)
                  .collection("history")
                  .get(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  var data = snapshot.data!.docs;

                  return Expanded(
                    child: Container(
                        child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var docData = data[index].data() as Map;
                        DateTime dt =
                            (docData['boughton'] as Timestamp).toDate();
                        String formattedDate =
                            DateFormat("yyyy-MM-dd").format(dt);

                        return Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          height: 90,
                          width: SizeConfig.screenHeight,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "₹" + docData["price"].toString(),
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(formattedDate.toString()),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          height: 1,
                                          width: 50,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Container(
                                        width: 180,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            docData["equity"] ?? "unknown :(",
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Divider(thickness: 1.5)
                            ],
                          ),
                        );
                      },
                    )),
                  );
                } else {
                  return Text("You have no investments yet.");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
