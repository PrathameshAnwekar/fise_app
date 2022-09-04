import 'package:fise_app/util/sharedPrefs.dart';
import 'package:flutter/material.dart';

import '../../../constants/size_config.dart';

class MultiplierTile extends StatefulWidget {
  const MultiplierTile({super.key});

  @override
  State<MultiplierTile> createState() => _MultiplierTileState();
}

class _MultiplierTileState extends State<MultiplierTile> {
  int multiplierValue = UserSharedPrefs().getInt("multiplier") ?? 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15.0, top: 20),
          child: Text(
            "multiplier",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Divider(
          endIndent: 280,
          indent: 16.0,
          thickness: 2,
          color: Colors.grey.withOpacity(0.4),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 20, right: 15),
          child: Flexible(
            child: Text(
              "your roundups get multiplied by multiplier before getting added to roundup cart.",
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: 16, color: Color(0xFF636363)),
            ),
          ),
        ),
        //
        Slider(
          value: multiplierValue.toDouble(),
          min: 0,
          max: 10,
          divisions: 5,
          label: multiplierValue.round().toString() + "x",
          onChanged: (double NewValue) {
            setState(() {
              multiplierValue = NewValue.round();
              UserSharedPrefs().setInt("multiplier", multiplierValue);
            });
          },
        ),
        Row(
          children: [
            SizedBox(width: SizeConfig.screenWidth * 0.05),
            const Text("0x"),
            SizedBox(width: SizeConfig.screenWidth * 0.13),
            const Text("2x"),
            SizedBox(width: SizeConfig.screenWidth * 0.13),
            const Text("4x"),
            SizedBox(width: SizeConfig.screenWidth * 0.13),
            const Text("6x"),
            SizedBox(width: SizeConfig.screenWidth * 0.13),
            const Text("8x"),
            SizedBox(width: SizeConfig.screenWidth * 0.13),
            const Text("10x"),
          ],
        ),
        //
        //
        const SizedBox(height: 30),

        const Divider(thickness: 9, color: Color.fromARGB(255, 240, 240, 240)),
      ],
    );
  }
}
