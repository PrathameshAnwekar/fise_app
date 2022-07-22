import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TableCalendar(
        focusedDay: DateTime.utc(2022, 07, 09),
        firstDay: DateTime.utc(2010, 10, 20),
        lastDay: DateTime.utc(2040, 10, 20),
      ),
      const Padding(
        padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: Text(
          "spend today to continue your 10 days Saving streak or you can click on Invest More to continue the streak",
          overflow: TextOverflow.clip,
        ),
      ),
    ]);
  }
}
