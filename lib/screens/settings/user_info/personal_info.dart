import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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
            kycTile(),
            sellAllHoldindTile(),
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
              overflow: TextOverflow.ellipsis,
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
                      : Icon(Icons.visibility_off),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class kycTile extends ConsumerStatefulWidget {
  const kycTile({super.key});

  @override
  ConsumerState<kycTile> createState() => _kycTileState();
}

class _kycTileState extends ConsumerState<kycTile> {
  @override
  Widget build(BuildContext context) {
    var _userData = ref.watch(currentUserDataProvider);

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Container(
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
            color: Color(0xffECF1F1),
            borderRadius: BorderRadius.all(Radius.circular(17))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "KYC  ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                  ),
                  Text(
                    _userData?.kyc == false ? "Not Done" : 'Done',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Icon((_userData?.kyc == "verified") ? Icons.done : null)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "To change personal info on this page,",
                  style: TextStyle(fontSize: 14),
                ),
                TextButton(
                  onPressed: () {
                    //
                  },
                  child: const Text(
                    "Contact Us",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff005251),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class sellAllHoldindTile extends ConsumerStatefulWidget {
  const sellAllHoldindTile({super.key});

  @override
  ConsumerState<sellAllHoldindTile> createState() => _sellAllHoldindTileState();
}

class _sellAllHoldindTileState extends ConsumerState<sellAllHoldindTile> {
  void confirmSell(BuildContext context, VoidCallback onpress) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(
        "are you sure you want to sell all your holdings?",
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "this includes all of your investments in all asset classes and its irreversible. You will receive the payment in your bank account.",
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 20),
          Container(
            height: 1,
            width: SizeConfig.screenWidth * 0.7,
            color: Color(0xffCFCFCF),
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                border: Border.all(
                  color: Color(0xff005251),
                )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Color(0xff005251),
                ),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: onpress,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                border: Border.all(
                  color: Color(0xffCC5859),
                )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Yes, continue",
                style: TextStyle(
                  color: Color(0xffCC5859),
                ),
              ),
            ),
          ),
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    var _userData = ref.watch(currentUserDataProvider);

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Container(
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: Color(0xffECF1F1),
          borderRadius: BorderRadius.all(Radius.circular(17)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "To sell all your holdings",
              style: TextStyle(fontSize: 14),
            ),
            TextButton(
              onPressed: () {
                //
                confirmSell(context, () {
                  SellAlert newSell = SellAlert(
                      user: _userData?.username, requestedon: DateTime.now());

                  FirebaseFirestore.instance
                      .collection("devbasket")
                      .doc("sellOutAlert")
                      .collection("alert")
                      .doc()
                      .set(newSell.toMap())
                      .then((value) {
                    print("new sell request genrated");
                    Navigator.pop(context);
                  });
                });
              },
              child: const Text(
                "Click Here",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffBB0404),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
