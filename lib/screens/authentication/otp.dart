import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/screens/authentication/gmail_auth.dart';
import 'package:fise_app/util/initializer.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

///THIS FILE IS  EMBEDDED WITH ALL NEEDED FUNCTIONS, ITS MESSY BUT MAKES SURE IT WORKS////

String _verificationId = "";
String smsCode = '';
bool once = true;

class OTPAuth extends StatefulWidget {
  const OTPAuth({Key? key, required this.phoneNumber}) : super(key: key);
  final String phoneNumber;
  static const routeName = 'otp';
  @override
  State<OTPAuth> createState() => _OTPAuthState();
}

class _OTPAuthState extends State<OTPAuth> {
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  bool once = true;

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
    if (once) _verifyPhone();
    once = false;
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: null,
          icon: Icon(
            Icons.check,
            color: Colors.white,
          ),
          label: Text(
            "Verify OTP",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: AppThemeData.lightColorScheme.primary,
        ),
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(children: [
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
                  'we have sent you an OTP on ${widget.phoneNumber}.',
                  maxLines: 2,
                  style: TextStyle(
                      color: AppThemeData.lightColorScheme.primary,
                      fontSize: 25,
                      fontWeight: FontWeight.bold))),
          Container(
              margin: EdgeInsets.fromLTRB(
                  SizeConfig.screenWidth * 0.1,
                  SizeConfig.screenHeight * 0.42,
                  SizeConfig.screenWidth * 0.1,
                  0),
              child: Divider(
                thickness: 2,
                endIndent: SizeConfig.screenWidth * 0.2,
                color: AppThemeData.lightColorScheme.primary,
              )),
          Container(
            margin: EdgeInsets.fromLTRB(SizeConfig.screenWidth * 0.1,
                SizeConfig.screenHeight * 0.5, SizeConfig.screenWidth * 0.1, 0),
            child: Form(
              key: formKey,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: PinCodeTextField(
                    backgroundColor: Colors.white,
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v != null && v.length < 6) {
                        return "";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      inactiveColor: Colors.black,
                      activeColor: Colors.transparent,
                      shape: PinCodeFieldShape.box,
                      selectedColor: Colors.black,
                      errorBorderColor: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.transparent,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: false,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    onCompleted: (v) async {
                      debugPrint("Completed");
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: _verificationId,
                              smsCode: v);
                      await linkAndCreateProfile(credential);
                    },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  )),
            ),
          ),
        ]));
  }

  _verifyPhone() async {
    debugPrint('VerifyPhone is being executed');
    await auth.verifyPhoneNumber(
        phoneNumber: '+91' + widget.phoneNumber,
        timeout: Duration(seconds: 120),
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          debugPrint('CodeAutoretrieval timeout');
        });
  }

  Future<void> linkAndCreateProfile(PhoneAuthCredential credential) async {
    debugPrint('link and crete profile is being executed');
    try {
      await createFirestoreProfileDoc();
      await auth.currentUser?.linkWithCredential(credential);
      await auth.signInWithCredential(credential).then((value) async {
        if (value.user != null) {
          print('User is logged in.');
          await Navigator.of(context)
              .pushReplacementNamed(InitializerWidget.routeName);
        }
      });
    } catch (e) {
      debugPrint(e.toString());
      FirebaseAuth.instance.signOut();
      GoogleSignIn().signOut();
      errorSnackbar(context, "Something went wrong, please try again.");
      Navigator.pushNamedAndRemoveUntil(
          context, GmailAuthScreen.routeName, (route) => false);
    }
  }

  Future<void> createFirestoreProfileDoc() async {
    final user = await FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.collection('Profiles').doc(user!.uid).set({
      'phoneNumber': '+91' + widget.phoneNumber,
      'email': user.email,
      'uid': auth.currentUser?.uid
    }, SetOptions(merge: true));
  }

  errorSnackbar(BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: const Color.fromRGBO(237, 92, 90, 1),
      ),
    );
  }
}
