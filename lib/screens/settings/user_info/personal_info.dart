import 'dart:developer';

import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalInfoPage extends ConsumerWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);
  static const routeName = '/personal-info';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            personalInfoTile('aadhar', _userData?.aadhar ?? 'not set'),
            sensitivePersonalInfoTile(
                title: 'pan', data: _userData?.pancard ?? 'not set'),
            sensitivePersonalInfoTile(
                title: 'kyc', data: _userData?.kyc ?? 'not set'),
            const Text("To change personal info on this page"),
            TextButton(
              onPressed: () {
                //
              },
              child: const Text("Contact Us"),
            ),
          ],
        ),
      ),
    );
  }

  Widget personalInfoTile(title, data) {
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
  @override
  Widget build(BuildContext context) {
    bool showInfo = true;

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
                Text(""),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      setState(() {
                        showInfo = !showInfo;
                      });
                      log(showInfo.toString());
                    },
                    icon: showInfo
                        ? Icon(Icons.hide_source)
                        : Icon(Icons.remove_red_eye))
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

// style: TextStyle(
//                 fontSize: 20,
//                 color: Color(0xFF1D1D1D),
//                 fontWeight: FontWeight.w400,
//               ),