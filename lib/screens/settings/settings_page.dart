import 'package:firebase_auth/firebase_auth.dart';
import 'package:fise_app/payments/cashfree_pg.dart';
import 'package:fise_app/screens/settings/app_settings/app_settings_page.dart';
import 'package:fise_app/screens/settings/notificationSettings.dart';
import 'package:fise_app/screens/settings/privacy_security/privacy_security.dart';
import 'package:fise_app/screens/settings/transactions/transactions.dart';
import 'package:fise_app/screens/settings/user_info/personal_info.dart';
import 'package:fise_app/sms_retriever/sms.dart';
import 'package:fise_app/util/initializer.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settingspage';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("settings"),
      ),
      body: SettingTiles(),
    );
  }
}

class SettingTiles extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  SettingTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(
        children: [
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return PrivacyAndSecurity();
              }));
            },
          ),
          SettingTile(
            title: 'Payment Settings',
            tileIcon: 'assets/images/setting_icons/payment.png',
            routeLink: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return CashfreePage(
                  orderAmount: 1,
                  orderNote: 'trial',
                );
              }));

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
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NotificationSettings();
              }));
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
        style: TextStyle(fontSize: 17.5),
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
