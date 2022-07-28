import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const SMSTestPage());
}

class SMSTestPage extends StatefulWidget {
  const SMSTestPage({Key? key}) : super(key: key);

  @override
  State<SMSTestPage> createState() => _SMSTestPageState();
}

class _SMSTestPageState extends State<SMSTestPage> {
  final SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = [];

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
            var permission = await Permission.sms.status;
            if (permission.isGranted) {
              final messages = await _query.querySms(
                  kinds: [SmsQueryKind.inbox], sort: true, count: 100);

              messages.retainWhere((e) {
                var sbi = e.sender!.contains('SBI');
                var hdfc = e.sender!.contains('HDFC');
                var kotak = e.sender!.contains('KOTAK');
                var icici = e.sender!.contains('ICICI');
                var axis = e.sender!.contains('AXIS');
                return (sbi || hdfc || kotak || icici || axis) 
                // &&
                //     e.date!.isAfter(DateTime(DateTime.now().year,
                //         DateTime.now().month, DateTime.now().day))
                        ;
              });
              debugPrint('sms inbox messages: ${messages.length}');
              messages.forEach((e) {
                print(e.body! + DateTime.parse(e.date.toString()).toString());
              });
              var rslist = [];
              messages.forEach((e) {
                RegExp exp = RegExp(
                    r'[0-9]*\.[0-9]+');

                Iterable<Match> matches = exp.allMatches(e.body!);
                for (final Match m in matches) {
                  String match = m[0]!;
                  print(match);
                }
              });

              setState(() {
                _messages = messages;
              });
            } else {
              await Permission.sms.request();
            }
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
