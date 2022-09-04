import 'package:flutter/material.dart';

class RoundupsTile extends StatefulWidget {
  const RoundupsTile({super.key});

  @override
  State<RoundupsTile> createState() => _RoundupsTileState();
}

class _RoundupsTileState extends State<RoundupsTile> {
  bool normalRoundup = true;
  bool adaptiveRoundup = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15.0, top: 20),
          child: Text(
            "roundups",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Divider(
          endIndent: 280,
          indent: 16.0,
          thickness: 2,
          color: Colors.grey.withOpacity(0.4),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Standard Roundups",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400),
              ),
            ),
            const Spacer(),
            Checkbox(
              shape: const CircleBorder(),
              value: normalRoundup,
              onChanged: (bool? value) {
                setState(() {
                  normalRoundup = value!;
                });
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  "Roundup your spent amount to next nearest 10.",
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontSize: 16, color: Color(0xFF636363)),
                ),
              ),
              const SizedBox(width: 100)
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 25, bottom: 10),
              child: const Text(
                "Adaptive Spend Roundups",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400),
              ),
            ),
            const Spacer(),
            Checkbox(
                shape: const CircleBorder(),
                activeColor: Colors.blue,
                value: adaptiveRoundup,
                onChanged: (bool? value) {
                  setState(() {
                    adaptiveRoundup = value!;
                  });
                }),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 20),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  "Roundup your spent amount based on the size of amount. It helps you save even more!",
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontSize: 16, color: Color(0xFF636363)),
                ),
              ),
              const SizedBox(width: 90)
            ],
          ),
        ),
        const Divider(thickness: 9, color: Color.fromARGB(255, 240, 240, 240)),
      ],
    );
  }
}
