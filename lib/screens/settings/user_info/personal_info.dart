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
          title: Text(
        'personal info',
        style: TextStyle(fontSize: 23),
      )),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: SizeConfig.screenWidth * 0.35,
            decoration:
                BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            child: Image.asset('assets/images/login/google_logo.png'),
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.05,
        ),
        personalInfoTile('Name', _userData?.username ?? 'not set'),
        personalInfoTile('Email', _userData?.email ?? 'not set'),
        personalInfoTile('Phone', _userData?.phoneNumber ?? 'not set'),
        personalInfoTile('DOB  ', _userData?.dob ?? 'not set'),
        personalInfoTile('Address', _userData?.address ?? 'not set'),
        personalInfoTile('Aadhar', _userData?.aadhar ?? 'not set'),
        personalInfoTile('PAN    ', _userData?.pancard ?? 'not set'),
        personalInfoTile('KYC    ', _userData?.kyc ?? 'not set'),
        Expanded(
          child: Container(),
        ),
        const Text("To change personal info on this page"),
        TextButton(
          onPressed: () {
            //
          },
          child: const Text("Contact Us"),
        ),
      ]),
    );
  }

  Widget personalInfoTile(title, data) {
    return Container(
      width: SizeConfig.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.fromLTRB(25, 10, 15, 10),
              child: Text(title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Text(
                data,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
