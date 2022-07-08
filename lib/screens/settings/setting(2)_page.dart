import 'package:fise_app/screens/settings/transactions.dart';
import 'package:fise_app/screens/settings/user_info/personal_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_theme.dart';

class Setting_page2 extends StatefulWidget {
  const Setting_page2({Key? key}) : super(key: key);

  @override
  State<Setting_page2> createState() => _Setting_page2State();
}

class _Setting_page2State extends State<Setting_page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
            SettingTile(
              title: 'Personal Info',
              tile_Icon: 'assets/images/setting_icons/personal_info.svg',
              routeLink: () {
                Navigator.of(context).pushNamed(PersonalInfoPage.routeName);
              },
            ),
            SettingTile(
              title: 'Privacy and Security',
              tile_Icon: 'assets/images/setting_icons/privacy.svg',
              routeLink: () {
                //              Route here
              },
            ),
            SettingTile(
              title: 'Payment Settings',
              tile_Icon: 'assets/images/setting_icons/payment.svg',
              routeLink: () {
                //              Route here
              },
            ),
            SettingTile(
              title: 'Transactions',
              tile_Icon: 'assets/images/setting_icons/privacy.svg',
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
              tile_Icon: 'assets/images/setting_icons/App_Settings.svg',
              routeLink: () {
                //              Route here
              },
            ),
            SettingTile(
              title: 'Connected Accounts',
              tile_Icon: 'assets/images/setting_icons/User_Account.svg',
              routeLink: () {
                //              Route here
              },
            ),
            SettingTile(
              title: 'Notification and Emails',
              tile_Icon: 'assets/images/setting_icons/Notification.svg',
              routeLink: () {
                //              Route here
              },
            ),
            SettingTile(
              title: 'Help and Support',
              tile_Icon: 'assets/images/setting_icons/Help.svg',
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
              tile_Icon: 'assets/images/setting_icons/Info.svg',
              routeLink: () {
                //              Route here
              },
            ),
            SettingTile(
              title: 'Privacy Policy',
              tile_Icon: 'assets/images/setting_icons/Privacy_Policy.svg',
              routeLink: () {
                //              Route here
              },
            ),
            SettingTile(
              title: 'Terms and Conditions',
              tile_Icon: 'assets/images/setting_icons/Terms_and_Conditions.svg',
              routeLink: () {
                //              Route here
              },
            ),
            SettingTile(
              title: 'Feedback',
              tile_Icon: 'assets/images/setting_icons/Feedback.svg',
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
      leading: SvgPicture.asset(
        tile_Icon,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
      ),
      onTap: routeLink,
    );
  }
}
