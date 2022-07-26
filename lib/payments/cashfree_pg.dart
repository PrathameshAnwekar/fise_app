import 'dart:convert';

import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

var appID = '60329d41e4c7d454f4c79742a92306';
var secretKey = '22d4e69dd0bfb5b6c02fc81235815b381be23d13';

var appID_prod = '106001614693e59e7ec07bca13100601';
var secretKey_prod = 'dd71189f4ed9712a9efe664fc1e394fc9190b369';

class CashfreePage extends StatefulWidget {
  final orderAmount;
  final customerName;
  final customerEmail;
  final customerPhone;
  final orderNote;

  const CashfreePage(
      {Key? key,
      this.orderAmount,
      this.customerName,
      this.customerEmail,
      this.customerPhone,
      this.orderNote})
      : super(key: key);
  @override
  _CashfreePageState createState() => _CashfreePageState();
}

class _CashfreePageState extends State<CashfreePage> {
  var _selectedApp;

  String orderId = DateTime.now().microsecondsSinceEpoch.toString();
  String stage = "PROD";
  String orderAmount = "";
  String customerName = "";
  String orderNote = "";
  String orderCurrency = "INR";
  String appId = appID_prod;
  String customerPhone = "";
  String customerEmail = "";
  String notifyUrl = "https://api.gocashfree.com/notify";

  @override
  void initState() {
    orderAmount = widget.orderAmount;
    customerName = widget.customerName;
    customerEmail = widget.customerEmail;
    customerPhone = widget.customerPhone;
    orderNote = widget.orderNote;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            Center(
              child: RaisedButton(
                child: Text('UPI INTENT'),
                onPressed: () => makeUpiPayment(),
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text('GET INSTALLED UPI APPS'),
                onPressed: () {
                  getUPIApps();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getUPIApps() {
    // CashfreePGSDK.getUPIApps().then((value) => {
    //       if (value != null && value.length > 0) {_selectedApp = value}
    //     });
    print( CashfreePGSDK.getUPIApps().toString());
  }

  // WEB Intent
  makePayment() async {
    //Replace with actual values
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

    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
              print("$key : $value");
              //Do something with the result
            }));
  }

  // SEAMLESS - CARD
  Future<void> seamlessCardPayment() async {
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
      "paymentOption": "card",
      "card_number": "ENTER CARD NUMBER",
      "card_expiryMonth": "MONTH IN MM format",
      "card_expiryYear": "EXPIRY IN YYYY format",
      "card_holder": "Card Holder Name",
      "card_cvv": "Card CVV"
    };

    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
              print("$key : $value");
              //Do something with the result
            }));
  }

  // SEAMLESS - UPI
  Future<void> seamlessUPIPayment() async {
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

    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
              print("$key : $value");
              //Do something with the result
            }));
  }

  // UPI Intent
  Future<void> makeUpiPayment() async {
    //Replace with actual values
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

    CashfreePGSDK.doUPIPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
              print("$key : $value");
              //Do something with the result
            }));
  }

  // SEAMLESS UPI Intent
  Future<void> seamlessUPIIntent() async {
    //Replace with actual values
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

      // For seamless UPI Intent
      "appName": _selectedApp
    };

    CashfreePGSDK.doUPIPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
              print("$key : $value");
              //Do something with the result
            }));
  }

  Future<String> makeBackendPayment(
    ///IMPORTANT TO IMPLEMENT IN SOME BACKEND LATER
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
