import 'package:fise_app/constants/constants.dart';
import 'package:flutter/material.dart';

class TransactionsTile extends StatelessWidget {
  const TransactionsTile(
      {Key? key,
      required this.invested,
      required this.deductedFrom,
      required this.spent,
      required this.debitDate})
      : super(key: key);

  final String deductedFrom;
  final String spent;
  final String debitDate;
  final String invested;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: Column(
        children: [
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            dense: true,
            title: Text(
              deductedFrom,
              style: const TextStyle(fontSize: 20),
            ),
            subtitle: Text(spent),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  invested,
                  style: AppThemeData.textTheme.titleMedium,
                ),
                Text(
                  debitDate,
                  style: AppThemeData.textTheme.labelSmall,
                )
              ],
            ),
          ),
          Divider(thickness: 1),
        ],
      ),
    );
  }
}
