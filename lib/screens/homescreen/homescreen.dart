import 'package:fise_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import '../settings/settings_page.dart';
import 'assetclass_page.dart';
import 'general_returns_widget.dart';
import 'general_status_widget.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
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
              title: 'Akshat',
              collapsedHeight: 50,
              expandedHeight: 310,
              paddingTop: MediaQuery.of(context).padding.top,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: SingleChildScrollView(child: FilmContent()),
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
                        const Text("hey  ", style: TextStyle(fontSize: 25)),
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

class FilmContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Stack(children: [
          Container(
            height: 20,
            width: SizeConfig.screenWidth,
            color: AppThemeData.lightColorScheme.primary,
          ),
          Container(
            height: 20,
            width: SizeConfig.screenWidth,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: const Center(
              child: Divider(
                indent: 150,
                endIndent: 150,
                thickness: 3,
                color: Colors.grey,
              ),
            ),
          ),
        ]),
        FinancialAssetTile(),
        Divider(
          thickness: 2,
        ),
        FinancialAssetTile(),
        Divider(
          thickness: 2,
        ),
        FinancialAssetTile(),
        Divider(
          thickness: 2,
        ),
        FinancialAssetTile(),
        Divider(
          thickness: 2,
        ),
        FinancialAssetTile(),
        Divider(
          thickness: 2,
        ),
        Container(
          child: Flexible(
            child: TableCalendar(
              focusedDay: DateTime.utc(2022, 07, 09),
              firstDay: DateTime.utc(2010, 10, 20),
              lastDay: DateTime.utc(2040, 10, 20),
            ),
          ),
        ),
      ],
    );
  }
}

class FinancialAssetTile extends StatelessWidget {
  const FinancialAssetTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return FinancialAssetPage(
              title: 'gold',
            );
          }));
        },
        title: Text('Crypto'),
        subtitle: Text('Invested 700.29'),
        leading: Icon(
          Icons.monetization_on_outlined,
          size: 50,
        ),
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
