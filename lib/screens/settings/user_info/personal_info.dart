import 'package:fise_app/constants/constants.dart';
import 'package:flutter/material.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  static const routeName = '/personal-info';

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  @override
  Widget build(BuildContext context) {
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
        personalInfoTile('Name', 'Akshat Agarwal'),
        personalInfoTile('Email', 'sample@gmail.com'),
        personalInfoTile('Phone', '1234567890'),
        personalInfoTile('DOB  ', '01/01/2002'),
        personalInfoTile('Address', '1234567890'),
        personalInfoTile('Aadhar', '1234567890'),
        personalInfoTile('PAN    ', '1234567890'),
        personalInfoTile('KYC    ', '1234567890'),
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
