import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fise_app/models/user_data.dart';
import 'package:fise_app/screens/asset_screens/equity/holdindtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllHoldingPage extends ConsumerStatefulWidget {
  const AllHoldingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AllHoldingPage> createState() => _AllHoldingPageState();
}

class _AllHoldingPageState extends ConsumerState<AllHoldingPage> {
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
          Expanded(
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
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var docData = data[index].data()! as Map;

                        return Holdings(
                          equity: docData["name"],
                          shares: docData["bought"].toString(),
                          avgBuyPrice: docData["price"].toString(),
                        );
                      },
                    ),
                  ));
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
