import 'package:auto_size_text/auto_size_text.dart';
import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/screens/homescreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../stock_data.dart';
import 'asset_returns_widget.dart';

class Equitypage extends StatelessWidget {
  static const routeName = 'Equitypage';

  const Equitypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverCustomHeaderDelegate(
              title: 'equity',
              collapsedHeight: 50,
              expandedHeight: 440,
              paddingTop: MediaQuery.of(context).padding.top,
            ),
          ),
          SliverToBoxAdapter(
            child: FillContent(),
          )
        ],
      ),
    );
  }
}

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final String title;

  SliverCustomHeaderDelegate({
    required this.collapsedHeight,
    required this.expandedHeight,
    required this.paddingTop,
    required this.title,
  });

  @override
  double get minExtent => collapsedHeight + paddingTop;

  @override
  double get maxExtent => expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    return Colors.white;
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha =
          (shrinkOffset / (maxExtent - minExtent) * 255).clamp(0, 255).toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: maxExtent,
      width: MediaQuery.of(context).size.width,
      color: AppThemeData.lightColorScheme.primary,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: AppThemeData.lightColorScheme.primary,
              child: SafeArea(
                bottom: false,
                child: SizedBox(
                  height: collapsedHeight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            //
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: ((context) {
                              return HomeScreen();
                            })));
                          },
                          icon: const FaIcon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
//
          Positioned(
            top: 100,
            child: Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.4,
              decoration: BoxDecoration(
                color: AppThemeData.lightColorScheme.primary,
              ),
              child: const EquityHeadder(),
            ),
          ),

//
          //savings
        ],
      ),
    );
  }
}

class FillContent extends StatelessWidget {
  const FillContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 20,
          width: MediaQuery.of(context).size.width,
          color: AppThemeData.lightColorScheme.primary,
          child: Container(
            height: 20,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Divider(
                endIndent: 150,
                indent: 150,
                thickness: 4,
                color: Colors.black.withOpacity(0.5)),
          ),
        ),
        EquityCart(),
        const SizedBox(height: 14),
        const Divider(thickness: 7, color: Color.fromARGB(255, 212, 211, 211)),
        const Padding(
          padding: EdgeInsets.fromLTRB(22.0, 20, 0, 7.5),
          child: Text(
            "holdings",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(22.0, 0, 0, 22),
          child: Container(
            height: 2,
            color: Colors.grey.withOpacity(0.5),
            width: SizeConfig.screenWidth * 0.3,
          ),
        ),
        Holdings(),
        const SizedBox(height: 14),
        Holdings(),
        const SizedBox(height: 14),
        Holdings(),
        const SizedBox(height: 14),
        Holdings(),
        const SizedBox(height: 17),
        const Divider(thickness: 7, color: Color.fromARGB(255, 212, 211, 211)),
        const Padding(
          padding: EdgeInsets.fromLTRB(22.0, 20, 0, 7.5),
          child: Text(
            "recent investments(in equity)",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(22.0, 0, 0, 22),
          child: Container(
            height: 2,
            color: Colors.grey.withOpacity(0.5),
            width: SizeConfig.screenWidth * 0.4,
          ),
        ),
        RecentIvestments(),
        const Divider(),
        RecentIvestments(),
        const Divider(),
        RecentIvestments(),
        const Divider(),
        RecentIvestments(),
        const Divider(),
      ],
    );
  }
}

class EquityHeadder extends StatelessWidget {
  const EquityHeadder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.4,
          decoration: BoxDecoration(
            color: AppThemeData.lightColorScheme.primary,
          ),
          child: const StockReturnsWidget(
            title: 'equity',
            assetImage: 'assets/images/financialAssets/gold.png',
          ),
        ),
      ],
    );
  }
}

class StockReturnsWidget extends StatelessWidget {
  const StockReturnsWidget({
    Key? key,
    required this.title,
    required this.assetImage,
  }) : super(key: key);

  final String title;
  final String assetImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: SizeConfig.screenWidth,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: SizeConfig.screenWidth * 0.20,
          child: Image.asset(assetImage),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.1,
          child: Row(
            children: [
              const Expanded(
                flex: 1,
                child: Center(
                  child: AutoSizeText.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Total Value\n\n',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w100),
                      ),
                      TextSpan(
                          text: '\u20B9 1,00,000',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                width: 1,
                height: SizeConfig.screenHeight * 0.08,
                color: Colors.white,
              ),
              const Expanded(
                flex: 1,
                child: Center(
                  child: AutoSizeText.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Total Value\n\n',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w100),
                      ),
                      TextSpan(
                          text: '\u20B9 1,00,000',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.05,
        ),
        AutoSizeText.rich(
          TextSpan(children: [
            const TextSpan(
              text: 'allocating ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const TextSpan(
              text: '20% ',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'of your roundups in ${title}',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ]),
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: Container(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return StockDataScreen();
                    }));
                  },
                  child: Text('Invest More',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w100)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 255, 187, 0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )))),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return StockDataScreen();
                    }));
                  },
                  child: Text('Edit Basket',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w100)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.white.withOpacity(0.5)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )))),
            )
          ],
        ),
      ],
    );
  }
}

class EquityCart extends StatelessWidget {
  const EquityCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Row(
            children: const [
              Text(
                "equity cart",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Icon(Icons.info_outline)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(22.0, 0, 0, 15),
          child: Container(
            height: 2,
            color: Colors.grey.withOpacity(0.5),
            width: SizeConfig.screenWidth * 0.4,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 4),
          child: Text(
            "₹50 / ₹2500",
            style: TextStyle(fontSize: 30),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: LinearPercentIndicator(
              barRadius: const Radius.circular(16),
              width: SizeConfig.screenWidth * 0.9,
              lineHeight: 20.0,
              percent: 0.05,
              backgroundColor:
                  AppThemeData.lightColorScheme.primary.withOpacity(0.1),
              progressColor: AppThemeData.lightColorScheme.primary,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "next stock: ",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "HDFC",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
          ],
        ),
      ],
    );
  }
}

class Holdings extends StatelessWidget {
  const Holdings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 120,
            width: SizeConfig.screenWidth * 0.9,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 241, 240, 240),
              borderRadius: BorderRadius.all(
                Radius.circular(11),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("HDFC",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                      const SizedBox(width: 7),
                      Text(
                        "^3.75%",
                        style: TextStyle(
                            color: AppThemeData.lightColorScheme.primary),
                      ),
                      const Spacer(),
                      Text("Wt: 50%")
                    ],
                  ),
                ),
                LinearPercentIndicator(
                  barRadius: const Radius.circular(16),
                  width: SizeConfig.screenWidth * 0.9,
                  lineHeight: 10.0,
                  percent: 0.75,
                  backgroundColor:
                      AppThemeData.lightColorScheme.primary.withOpacity(0.1),
                  progressColor: AppThemeData.lightColorScheme.primary,
                ),
                const SizedBox(height: 15),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text("₹1397.1",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          Text("Current Price",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5)))
                        ],
                      ),
                      VerticalDivider(),
                      Column(
                        children: [
                          Text("5",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          Text("Shares",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5)))
                        ],
                      ),
                      VerticalDivider(),
                      Column(
                        children: [
                          Text("₹1200.4",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          Text("Avg Buy Price",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5)))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecentIvestments extends StatelessWidget {
  const RecentIvestments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        "₹2341.12",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text("14 Jul 2022"),
          Text("Reliance @ ₹2341.12"),
        ],
      ),
    );
  }
}
