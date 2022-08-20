import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants/size_config.dart';
import '../../models/user_data.dart';
import '../settings/transactions/transaction_tile.dart';

class GeneralTransactions extends ConsumerStatefulWidget {
  const GeneralTransactions({Key? key}) : super(key: key);

  @override
  ConsumerState<GeneralTransactions> createState() =>
      _GeneralTransactionsState();
}

class _GeneralTransactionsState extends ConsumerState<GeneralTransactions> {
  @override
  Widget build(BuildContext context) {
    var userd = ref.read(currentUserDataProvider.state).state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 8),
          child: Text(
            "recent transactions",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(22.0, 0, 0, 15),
          child: Container(
            height: 2,
            color: Colors.grey.withOpacity(0.5),
            width: SizeConfig.screenWidth * 0.58,
          ),
        ),
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
              var data = snapshot.data!.docs;

              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var docData = data[index].data()! as Map;
                    return TransactionsTile(
                      deductedFrom: docData['orderNote'],
                      debitDate: docData['txTime'] ?? 'Failed',
                      spent: docData['orderAmount'] ?? '0',
                      invested: docData['txStatus'] ?? '0',
                    );
                  },
                ),
              );
            } else {
              return Text("You have no transactions yet.");
            }
          },
        ),
      ],
    );
  }
}
