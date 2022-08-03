import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fise_app/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:fise_app/screens/authentication/gmail_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/constants.dart';
import '../screens/homescreen/homescreen.dart';


final basketStocksProvider = StateProvider((ref) => <String, dynamic>{});

class InitializerWidget extends ConsumerStatefulWidget {
  const InitializerWidget({Key? key}) : super(key: key);

  static const routeName = 'initializer';

  @override
  ConsumerState<InitializerWidget> createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends ConsumerState<InitializerWidget> {
  @override
  void initState() {
    userCheck();
    super.initState();
  }

  Future<void> userCheck() async {
    await Future.delayed(Duration(seconds: 0));
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    print(user?.uid);
    await FirebaseFirestore.instance
        .collection('Profiles')
        .doc(user?.uid)
        .get()
        .then((value) {
      if (user == null) {
        print('here1');
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => GmailAuthScreen()));
        });
      } else {
        print('here2');
        print(user.uid);

        ref.read(currentUserDataProvider.state).state =
            UserData.fromDocument(value);
        FirebaseFirestore.instance.collection('baskets').doc(user.uid).get().then((value) {
          if (value.exists) {
            ref.read(basketStocksProvider.state).state = value.data()!;
          }
        });

        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await Navigator.pushReplacement(
              // context, MaterialPageRoute(builder: (context) => HomeScreen()));
              context,
              MaterialPageRoute(builder: (context) => Homescreen()));
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
