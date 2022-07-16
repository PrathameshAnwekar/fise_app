import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/screens/settings/transactions/transaction_tile.dart';
import 'package:flutter/material.dart';

class Transactions_Page extends StatefulWidget {
  const Transactions_Page({Key? key}) : super(key: key);

  @override
  State<Transactions_Page> createState() => _Transactions_PageState();
}

class _Transactions_PageState extends State<Transactions_Page> {
  @override
  Widget build(BuildContext context) {
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
          children: const [
            TransactionsTile(
              invested: '13',
              deductedFrom: 'State Bank of India',
              spent: '20',
              debitDate: '06 July 2022',
            ),
            TransactionsTile(
              deductedFrom: 'State Bank of India',
              invested: '13',
              spent: '20',
              debitDate: '06 July 2022',
            ),
            TransactionsTile(
              deductedFrom: 'State Bank of India',
              invested: '13',
              spent: '20',
              debitDate: '06 July 2022',
            ),
            TransactionsTile(
              deductedFrom: 'State Bank of India',
              invested: '13',
              spent: '20',
              debitDate: '06 July 2022',
            ),
            TransactionsTile(
              deductedFrom: 'State Bank of India',
              invested: '13',
              spent: '20',
              debitDate: '06 July 2022',
            ),
            TransactionsTile(
              deductedFrom: 'State Bank of India',
              invested: '13',
              spent: '20',
              debitDate: '06 July 2022',
            ),
            TransactionsTile(
              deductedFrom: 'State Bank of India',
              invested: '13',
              spent: '20',
              debitDate: '06 July 2022',
            ),
            TransactionsTile(
              deductedFrom: 'State Bank of India',
              invested: '13',
              spent: '20',
              debitDate: '06 July 2022',
            ),
          ],
        ),
      ),
    );
  }
}
