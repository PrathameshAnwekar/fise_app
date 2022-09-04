import 'package:auto_size_text/auto_size_text.dart';
import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/screens/asset_screens/asset_returns_widget.dart';
import 'package:fise_app/screens/asset_screens/equity/basket_search.dart';
import 'package:fise_app/screens/homescreen/genral_transactions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../settings/settings_page.dart';

// import '../settings/settings_page.dart';

// class FinancialAssetPage extends StatefulWidget {
//   const FinancialAssetPage({Key? key, required this.title}) : super(key: key);
//   final String title;
//   @override
//   State<FinancialAssetPage> createState() => _FinancialAssetPageState();
// }

// class _FinancialAssetPageState extends State<FinancialAssetPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         title: AutoSizeText(
//           widget.title,
//           style: const TextStyle(
//               color: Colors.white, fontSize: 25, fontWeight: FontWeight.w100),
//         ),
//         backgroundColor: AppThemeData.lightColorScheme.primary,
//       ),

//       // body: Stack(
//       //   children: [
//       //     Container(
//       //       width: SizeConfig.screenWidth,
//       //       height: SizeConfig.screenHeight * 0.4,
//       //       decoration: BoxDecoration(
//       //         color: AppThemeData.lightColorScheme.primary,
//       //       ),
//       //       child: const AssetReturnsWidget(
//       //         title: 'gold',
//       //         assetImage: 'assets/images/financialAssets/gold.png',
//       //       ),
//       //     ),
//       //   ],
//       // ),

//       backgroundColor: AppThemeData.lightColorScheme.primary,
//       body: Column(children: [
//         Container(
//           width: SizeConfig.screenWidth,
//           height: SizeConfig.screenHeight * 0.4,
//           decoration: BoxDecoration(
//             color: AppThemeData.lightColorScheme.primary,
//           ),
//           child: AssetReturnsWidget(
//             title: widget.title,
//             assetImage: 'assets/images/financialAssets/gold.png',
//           ),
//         ),
//         Expanded(
//             child: Container(
//           decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20), topRight: Radius.circular(20)),
//               color: Colors.white),
//           child: const SingleChildScrollView(
//               // margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.4),
//               child: GeneralTransactions()),
//         ))
//       ]),
//       floatingActionButton: widget.title == 'Equity'
//           ? FloatingActionButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => BasketSearchScreen(),
//                   ),
//                 );
//               },
//               child: Icon(Icons.add),
//             )
//           : null,
//     );
//   }
// }

class FinancialAssetPage extends StatefulWidget {
  static const routeName = 'homepage';

  const FinancialAssetPage({Key? key}) : super(key: key);

  @override
  State<FinancialAssetPage> createState() => _FinancialAssetPageState();
}

class _FinancialAssetPageState extends State<FinancialAssetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverCustomHeaderDelegate(
              title: "Gold",
              collapsedHeight: 50,
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
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
    final int alpha =
        (shrinkOffset / (maxExtent - minExtent) * 255).clamp(0, 255).toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
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
      color: AppThemeData.lightColorScheme.primary,
      height: maxExtent,
      child: Stack(
        fit: StackFit.expand,
        children: [
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
                            Navigator.pop(context);
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
          Positioned(
            top: 80,
            child: Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.4,
              decoration: BoxDecoration(
                color: AppThemeData.lightColorScheme.primary,
              ),
              child: AssetReturnsWidget(
                title: 'gold',
                assetImage: 'assets/images/financialAssets/gold.png',
              ),
            ),
          ),
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
        GeneralTransactions()
      ],
    );
  }
}
