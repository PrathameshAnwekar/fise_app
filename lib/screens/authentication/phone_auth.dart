import 'package:auto_size_text/auto_size_text.dart';
import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/screens/authentication/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class PhoneAuth extends StatefulWidget {
  PhoneAuth({Key? key}) : super(key: key);

  static const routeName = 'phoneauth';

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  final phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/login/enter_number_bg.png',
                    )),
              ),
            ),
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
                child: AutoSizeText(
                  'You will recieve a 6-digit OTP on this number.',
                  maxLines: 2,
                  style: TextStyle(color: AppThemeData.lightColorScheme.primary, fontSize: 25, fontWeight: FontWeight.bold),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(SizeConfig.screenWidth * 0.1,
                  SizeConfig.screenHeight * 0.45, 0, 0),
              child: Container(
                height: 100,
                child: Row(children: [
                  AutoSizeText(
                    
                    '+91',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                    height: 50,
                  ),
                  Container(
                      width: SizeConfig.screenWidth * 0.6,
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          validator: ((value) {
                            if (value == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Please enter a valid 10 digit number")));
                            } else if (value.length < 10 ||
                                int.tryParse(value) == null ||
                                value.length > 10) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Please enter a valid 10 digit number")));
                            } else {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                  builder: (context) => OTPAuth(
                                      phoneNumber:
                                          phoneNumberController.text)),(Route<dynamic> route) => false);
                            }
                          }),
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                              counter: null,
                              border: InputBorder.none,
                              isCollapsed: true,
                              hintText: '9876543210',
                              hintStyle: AppThemeData.textTheme.headline3),
                          keyboardType: TextInputType.phone,
                        ),
                      ))
                ]),
              ),
            ),
            Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: AppThemeData.lightColorScheme.primary,
                    borderRadius: BorderRadius.circular(20)),
                width: SizeConfig.screenWidth * 0.8,
                height: SizeConfig.screenHeight * 0.05,
                margin: EdgeInsets.fromLTRB(SizeConfig.screenWidth * 0.1,
                    SizeConfig.screenHeight * 0.9, 0, 0),
                child: OutlinedButton(
                  onPressed: () {
                    _formKey.currentState!.validate();
                  },
                  child: const Text(
                    'Continue',
                    style: const TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ));
  }
}
