import 'package:fise_app/constants/constants.dart';
import 'package:flutter/material.dart';

class AppsettingsPage extends StatefulWidget {
  const AppsettingsPage({Key? key}) : super(key: key);

  @override
  State<AppsettingsPage> createState() => _AppsettingsPageState();
}

class _AppsettingsPageState extends State<AppsettingsPage> {
  bool normalRoundup = true;
  bool adaptiveRoundup = false;
  int multiplierValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        //
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.black26,
              height: 1.0,
            )),
        backgroundColor: Colors.white,
        title: const Text(
          "app settings",
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          Image.asset(
            "assets/images/setting_icons/App_settings.png",
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "Roundups",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                    shape: const CircleBorder(),
                    value: normalRoundup,
                    onChanged: (bool? value) {
                      setState(() {
                        normalRoundup = value!;
                      });
                    }),
                const Text("Normal Roundups"),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      //
                    },
                    icon: const Icon(Icons.info_outline))
              ],
            ),

            Row(
              children: [
                Checkbox(
                    shape: const CircleBorder(),
                    activeColor: Colors.blue,
                    value: adaptiveRoundup,
                    onChanged: (bool? value) {
                      setState(() {
                        adaptiveRoundup = value!;
                      });
                    }),
                const Text("Adaptive Spend Roundups"),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      //
                    },
                    icon: const Icon(Icons.info_outline))
              ],
            ),
            const Divider(
                thickness: 9, color: Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "Multiplier",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 20),
            //
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
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Daily fixed amount option",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Divider(
                thickness: 9, color: Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  const Text(
                    "Asset Allocation",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.info_outline)),
                ],
              ),
            ),
            // const SizedBox(height: 80),
//
//     COLOR PALETTE FROM FIGMA HERE
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 40),
              child: Image.asset(
                  "assets/images/setting_icons/appSettings_ColorCode.png"),
            ),
//
            assetTile(
                asset: "Equity",
                allocatedPercentage: "20",
                colour: Colors.yellow),
            assetTile(
                asset: "Gold",
                allocatedPercentage: "20",
                colour: Colors.orange),
            assetTile(
                asset: "Bonds",
                allocatedPercentage: "0",
                colour: Colors.greenAccent),
            assetTile(
                asset: "Mutual Fund",
                allocatedPercentage: "20",
                colour: Colors.blue),
            assetTile(
                asset: "Crypto",
                allocatedPercentage: "20",
                colour: Colors.purple),
            assetTile(
                asset: "US Stocks",
                allocatedPercentage: "20",
                colour: Colors.red),
          ],
        ),
      ),
    );
  }
}

class assetTile extends StatelessWidget {
  const assetTile(
      {Key? key,
      required this.asset,
      required this.allocatedPercentage,
      required this.colour})
      : super(key: key);
  final String asset;
  final String allocatedPercentage;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15),
      child: Row(
        children: [
          Text(asset),
          const Spacer(),
          Text(allocatedPercentage + "%"),
          const SizedBox(width: 10),
          Container(
            height: 20,
            width: 20,
            color: colour,
          ),
        ],
      ),
    );
  }
}
