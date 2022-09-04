import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class AssetAllocationTile extends StatefulWidget {
  const AssetAllocationTile({super.key});

  @override
  State<AssetAllocationTile> createState() => _AssetAllocationTileState();
}

class _AssetAllocationTileState extends State<AssetAllocationTile> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
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
          padding:
              const EdgeInsets.only(top: 10, left: 15.0, bottom: 10, right: 15),
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
      ],
    );
  }
}
