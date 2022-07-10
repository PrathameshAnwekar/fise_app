import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fise_app/models/user_data.dart';
import 'package:fise_app/screens/homescreen/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:fise_app/screens/authentication/gmail_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/constants.dart';

final currentUserDataProvider = Provider((ref) => userData);
UserData? userData;

class InitializerWidget extends StatefulWidget {
  const InitializerWidget({Key? key}) : super(key: key);

  static const routeName = 'initializer';

  @override
  State<InitializerWidget> createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  @override
  void initState() {
    userCheck();
    super.initState();
  }

  userCheck() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    print(user?.uid);
    final ref = FirebaseFirestore.instance
        .collection('Profiles')
        .doc(user?.uid)
        .get()
        .then((value) {
      if (user == null) {
        print('here1');
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => GmailAuthScreen()));
        });
      } else {
        print('here2');
        print(user?.uid);

        userData = UserData.fromDocument(value);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return LayoutBuilder(builder: (context, orientation) {
          SizeConfig().init(context);
          return Center(child: CircularProgressIndicator.adaptive());
        });
      },
    );
  }
}
