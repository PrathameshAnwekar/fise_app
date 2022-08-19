import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/screens/settings/privacy_security/resetpinPage.dart';
import 'package:fise_app/util/sharedPrefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrivacyAndSecurity extends StatefulWidget {
  const PrivacyAndSecurity({Key? key}) : super(key: key);

  @override
  State<PrivacyAndSecurity> createState() => _PrivacyAndSecurityState();
}

class _PrivacyAndSecurityState extends State<PrivacyAndSecurity> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool _loginPinBool = UserSharedPrefs().getBool('loginPinBool') ?? false;
  bool _fingerprintBool = UserSharedPrefs().getBool('fingerprintBool') ?? false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy and Security'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResetPinpage();
                }));
              },
              title: Text('Reset login PIN',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 14,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Login PIN',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.3,
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      _loginPinBool ? 'Enabled' : 'Disabled',
                      style: TextStyle(
                          fontSize: 15,
                          color: _loginPinBool ? Colors.green : Colors.red),
                    ),
                  ],
                ),
                CupertinoSwitch(
                    value: _loginPinBool,
                    onChanged: (val) {
                      setState(() {
                        _loginPinBool = !_loginPinBool;
                        UserSharedPrefs()
                            .setBool('loginPinBool', _loginPinBool);
                      });
                    })
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Fingerprint Lock',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.3,
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      _fingerprintBool ? 'Enabled' : 'Disabled',
                      style: TextStyle(
                          fontSize: 15,
                          color: _fingerprintBool ? Colors.green : Colors.red),
                    ),
                  ],
                ),
                CupertinoSwitch(
                  value: _fingerprintBool,
                  onChanged: (val) {
                    setState(() {
                      _fingerprintBool = !_fingerprintBool;
                      UserSharedPrefs()
                          .setBool('fingerprintBool', _fingerprintBool);
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
