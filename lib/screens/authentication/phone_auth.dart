import 'package:fise_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PhoneAuth extends StatelessWidget {
  PhoneAuth({Key? key}) : super(key: key);

  static const routename = 'phoneauth';
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/login/enter_number_bg.png',
                )),
          ),
          child: Stack(children: [
            Container(
              margin:
                  EdgeInsets.fromLTRB(0, SizeConfig.screenHeight * 0.25, 0, 0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(50),
                      topEnd: Radius.circular(50))),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(
                    SizeConfig.screenWidth * 0.1,
                    SizeConfig.screenHeight * 0.35,
                    SizeConfig.screenWidth * 0.1,
                    0),
                child: Text(
                  'You will recieve a 6-digit OTP on this number.',
                  style: AppThemeData.textTheme.headline2,
                )),
            Container(
              margin: EdgeInsets.fromLTRB(SizeConfig.screenWidth * 0.1,
                  SizeConfig.screenHeight * 0.45, 0, 0),
              child: Row(children: [
                Text(
                  '+91',
                  style: AppThemeData.textTheme.headline4,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                    width: SizeConfig.screenWidth * 0.6,
                    child: TextFormField(
                      style: AppThemeData.textTheme.headline4,
                      smartDashesType: SmartDashesType.enabled,
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          isCollapsed: true,
                          hintText: '9876543210',
                          hintStyle: AppThemeData.textTheme.headline3),
                      keyboardType: TextInputType.phone,
                    ))
              ]),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  
                  color: AppThemeData.lightColorScheme.primary,
                  borderRadius: BorderRadius.circular(20)
                ),
                width: SizeConfig.screenWidth * 0.8,
                height: SizeConfig.screenHeight * 0.05,
                margin: EdgeInsets.fromLTRB(SizeConfig.screenWidth * 0.1,
                    SizeConfig.screenHeight * 0.9, 0, 0),
                child: OutlinedButton(
                  
                  onPressed: () {},
                  child: const Text(
                    'Continue',
                    style: const TextStyle(color: Colors.white),
                  ),
                ))
          ]),
        ));
  }
}
