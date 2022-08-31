import 'dart:developer';

import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/models/user_data.dart';
import 'package:fise_app/screens/authentication/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalInfoPage extends ConsumerStatefulWidget {
  const PersonalInfoPage({super.key});
  static const routeName = '/personal-info';

  @override
  ConsumerState<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends ConsumerState<PersonalInfoPage> {
  @override
  Widget build(BuildContext context) {
    var _userData = ref.watch(currentUserDataProvider);
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          title: Text(
            'personal info',
            style: TextStyle(fontSize: 23),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: SizeConfig.screenWidth * 0.3,
                decoration:
                    BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                child: Image.asset('assets/images/login/google_logo.png'),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.05,
            ),
            personalInfoTile('name', _userData?.username ?? 'not set'),
            personalInfoTile('email', _userData?.email ?? 'not set'),
            personalInfoTile('phone', _userData?.phoneNumber ?? 'not set'),
            personalInfoTile('dob  ', _userData?.dob ?? 'not set'),
            personalInfoTile('address', _userData?.address ?? 'not set'),
            sensitivePersonalInfoTile(
              title: 'aadhar',
              data: _userData?.aadhar ?? 'not set',
            ),
            sensitivePersonalInfoTile(
              title: 'pan',
              data: _userData?.pancard ?? 'not set',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "KYC  ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                ),
                Text(
                  _userData?.kyc ?? 'not set',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Icon((_userData?.kyc == "verified") ? Icons.done : null)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: const Text("To change personal info on this page"),
            ),
            TextButton(
              onPressed: () {
                //
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return SignupPage();
                })));
              },
              child: const Text("Contact Us"),
            ),
          ],
        ),
      ),
    );
  }

  Widget personalInfoTile(title, data) {
    var _userData = ref.watch(currentUserDataProvider);
    return Container(
      width: SizeConfig.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 0),
            child: Text(
              title,
              style: TextStyle(fontSize: 17, color: Color(0xFF1D1D1D)),
            ),
          ),
          Divider(
            endIndent: 220,
            indent: 16.0,
            thickness: 2,
            color: Colors.grey.withOpacity(0.4),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 8),
            child: Text(
              data,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF1D1D1D),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class sensitivePersonalInfoTile extends StatefulWidget {
  const sensitivePersonalInfoTile(
      {super.key, required this.title, required this.data});

  final String title;
  final String data;

  @override
  State<sensitivePersonalInfoTile> createState() =>
      _sensitivePersonalInfoTileState();
}

class _sensitivePersonalInfoTileState extends State<sensitivePersonalInfoTile> {
  bool showInfo = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 0),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 17, color: Color(0xFF1D1D1D)),
            ),
          ),
          Divider(
            endIndent: 220,
            indent: 16.0,
            thickness: 2,
            color: Colors.grey.withOpacity(0.4),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 8),
            child: Row(
              children: [
                Text(
                  showInfo ? widget.data : "XXX XXXXX XXX",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF1D1D1D),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      setState(() {
                        showInfo = !showInfo;
                      });
                    },
                    icon: showInfo
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off))
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
