import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class RecentIvestments extends ConsumerStatefulWidget {
  const RecentIvestments({Key? key}) : super(key: key);

  @override
  ConsumerState<RecentIvestments> createState() => _RecentIvestmentsState();
}

class _RecentIvestmentsState extends ConsumerState<RecentIvestments> {
  @override
  Widget build(BuildContext context) {
    var _userData = ref.watch(currentUserDataProvider);

    return Container(
      height: 220,
      child: Column(
        children: [
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
                                      Text(docData["equity"] ?? "unknown :("),
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
          )
        ],
      ),
    );
  }
}

// ListTile(
//       title: const Text(
//         "₹2341.12",
//         style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
//       ),
//       trailing: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: const [
//           Text("14 Jul 2022"),
//           Text("Reliance @ ₹2341.12"),
//         ],
//       ),
//     );