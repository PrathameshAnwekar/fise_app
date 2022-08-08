import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/models/user_data.dart';
import 'package:fise_app/screens/settings/transactions/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Transactions_Page extends ConsumerStatefulWidget {
  const Transactions_Page({Key? key}) : super(key: key);

  @override
  ConsumerState<Transactions_Page> createState() => _Transactions_PageState();
}

class _Transactions_PageState extends ConsumerState<Transactions_Page> {
  @override
  Widget build(BuildContext context) {
    var userd = ref.read(currentUserDataProvider.state).state;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: null,
              iconSize: 5,
              icon: Image.asset(
                "assets/images/setting_icons/transactions.png",
                fit: BoxFit.contain,
              )),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.black26,
              height: 1.0,
            )),
        backgroundColor: Colors.white,
        title: Text(
          "transactions",
          style: AppThemeData.textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('transactions')
                    .doc('payments')
                    .collection('${userd!.uid}')
                    .get(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    print('length of docs' +
                        snapshot.data!.docs.length.toString());
                    var data = snapshot.data!.docs;
                    print((data[1].data()! as Map)['orderAmount']);
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        var docData = data[index].data()! as Map;
                        return TransactionsTile(
                            deductedFrom: docData['orderNote'],
                            debitDate: docData['txTime'] ?? 'Failed',
                            spent: docData['orderAmount'] ?? '0',
                            invested: docData['txStatus'] ?? '0');
                      },
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                    );
                  } else {
                    return Center(
                      child: Text('You have no transactions yet.'),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
