import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fise_app/screens/asset_screens/equity/allholdinpage.dart';
import 'package:flutter/material.dart';

import '../../../constants/size_config.dart';
import '../../../models/user_data.dart';

class HoldingTile extends StatefulWidget {
  const HoldingTile({super.key});

  @override
  State<HoldingTile> createState() => _HoldingTileState();
}

class _HoldingTileState extends State<HoldingTile> {
  // String stockname = FirebaseFirestore.instance.collection("Profiles").doc(userData?.uid).collection("basket").doc()
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(22.0, 0, 0, 7.5),
            child: Row(
              children: [
                Text(
                  "holdings",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                OutlinedButton(
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
                    child: Text("  view all  "))
              ],
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
                  .doc(userData?.uid)
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
                    color: Colors.lightGreenAccent,
                    // height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      // itemCount: 2,
                      itemBuilder: (context, index) {
                        var docData = data[index].data()! as Map;

                        return ListTile(
                          title: docData["name"],
                        );
                      },
                    ),
                  ));
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
