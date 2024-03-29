import 'package:auto_size_text/auto_size_text.dart';
import 'package:fise_app/constants/constants.dart';
import 'package:fise_app/payments/cashfree_pg.dart';
import 'package:fise_app/screens/asset_screens/gold/gold_liveprice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InvestMoreGold extends StatefulWidget {
  const InvestMoreGold({Key? key}) : super(key: key);

  @override
  State<InvestMoreGold> createState() => _InvestMoreGoldState();
}

class _InvestMoreGoldState extends State<InvestMoreGold> {
  final focusNode = FocusNode();

  double _doubleError(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Please enter a valid number'),
      backgroundColor: Colors.red,
    ));
    return 1.0;
  }

  var live_price_future;
  double live_price = 1.0;

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    live_price_future = getLivePrice();
  }

  bool _value = false;
  int val = 1;
  var suffixText = "0.00 gm";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'buy digital gold',
        ),
      ),
      body: Stack(children: [
        Container(
          height: SizeConfig.screenHeight * 0.2,
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade100,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.radio_button_checked,
                          size: 14,
                        ),
                        AutoSizeText(
                          'Live Price',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  FutureBuilder(
                      future: live_price_future,
                      builder: (context, s) {
                        if (s.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else {
                          live_price = double.parse(s.data.toString());
                          return AutoSizeText(
                            '₹ $live_price' + '/gm',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          );
                        }
                      }),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: SizeConfig.screenWidth * 0.15,
                    child: Image.asset(
                      'assets/images/financialAssets/gold.png',
                    ),
                  ),
                  SizedBox(height: 10),
                  AutoSizeText('24K | 99.95% Pure Gold')
                ],
              ),
            )
          ]),
        ),
        Container(
          margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.2),
          child: Row(
            children: [
              Expanded(
                child: RadioListTile(
                  activeColor: Colors.green,
                  value: 1,
                  groupValue: val,
                  onChanged: (v) {
                    setState(() {
                      val = int.parse(v.toString());
                    });
                  },
                  title: Text("Buy in Rupees"),
                ),
              ),
              Expanded(
                child: RadioListTile(
                  activeColor: Colors.green,
                  value: 2,
                  groupValue: val,
                  onChanged: (v) {
                    setState(() {
                      val = int.parse(v.toString());
                    });
                  },
                  title: Text("Buy in Grams"),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.25),
          padding: EdgeInsets.all(20),
          child: TextFormField(
            focusNode: focusNode,
            controller: _controller,
            onChanged: (value) {
              setState(() {
                if (val == 1) {
                  suffixText = (_controller.text == ""
                              ? 0
                              : double.parse(_controller.text, _doubleError) /
                                  live_price)
                          .toStringAsFixed(4) +
                      ' gm';
                } else {
                  suffixText = '₹' +
                      (_controller.text == ""
                              ? 0
                              : double.parse(_controller.text, _doubleError) *
                                  45000)
                          .toStringAsFixed(1);
                }
              });
            },
            decoration: InputDecoration(
              hintText: val == 1 ? '₹ 0.00' : '0.00 gm',
              labelStyle: TextStyle(color: Colors.black),
              suffix:
                  StatefulBuilder(builder: (context, _) => Text(suffixText)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: SizeConfig.screenHeight * 0.37,
              left: SizeConfig.screenWidth * 0.40),
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CashfreePage(
                          orderAmount: _controller.text,
                          orderNote: 'GOLD',
                        )));
              },
              child: Text('Buy Now',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w100)),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 187, 0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )))),
        )
      ]),
    );
  }
}
