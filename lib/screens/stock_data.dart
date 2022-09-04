import 'dart:convert';
import 'package:fise_app/constants/app_theme.dart';
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
    // log(response.body);
    return decodeStockData(response.body);
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}

class StockDataScreen extends StatelessWidget {
  final Future<List<StockDataModel>> stockData = fetchStockData();

  StockDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      appBar: AppBar(
        elevation: 2,
        title: Text("basket"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.all(0),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide.none,
                ),
                hintText: "Add stocks by name or ticker",
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18.0, top: 11, bottom: 11),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Type at least 3 characters to start searching.",
                overflow: TextOverflow.clip,
              ),
            ),
          ),
          const Divider(
            thickness: 8,
            color: Colors.white,
          ),
          Flexible(
            child: FutureBuilder<List<StockDataModel>>(
              future: fetchStockData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? stockDataList3(snapshot.data ?? [])
                    : const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget stockDataList(List<StockDataModel> stockDataList) {
    return ListView.builder(
      itemCount: stockDataList.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stockDataList[index].name.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  stockDataList[index].symbol.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Container(
                  child: Text(
                    '\n' + stockDataList[index].companyName.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    '\n' + stockDataList[index].price.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget stockDataList2(List<StockDataModel> stockDataList) {
    return ListView.builder(
      itemCount: stockDataList.length,
      itemBuilder: (context, index) {
        return Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(5),
              child: ListTile(
                leading: Text(stockDataList[index].price.toString()),
                title: Text(stockDataList[index].companyName),
                subtitle: Text(stockDataList[index].symbol),
              ),
            ));
      },
    );
  }

  Widget stockDataList3(List<StockDataModel> stockDataList) {
    return ListView.separated(
      itemCount: stockDataList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(stockDataList[index].symbol),
          subtitle: Text(stockDataList[index].companyName),
          trailing: IconButton(
            color: AppThemeData.lightColorScheme.primary,
            icon: const Icon(
              Icons.add_circle_outline,
            ),
            onPressed: () {
              //  Stock gets added to basket
            },
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
