import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/models/user_data.dart';
import 'package:fise_app/screens/asset_screens/assetclass_page.dart';
import 'package:fise_app/screens/asset_screens/gold/investmore_gold.dart';
import 'package:fise_app/screens/homescreen/calender.dart';
import 'package:fise_app/screens/homescreen/genral_roundups.dart';
import 'package:fise_app/screens/homescreen/genral_transactions.dart';
import 'package:fise_app/screens/settings/settings_page.dart';
import 'package:fise_app/screens/settings/transactions/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../asset_screens/equity/equity_page.dart';
import 'general_returns_widget.dart';
import 'general_status_widget.dart';

var username;

class Homescreen extends ConsumerStatefulWidget {
  static const routeName = 'homepage';

  const Homescreen({Key? key}) : super(key: key);

  @override
  ConsumerState<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<Homescreen> {
  @override
  Widget build(BuildContext context) {
    username =
        ref.read(currentUserDataProvider.state).state?.username.split(' ')[0];
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //   INVEST MORE =>
        },
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          "Invest More",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppThemeData.lightColorScheme.primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverCustomHeaderDelegate(
              title: "",
              collapsedHeight: 50,
              expandedHeight: SizeConfig.screenHeight * 0.38,
              paddingTop: MediaQuery.of(context).padding.top,
            ),
          ),
          const SliverToBoxAdapter(
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
              color: makeStickyHeaderBgColor(shrinkOffset),
              child: SafeArea(
                bottom: false,
                child: SizedBox(
                  height: collapsedHeight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text.rich(TextSpan(children: [
                          const TextSpan(
                              text: "hey ", style: TextStyle(fontSize: 25)),
                          TextSpan(
                              text: username.toString(),
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold))
                        ])),
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            //
                            Navigator.push(context,
                                MaterialPageRoute(builder: ((context) {
                              return SettingsPage();
                            })));
                          },
                          icon: const FaIcon(FontAwesomeIcons.circleUser,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
//
//
          //savings
          const Positioned(top: 110, left: 20, child: GeneralStatusWidget()),
          //current value
          const Positioned(top: 140, right: 0, child: GeneralReturnsWidget()),
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

        //
        FinancialAssetTile(
          title: 'Gold',
          routeLink: () {
            Navigator.push(context, MaterialPageRoute(builder: ((context) {
              return const FinancialAssetPage();
              // return const FinancialAssetPage(title: "Gold");
            })));
          },
          imgRoute: 'assets/images/financialAssets/gold.png',
        ),
        const Divider(thickness: 2),
        FinancialAssetTile(
          title: 'Equity',
          routeLink: () {
            Navigator.push(context, MaterialPageRoute(builder: ((context) {
              return const Equitypage();
            })));
          },
          imgRoute: 'assets/images/financialAssets/gold.png',
        ),
        const Divider(thickness: 2),
        FinancialAssetTile(
          title: 'Crypto',
          routeLink: () {},
          imgRoute: 'assets/images/financialAssets/gold.png',
        ),
        const Divider(thickness: 7, color: Color.fromARGB(255, 212, 211, 211)),
        const Calender(),
        const Divider(thickness: 7, color: Color.fromARGB(255, 212, 211, 211)),
        const GenralRoundups(),
        const SizedBox(height: 20),
        const Divider(thickness: 7, color: Color.fromARGB(255, 212, 211, 211)),
        const GeneralTransactions(),
        const SizedBox(height: 100),
      ],
    );
  }
}

class FinancialAssetTile extends StatelessWidget {
  const FinancialAssetTile({
    Key? key,
    required this.title,
    required this.routeLink,
    required this.imgRoute,
  }) : super(key: key);
  final String title;
  final String imgRoute;
  final VoidCallback routeLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      child: ListTile(
        onTap: routeLink,
        title: Text(title),
        subtitle: const Text('Invested 700.29'),
        // leading: const Icon(
        //   Icons.monetization_on_outlined,
        //   size: 50,
        // ),
        leading: Image(image: AssetImage(imgRoute)),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '+25.02',
              style: AppThemeData.textTheme.labelSmall,
            ),
            Text(
              '+2.3%',
              style: AppThemeData.textTheme.labelSmall,
            )
          ],
        ),
      ),
    );
  }
}
