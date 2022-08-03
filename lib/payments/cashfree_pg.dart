import 'dart:convert';

import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fise_app/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

var appID = '60329d41e4c7d454f4c79742a92306';
var secretKey = '22d4e69dd0bfb5b6c02fc81235815b381be23d13';

var appID_prod = '106001614693e59e7ec07bca13100601';
var secretKey_prod = 'dd71189f4ed9712a9efe664fc1e394fc9190b369';

class CashfreePage extends ConsumerStatefulWidget {
  final orderAmount;
  final orderNote;

  const CashfreePage(
      {Key? key, required this.orderAmount, required this.orderNote})
      : super(key: key);
  @override
  _CashfreePageState createState() => _CashfreePageState();
}

class _CashfreePageState extends ConsumerState<CashfreePage> {
  var _selectedApp;

  var currentUser;
  String stage = "PROD";
  String orderAmount = "1";
  String customerName = "";
  String orderNote = "Order_Note";
  String orderCurrency = "INR";
  String appId = appID_prod;
  String customerPhone = "";
  String customerEmail = "";
  String notifyUrl = "https://test.gocashfree.com/notify";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    currentUser = ref.watch(currentUserDataProvider.state).state;
    customerEmail = currentUser.email;
    customerPhone = currentUser.phoneNumber;
    customerName = currentUser.username;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Cashfree SDK Sample'),
        ),
        body: Column(
          children: [
            Center(
              child: RaisedButton(
                child: Text('WEB CHECKOUT'),
                onPressed: () => makePayment(),
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text('SEAMLESS UPI COLLECT'),
                onPressed: () => seamlessUPIPayment(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getUPIApps() async {
    CashfreePGSDK.getUPIApps().then((value) => {
          if (value != null && value.length > 0) {_selectedApp = value[0]}
        });

    var x = await CashfreePGSDK.getUPIApps();
    print(x.toString());
  }

  // WEB Intent
  makePayment() async {
    String orderId = DateTime.now().microsecondsSinceEpoch.toString();
    String tokenData = await makeBackendPayment(orderId, orderAmount);

    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl
    };
    Map<String, String> result = {};
    await CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) async {
              print("$key : $value");
              result[key.toString()] = value.toString();
              result['orderNote'] = orderNote.toString();
              await FirebaseFirestore.instance
                  .collection('transactions/payments/${currentUser.uid}')
                  .doc(orderId)
                  .set(result, SetOptions(merge: true));
            }));
  }

  // SEAMLESS - UPI
  Future<void> seamlessUPIPayment() async {
    String orderId = DateTime.now().microsecondsSinceEpoch.toString();

    String tokenData = await makeBackendPayment(orderId, orderAmount);

    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl,

      // EXTRA THINGS THAT NEEDS TO BE ADDED
      "paymentOption": "upi",
      "upi_vpa": "7888209001@paytm"
    };

    Map<String, String> result = {};
    await CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) async {
              print("$key : $value");
              result[key.toString()] = value.toString();
              result['orderNote'] = orderNote.toString();

              await FirebaseFirestore.instance
                  .collection('transactions/payments/${currentUser.uid}')
                  .doc(orderId)
                  .set(result, SetOptions(merge: true));
            }));
  }

  ///IMPORTANT TO IMPLEMENT IN SOME BACKEND LATER
  Future<String> makeBackendPayment(
    orderId,
    orderAmount,
  ) async {
    var response = await http.post(
        Uri.parse('https://api.cashfree.com/api/v2/cftoken/order'),
        headers: {"x-client-id": appID_prod, "x-client-secret": secretKey_prod},
        body: json.encode({
          "orderId": orderId,
          "orderAmount": orderAmount,
          "orderCurrency": "INR"
        }));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['cftoken'].toString();
    } else {
      throw Exception('Transcation Failed');
    }
  }
}
