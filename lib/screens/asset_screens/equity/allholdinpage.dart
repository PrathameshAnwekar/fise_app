import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/user_data.dart';

class AllHoldingPage extends StatelessWidget {
  const AllHoldingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("holdings"),
      ),
      body: FutureBuilder(
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

            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var docData = data[index].data()! as Map;

                return ListTile(
                  title: Text(docData["name"]),
                );
              },
            );
          } else {
            return Text("You have no investments yet.");
          }
        },
      ),
    );
  }
}
