// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../../../models/user_data.dart';

// class AllHoldingPage extends StatelessWidget {
//   const AllHoldingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("holdings"),
//       ),
//       body: FutureBuilder(
//         future: FirebaseFirestore.instance
//             .collection("Profiles")
//             .doc(userData?.uid)
//             .collection("basket")
//             .get(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasData) {
//             var data = snapshot.data!.docs;

//             return ListView.builder(
//               shrinkWrap: true,
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (context, index) {
//                 var docData = data[index].data()! as Map;

//                 return ListTile(
//                   title: Text(docData["name"]),
//                 );
//               },
//             );
//           } else {
//             return Text("You have no investments yet.");
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fise_app/models/user_data.dart';
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
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection("Profiles")
                  .doc(_userData!.uid)
                  .collection("basket")
                  .get(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  var data = snapshot.data!.docs;

                  return ListTile(
                    title: const Text(
                      "₹2341.12",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text("14 Jul 2022"),
                        Text("Reliance @ ₹2341.12"),
                      ],
                    ),
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
