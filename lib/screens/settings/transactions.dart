import 'package:flutter/material.dart';

import '../../constants/app_theme.dart';

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
          Image.asset(
            "assets/images/setting_icons/transactions.png",
          )
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
        child: ListView(
          shrinkWrap: true,
          children: const [
            Transactions_tiles(
              deductedFrom: 'State Bank of India',
              spent: '20',
              debitedOn: '06 July 2022',
            ),
            Divider(thickness: 1),
            Transactions_tiles(
              deductedFrom: 'State Bank of India',
              spent: '20',
              debitedOn: '06 July 2022',
            ),
            Divider(thickness: 1),
            Transactions_tiles(
              deductedFrom: 'State Bank of India',
              spent: '20',
              debitedOn: '06 July 2022',
            ),
            Divider(thickness: 1),
            Transactions_tiles(
              deductedFrom: 'State Bank of India',
              spent: '20',
              debitedOn: '06 July 2022',
            ),
            Divider(thickness: 1),
            Transactions_tiles(
              deductedFrom: 'State Bank of India',
              spent: '20',
              debitedOn: '06 July 2022',
            ),
            Divider(thickness: 1),
            Transactions_tiles(
              deductedFrom: 'State Bank of India',
              spent: '20',
              debitedOn: '06 July 2022',
            ),
            Divider(thickness: 1),
            Transactions_tiles(
              deductedFrom: 'State Bank of India',
              spent: '20',
              debitedOn: '06 July 2022',
            ),
            Divider(thickness: 1),
            Transactions_tiles(
              deductedFrom: 'State Bank of India',
              spent: '20',
              debitedOn: '06 July 2022',
            ),
          ],
        ),
      ),
    );
  }
}

class Transactions_tiles extends StatelessWidget {
  const Transactions_tiles(
      {Key? key,
      required this.deductedFrom,
      required this.spent,
      required this.debitedOn})
      : super(key: key);

  final String deductedFrom;
  final String spent;
  final String debitedOn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      child: ListTile(
        title: Text(
          deductedFrom,
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Text("spent - ₹ " + spent),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '+25.02',
              style: AppThemeData.textTheme.titleMedium,
            ),
            Text(
              debitedOn,
              style: AppThemeData.textTheme.labelSmall,
            )
          ],
        ),
      ),
    );
  }
}
