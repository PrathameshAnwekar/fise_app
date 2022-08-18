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
<<<<<<< HEAD
    return Column(
      children: [
        ListTile(
          visualDensity: VisualDensity(horizontal: 0, vertical: -1),
          title: Text(
            deductedFrom,
            style: const TextStyle(fontSize: 20),
=======
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Column(
        children: [
          ListTile(
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
>>>>>>> origin/main
          ),
          subtitle: Text("spent - ₹ " + spent),
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
    );
  }
}
