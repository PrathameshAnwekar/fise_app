import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:permission_handler/permission_handler.dart';

final SmsQuery _query = SmsQuery();

List<SmsMessage> _messages = [];

class SMSTestPage extends StatefulWidget {
  const SMSTestPage({Key? key}) : super(key: key);

  @override
  State<SMSTestPage> createState() => _SMSTestPageState();
}

class _SMSTestPageState extends State<SMSTestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _messages.length,
            itemBuilder: (BuildContext context, int i) {
              var message = _messages[i];

              return ListTile(
                title: Text('${message.sender} [${message.date}]'),
                subtitle: Text('${message.body}'),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await todaysRoundUp();
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}

Future<int> todaysRoundUp() async {
  var permission = await Permission.sms.status;
  if (permission.isGranted) {
    final messages = await _query
        .querySms(kinds: [SmsQueryKind.inbox], sort: true, count: 100);
    ////FILTER FOR GETTING SMS FROM BANKS ACCORDING TO SENDERS NAMES
    messages.retainWhere((e) {
      bool bank = false;
      for (int i = 0; i < banks.length; i++) {
        bank = bank || e.sender!.contains(banks[i]);
      }
      return (bank) &&
          e.date!.isAfter(DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 2));
    });
    debugPrint('sms inbox messages: ${messages.length}');
    messages.forEach((e) {
      // print(e.body! + DateTime.parse(e.date.toString()).toString());
    });
    var amount = 0;
    ////FINDING DEBIT AMOUNT IN EACH SMS
    messages.forEach((e) {
      RegExp exp = RegExp(r'[0-9]*\.[0-9]+');
      Iterable<Match> matches = exp.allMatches(e.body!);
      for (final Match m in matches) {
        String match = m[0]!;
        // print(match);
        ///BUG DUE TO FILTERING, FIXED USING BELOW CONDITION
        if (double.parse(match) < 1) continue;
        var x = 10 - (double.parse(match).toInt() % 10);
        // debugPrint('indi amount is ' + amount.toString());
        amount += x == 0 ? 10 : x;
      }
    });
    debugPrint('the amount is ' + amount.toString());
    return amount;
  } else {
    await Permission.sms.request();
    return 0;
  }
}

List<String> banks = [
  ' HDFC',
  'INDUS',
  'ICICI',
  'SBI',
  'PNB',
  'YES',
  'RBL',
  'OBC',
  'UCO',
  'UNION',
  'TNBL',
  'TJSB',
  'PSBANK',
  "PAYTMB",
  'HSBC',
  'AMEX',
  'ONECRD',
  'AXIS',
  'DENA',
  'BOB',
  'KOTAK',
  'CENT'
];
