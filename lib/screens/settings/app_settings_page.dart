import 'package:fise_app/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class AppsettingsPage extends StatefulWidget {
  const AppsettingsPage({Key? key}) : super(key: key);

  @override
  State<AppsettingsPage> createState() => _AppsettingsPageState();
}

class _AppsettingsPageState extends State<AppsettingsPage> {
  bool normalRoundup = true;
  bool adaptiveRoundup = false;
  bool dailySavings = true;
  int multiplierValue = 2;

  Map<String, double> dataMap = {
    "MUTUAL FUND": 30.0,
    "US STOCKS": 5.0,
    "CRYPTO": 5.0,
    "GOLD": 15.0,
    "EQUITY": 20.0,
    "BONDS": 20.0,
  };

  List<Color> colorList = [
    const Color(0xFFDA4C62),
    const Color(0xFFE7DED4),
    const Color(0xFF7698A0),
    const Color(0xFFECC44D),
    const Color(0xFFA0D0C8),
    const Color(0xFF3B3D50),
  ];

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
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400),
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
                  padding:
                      const EdgeInsets.only(left: 15.0, top: 25, bottom: 10),
                  child: const Text(
                    "Adaptive Spend Roundups",
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400),
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
            const Divider(
                thickness: 9, color: Color.fromARGB(255, 240, 240, 240)),
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

            const Divider(
                thickness: 9, color: Color.fromARGB(255, 240, 240, 240)),
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
              padding: const EdgeInsets.only(
                  top: 10, left: 15.0, bottom: 10, right: 15),
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
            const Divider(
                thickness: 9, color: Color.fromARGB(255, 240, 240, 240)),
//
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: const Text(
                "asset allocation",
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
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 15.0, bottom: 10, right: 15),
              child: Flexible(
                child: Text(
                  "adjust individual allocation% of roundups in assets.",
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontSize: 16, color: Color(0xFF636363)),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              child: PieChart(
                dataMap: dataMap,
                colorList: colorList,
                chartRadius: 191,
                chartValuesOptions: ChartValuesOptions(
                  showChartValuesOutside: true,
                  showChartValuesInPercentage: true,
                ),
                legendOptions: LegendOptions(showLegends: false),
              ),
            ),

            assetTile(
              asset: "GOLD",
              allocatedPercentage: "20",
              containerColor: Color(0xFFECC44D),
            ),
            assetTile(
              asset: "EQUITY",
              allocatedPercentage: "80",
              containerColor: Color(0xFFA0D0C8),
            ),
            assetTile(
              asset: "MUTUAL FUND",
              allocatedPercentage: "0",
              containerColor: Color(0xFFDA4C62),
            ),
            assetTile(
              asset: "BONDS",
              allocatedPercentage: "0",
              containerColor: Color(0xFF3B3D50),
            ),
            assetTile(
              asset: "US STOCKS",
              allocatedPercentage: "0",
              containerColor: Color(0xFFE7DED4),
            ),
            assetTile(
              asset: "CRYPTO",
              allocatedPercentage: "0",
              containerColor: Color(0xFF7698A0),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "To know more about roundups, multiplier, daily savings or asset allocation, head towards FAQ.",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF636363),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class assetTile extends StatelessWidget {
  const assetTile({
    Key? key,
    required this.asset,
    required this.allocatedPercentage,
    required this.containerColor,
  }) : super(key: key);
  final String asset;
  final String allocatedPercentage;
  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(
            color: containerColor,
          ),
        ),
        child: Row(
          children: [
            Text(
              asset,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF636363)),
            ),
            const Spacer(),
            Text(
              allocatedPercentage + "%",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xFF636363),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
