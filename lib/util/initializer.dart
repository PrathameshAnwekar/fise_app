import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fise_app/models/user_data.dart';
import 'package:fise_app/util/userCheck.dart';
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
    userCheck(ref, context);
    super.initState();
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
