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
        Container(
          width: SizeConfig.screenWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 8, 0),
                child:
                    Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Container(
                height: SizeConfig.screenHeight * 0.05,
                child: Text('Akshat Agarwal'),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
