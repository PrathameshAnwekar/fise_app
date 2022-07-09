import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fise_app/screens/authentication/phone_auth.dart';
import 'package:fise_app/screens/homescreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleButton extends StatefulWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  User? user;
  final FirebaseAuth auth = FirebaseAuth.instance;
////// FUNCTION FOR HANDLING GOOGLE SIGN-IN /////////
  Future<void> signUp() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      UserCredential result = await auth.signInWithCredential(authCredential);
      user = result.user;

      // Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: () async {
          await signUp();
          await FirebaseFirestore.instance
              .collection('Profiles')
              .doc(user?.uid)
              .get()
              .then((value) {
            if (value.get('phoneNumber') != null) {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            } else {
              Navigator.of(context).pushReplacementNamed(PhoneAuth.routeName);
            }
          });
        },
        splashColor: Colors.black,
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            backgroundImage: Image.asset(
              'assets/images/login/google_logo.png',
              fit: BoxFit.contain,
            ).image,
          ),
        ),
      ),
    );
  }
}
