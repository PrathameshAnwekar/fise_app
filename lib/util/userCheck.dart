import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fise_app/models/user_data.dart';
import 'package:fise_app/screens/authentication/gmail_auth.dart';
import 'package:fise_app/screens/homescreen/homescreen.dart';
import 'package:fise_app/util/initializer.dart';
import 'package:flutter/material.dart';

Future<void> userCheck(ref, context) async {
  await Future.delayed(Duration(seconds: 0));
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  print(user?.uid);
  await FirebaseFirestore.instance
      .collection('Profiles')
      .doc(user?.uid)
      .get()
      .then((value) async {
    if (user == null) {
      debugPrint('User is logged out');
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => GmailAuthScreen()));
      });
    } else {
      debugPrint('User is logged in');
      debugPrint(user.uid);

      ref.read(currentUserDataProvider.state).state =
          UserData.fromDocument(value);
      try {
        await FirebaseFirestore.instance
            .collection('Profiles/${user.uid}/basket')
            .get()
            .then((value) {
          if (value.docs.isNotEmpty) {
            value.docs.forEach((element) {
              ref.read(basketStocksProvider.state).state[element.get('name')] =
                  element.get('remaining');
            });
          }
        });
      } catch (e) {
        debugPrint(e.toString());
      }

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Navigator.pushReplacement(
            // context, MaterialPageRoute(builder: (context) => HomeScreen()));
            context,
            MaterialPageRoute(builder: (context) => Homescreen()));
      });
    }
  });
}
