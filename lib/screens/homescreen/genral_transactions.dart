import 'package:flutter/material.dart';
import '../../constants/size_config.dart';
import '../settings/transactions/transaction_tile.dart';

class GeneralTransactions extends StatelessWidget {
  const GeneralTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        const TransactionsTile(
            invested: "16",
            deductedFrom: "State Bank of India",
            spent: "32",
            debitDate: "14 Jun 22"),
        const TransactionsTile(
            invested: "16",
            deductedFrom: "State Bank of India",
            spent: "32",
            debitDate: "14 Jun 22"),
        const TransactionsTile(
            invested: "16",
            deductedFrom: "State Bank of India",
            spent: "32",
            debitDate: "14 Jun 22"),
        const TransactionsTile(
            invested: "16",
            deductedFrom: "State Bank of India",
            spent: "32",
            debitDate: "14 Jun 22"),
        ListTile(
          title: const Text(
            "Invested",
            style: TextStyle(fontSize: 22),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("₹ 1000"),
              Text("10 Jun 22"),
            ],
          ),
        ),
      ],
    );
  }
}
