import 'package:flutter/material.dart';
import 'package:yahoofin/yahoofin.dart';

class YahooFinDummy extends StatefulWidget {
  const YahooFinDummy({Key? key}) : super(key: key);

  @override
  State<YahooFinDummy> createState() => _YahooFinDummyState();
}

class _YahooFinDummyState extends State<YahooFinDummy> {
  final yfin = YahooFin();
//bo for bombay stock exchange
//ns for national stock exchange
  Future<String> _getInfo() async {
    var info =yfin.getStockInfo(ticker: 'hdfcbank.bo');
    var price =await  yfin.getPrice(stockInfo: info);
    return price.currentPrice.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: _getInfo(),
          builder: (context, snapshot) {
            return Center(
      child: Text(snapshot.data.toString()),
    );
          }
        ));
  }
}
