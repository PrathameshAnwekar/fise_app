import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/screens/authentication/gmail_auth.dart';
import 'package:fise_app/util/initializer.dart';
import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

///THIS FILE IS INTENTIONALLY EMBEDDED WITH ALL NEEDED FUNCTIONS, ITS MESSY BUT MAKES SURE IT WORKS////

class OTPAuth extends StatefulWidget {
  const OTPAuth({Key? key, required this.phoneNumber}) : super(key: key);
  final String phoneNumber;
  static const routeName = 'otp';
  @override
  State<OTPAuth> createState() => _OTPAuthState();
}

class _OTPAuthState extends State<OTPAuth> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
  late final guser = FirebaseAuth.instance.currentUser;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _verifyPhone();
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
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
                  style: TextStyle(color: AppThemeData.lightColorScheme.primary, fontSize: 25, fontWeight: FontWeight.bold)
              )),
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
                      inactiveColor: Colors.grey.shade500,
                      activeColor: Colors.black,
                      shape: PinCodeFieldShape.box,
                      selectedColor: Colors.black,
                      errorBorderColor: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.grey.shade300,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: false,

                    errorAnimationController: errorController,
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (v) async {
                      debugPrint("Completed");
                      if (v.length == 6) {
                        try {
                          final credential = PhoneAuthProvider.credential(
                              ////Function for linking with gmail account
                              verificationId: _verificationCode,
                              smsCode: v);
                          final userCredential = await FirebaseAuth
                              .instance.currentUser
                              ?.linkWithCredential(credential);
                        } on FirebaseAuthException catch (e) {
                          switch (e.code) {
                            case "provider-already-linked":
                              print(
                                  "The provider has already been linked to the user.");
                              break;
                            case "invalid-credential":
                              print("The provider's credential is not valid.");
                              break;
                            case "credential-already-in-use":
                              print(
                                  "The account corresponding to the credential already exists, "
                                  "or is already linked to a Firebase User.");
                              break;
                            // See the API reference for the full list of error codes.
                            default:
                              print("Unknown error.");
                          }
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                '${widget.phoneNumber} is already linked to another account, please use another phone number.'),
                          ));
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil(GmailAuthScreen.routeName, (route) => false);
                        }
                        try {
                          final guser = await FirebaseAuth.instance.currentUser;

                          await FirebaseAuth
                              .instance ////Sign in manually and initialise userprofiile
                              .signInWithCredential(
                                  PhoneAuthProvider.credential(
                                      verificationId: _verificationCode,
                                      smsCode: v))
                              .then((value) async {
                            if (value.user != null) {
                              print('correct pin, logging in.');
                              await FirebaseFirestore.instance
                                  .collection('Profiles')
                                  .doc(guser!.uid)
                                  .set({
                                'phoneNumber': widget.phoneNumber,
                                'email': guser.email
                              }, SetOptions(merge: true));
                              await Navigator.of(context)
                                  .pushNamedAndRemoveUntil(
                                      InitializerWidget.routeName,
                                      (Route<dynamic> route) => false);
                            }
                          });
                        } catch (e) {
                          errorSnackbar(context, 'Invalid OTP');
                        }
                      }
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
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

  late String _verificationCode;
  final idToken = FirebaseAuth.instance.currentUser!.getIdToken();

  _verifyPhone() async {
    ////Verify phone function
    FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91' + widget.phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          try {
            final userCredential = await FirebaseAuth.instance.currentUser
                ?.linkWithCredential(phoneAuthCredential);
          } on FirebaseAuthException catch (e) {
            switch (e.code) {
              case "provider-already-linked":
                print("The provider has already been linked to the user.");
                break;
              case "invalid-credential":
                print("The provider's credential is not valid.");
                break;
              case "credential-already-in-use":
                print(
                    "The account corresponding to the credential already exists, "
                    "or is already linked to a Firebase User.");
                break;
              // See the API reference for the full list of error codes.
              default:
                print("Unknown error.");
            }
          }

          FirebaseAuth.instance
              .signInWithCredential(phoneAuthCredential)
              .then((value) async {
            if (value.user != null) {
              print('User is logged in.');
              final user = await FirebaseAuth.instance.currentUser;
              await FirebaseFirestore.instance
                  .collection('Profiles')
                  .doc(user!.uid)
                  .set({'phoneNumber': widget.phoneNumber, 'email': user.email},
                      SetOptions(merge: true));
              await Navigator.of(context)
                  .pushReplacementNamed(InitializerWidget.routeName);
            }
          });
        },
        verificationFailed: (FirebaseAuthException firebaseAuthException) {
          print(firebaseAuthException.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        });
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
