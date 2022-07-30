import 'package:firebase_auth/firebase_auth.dart';
import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/payments/cashfree_pg.dart';
import 'package:fise_app/screens/settings/app_settings_page.dart';
import 'package:fise_app/screens/settings/transactions/transactions.dart';
import 'package:fise_app/screens/settings/user_info/personal_info.dart';
import 'package:fise_app/sms_retriever/sms.dart';
import 'package:fise_app/util/initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settingspage';

  SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverCustomHeaderDelegate(
                title: 'settings',
                collapsedHeight: 50,
                expandedHeight: 240,
                paddingTop: MediaQuery.of(context).padding.top,
                coverImg: "assets/images/test.png"),
          ),
          SliverToBoxAdapter(
            child: SettingTiles(),
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
  final String coverImg;
  final String title;
  String statusBarMode = 'dark';

  SliverCustomHeaderDelegate({
    required this.collapsedHeight,
    required this.expandedHeight,
    required this.paddingTop,
    required this.coverImg,
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

  void updateStatusBarBrightness(shrinkOffset) {
    if (shrinkOffset > 50 && statusBarMode == 'dark') {
      statusBarMode = 'light';
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ));
    } else if (shrinkOffset <= 50 && statusBarMode == 'light') {
      statusBarMode = 'dark';
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
    }
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
    updateStatusBarBrightness(shrinkOffset);

    return Container(
      height: maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(coverImg, fit: BoxFit.cover),
          const Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              "settings",
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: makeStickyHeaderTextColor(shrinkOffset, true),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: makeStickyHeaderTextColor(shrinkOffset, false),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingTiles extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  SettingTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            
            height: 20,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 231, 229, 229),
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
                  thickness: 3,
                  color: Colors.black.withOpacity(0.5)),
            ),
          ),
          const SizedBox(height: 10),
          SettingTile(
            title: 'Personal Info',
            tileIcon: 'assets/images/setting_icons/personal.png',
            routeLink: () {
              //              Route here
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return PersonalInfoPage();
              })));
            },
          ),
          SettingTile(
            title: 'Privacy and Security',
            tileIcon: 'assets/images/setting_icons/privacy.png',
            routeLink: () {
              //              Route here
            },
          ),
          SettingTile(
            title: 'Payment Settings',
            tileIcon: 'assets/images/setting_icons/payment.png',
            routeLink: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SMSTestPage();
            }));
            
            },
          ),
          SettingTile(
            title: 'Transactions',
            tileIcon: 'assets/images/setting_icons/transactions.png',
            routeLink: () {
              //              Route hereT
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return Transactions_Page();
              })));
            },
          ),
          const Divider(
            thickness: 1,
            indent: 40,
            endIndent: 40,
          ),
          SettingTile(
            title: 'App Settings',
            tileIcon: 'assets/images/setting_icons/App_settings.png',
            routeLink: () {
              //              Route here
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return AppsettingsPage();
              })));
            },
          ),
          SettingTile(
            title: 'Connected Accounts',
            tileIcon: 'assets/images/setting_icons/User_Account.png',
            routeLink: () {
              //              Route here
            },
          ),
          SettingTile(
            title: 'Notification and Emails',
            tileIcon: 'assets/images/setting_icons/Notification.png',
            routeLink: () {
              //              Route here
            },
          ),
          SettingTile(
            title: 'Help and Support',
            tileIcon: 'assets/images/setting_icons/Help.png',
            routeLink: () {
              //              Route here
            },
          ),
          const Divider(
            thickness: 1,
            indent: 40,
            endIndent: 40,
          ),
          SettingTile(
            title: 'About Us',
            tileIcon: 'assets/images/setting_icons/Info.png',
            routeLink: () {
              //              Route here
            },
          ),
          SettingTile(
            title: 'Privacy Policy',
            tileIcon: 'assets/images/setting_icons/Privacy_Policy.png',
            routeLink: () {
              //              Route here
            },
          ),
          SettingTile(
            title: 'Terms and Conditions',
            tileIcon: 'assets/images/setting_icons/Terms_and_Conditions.png',
            routeLink: () {
              //              Route here
            },
          ),
          SettingTile(
            title: 'Feedback',
            tileIcon: 'assets/images/setting_icons/Feedback.png',
            routeLink: () {
              //              Route here
            },
          ),
          SettingTile(
              title: 'Log Out',
              tileIcon: 'assets/images/setting_icons/Feedback.png',
              routeLink: () async {
                await auth.signOut();

                await GoogleSignIn().signOut();
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      InitializerWidget.routeName,
                      (Route<dynamic> route) => false);
                });
              }),
        ],
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile(
      {Key? key,
      required this.title,
      required this.tileIcon,
      required this.routeLink})
      : super(key: key);

  final String title;
  final String tileIcon;
  final VoidCallback routeLink;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppThemeData.textTheme.subtitle1,
      ),
      leading: Image.asset(tileIcon, height: 27),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
      ),
      onTap: routeLink,
    );
  }
}
