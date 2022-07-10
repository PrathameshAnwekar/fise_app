import 'package:firebase_auth/firebase_auth.dart';
import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/screens/authentication/gmail_auth.dart';
import 'package:fise_app/screens/settings/transactions.dart';
import 'package:fise_app/screens/settings/user_info/personal_info.dart';
import 'package:fise_app/util/initializer.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  SettingsPage({Key? key}) : super(key: key);
  static const routeName = '/settingspag';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage(
                  'assets/images/login/enter_number_bg.png',
                ))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.fromLTRB(SizeConfig.screenWidth * 0.05,
                SizeConfig.screenHeight * 0.3, 0, 0),
            child: Text(
              'settings',
              style: AppThemeData.textTheme.headline6,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  SettingTile(
                    title: 'Personal Info',
                    tile_Icon: 'assets/images/setting_icons/personal.png',
                    routeLink: () {
                      //              Route here
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return PersonalInfoPage();
                      })));
                    },
                  ),
                  SettingTile(
                    title: 'Privacy and Security',
                    tile_Icon: 'assets/images/setting_icons/privacy.png',
                    routeLink: () {
                      //              Route here
                    },
                  ),
                  SettingTile(
                    title: 'Payment Settings',
                    tile_Icon: 'assets/images/setting_icons/payment.png',
                    routeLink: () {
                      //              Route here
                    },
                  ),
                  SettingTile(
                    title: 'Transactions',
                    tile_Icon: 'assets/images/setting_icons/transactions.png',
                    routeLink: () {
                      //              Route here
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
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
                    tile_Icon: 'assets/images/setting_icons/App_settings.png',
                    routeLink: () {
                      //              Route here
                    },
                  ),
                  SettingTile(
                    title: 'Connected Accounts',
                    tile_Icon: 'assets/images/setting_icons/User_Account.png',
                    routeLink: () {
                      //              Route here
                    },
                  ),
                  SettingTile(
                    title: 'Notification and Emails',
                    tile_Icon: 'assets/images/setting_icons/Notification.png',
                    routeLink: () {
                      //              Route here
                    },
                  ),
                  SettingTile(
                    title: 'Help and Support',
                    tile_Icon: 'assets/images/setting_icons/Help.png',
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
                    tile_Icon: 'assets/images/setting_icons/Info.png',
                    routeLink: () {
                      //              Route here
                    },
                  ),
                  SettingTile(
                    title: 'Privacy Policy',
                    tile_Icon: 'assets/images/setting_icons/Privacy_Policy.png',
                    routeLink: () {
                      //              Route here
                    },
                  ),
                  SettingTile(
                    title: 'Terms and Conditions',
                    tile_Icon:
                        'assets/images/setting_icons/Terms_and_Conditions.png',
                    routeLink: () {
                      //              Route here
                    },
                  ),
                  SettingTile(
                    title: 'Feedback',
                    tile_Icon: 'assets/images/setting_icons/Feedback.png',
                    routeLink: () {
                      //              Route here
                    },
                  ),
                  SettingTile(
                      title: 'Log Out',
                      tile_Icon: 'assets/images/setting_icons/Feedback.png',
                      routeLink: () async {
                        await auth.signOut();
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              InitializerWidget.routeName,
                              (Route<dynamic> route) => false);
                        });
                      }),
                ],
              )),
            ),
          )
        ]),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile(
      {Key? key,
      required this.title,
      required this.tile_Icon,
      required this.routeLink})
      : super(key: key);

  final String title;
  final String tile_Icon;
  final VoidCallback routeLink;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppThemeData.textTheme.subtitle1,
      ),
      leading: Image.asset(tile_Icon, height: 27),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
      ),
      onTap: routeLink,
    );
  }
}
