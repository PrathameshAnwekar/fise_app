import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_theme.dart';

class dailySavingsTile extends StatefulWidget {
  const dailySavingsTile({super.key});

  @override
  State<dailySavingsTile> createState() => _dailySavingsTileState();
}

class _dailySavingsTileState extends State<dailySavingsTile> {
  bool dailySavings = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            children: [
              const Text(
                "daily savings",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  activeColor: AppThemeData.lightColorScheme.primary,
                  value: dailySavings,
                  onChanged: (bool value) {
                    setState(() {
                      dailySavings = !dailySavings;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Divider(
          endIndent: 280,
          indent: 16.0,
          thickness: 2,
          color: Colors.grey.withOpacity(0.4),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 15.0, bottom: 10, right: 15),
          child: Flexible(
            child: Text(
              "if there is nothing spent on a particular day this amount gets automatically deducted and added to roundup cart.",
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: 16, color: Color(0xFF636363)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              border: Border.all(
                color: Color(0xFF636363),
              ),
            ),
            child: Row(children: [
              Text("daily savings amount :",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF636363),
                    fontWeight: FontWeight.w500,
                  )),
              const Spacer(),
              Text("₹ 20",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF636363),
                    fontWeight: FontWeight.w500,
                  )),
            ]),
          ),
        ),
        const Divider(thickness: 9, color: Color.fromARGB(255, 240, 240, 240)),
      ],
    );
  }
}
