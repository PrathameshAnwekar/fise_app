import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StockDataModel {
  String? name;
  var symbol;
  var companyName;
  var price;

  StockDataModel({
    required this.name,
    required this.symbol,
    required this.companyName,
    required this.price,
  });

  factory StockDataModel.fromMap(Map<String, dynamic> json) {
    return StockDataModel(
      name: json['name'],
      symbol: json['symbol'],
      companyName: json['company'],
      price: json['price'],
    );
  }
}

List<StockDataModel> decodeStockData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<StockDataModel>((json) => StockDataModel.fromMap(json))
      .toList();
}

Future<List<StockDataModel>> fetchStockData() async {
  final response = await http.get(Uri.parse(
      'https://script.google.com/macros/s/AKfycbwun9-gvdtdD7dtqr4zUpCqp-w7qwCSGwgjs3Pc7y_IqLodKY32yqC-J2Kx3XbEbWmZBQ/exec'));
  if (response.statusCode == 200) {
    log(response.body);
    return decodeStockData(response.body);
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}


class StockDataScreen extends StatelessWidget {
  final Future<List<StockDataModel>> stockData = fetchStockData();

  StockDataScreen({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder<List<StockDataModel>>(
        future: fetchStockData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? stockDataList(snapshot.data ?? [])
              : Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }

  Widget stockDataList( List<StockDataModel> stockDataList) {
  return ListView.builder(
        itemCount: stockDataList.length,
        itemBuilder: (context, index) {
          return Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stockDataList[index].name.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Text(
                      stockDataList[index].symbol.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Container(
                      child: Text(
                        '\n' + stockDataList[index].companyName.toString(),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '\n' + stockDataList[index].price.toString(),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        });
}
}