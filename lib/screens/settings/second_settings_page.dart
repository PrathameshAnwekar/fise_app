import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/screens/settings/transactions/transactions.dart';
import 'package:fise_app/screens/settings/user_info/personal_info.dart';
import 'package:flutter/material.dart';


class SecondsettingsPage extends StatefulWidget {
  const SecondsettingsPage({Key? key}) : super(key: key);

  @override
  State<SecondsettingsPage> createState() => _SecondsettingsPageState();
}

class _SecondsettingsPageState extends State<SecondsettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //
        leading: const Icon(Icons.arrow_back_ios),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.black26,
              height: 1.0,
            )),

        //
        backgroundColor: Colors.white,
        title: Text(
          "settings",
          style: AppThemeData.textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
//
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
                //              Route here
              },
            ),
            SettingTile(
              title: 'Transactions',
              tileIcon: 'assets/images/setting_icons/privacy.png',
              routeLink: () {
                //              Route here
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

//
          ],
        ),
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
      leading: Image.asset(
        tileIcon,
        height: 30,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
      ),
      onTap: routeLink,
    );
  }
}
