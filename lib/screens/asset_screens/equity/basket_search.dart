import 'package:fise_app/constants/app_theme.dart';
import 'package:fise_app/screens/asset_screens/equity/stock_data.dart';
import 'package:flutter/material.dart';
  var stockList ;
class BasketSearchScreen extends StatelessWidget {
  BasketSearchScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('basket')),
        body: Center(
          child: FutureBuilder<List<StockDataModel>>(
            future: fetchStockData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              if (snapshot.hasData) {
                stockList = snapshot.data;
                return Column(
                  children: [
                    Container(
                        clipBehavior: Clip.hardEdge,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        child: AppBar(
                          backgroundColor: Colors.transparent,
                          automaticallyImplyLeading: false,
                          title: Text('Search'),
                          actions: [
                            IconButton(
                              onPressed: () {
                                // method to show the search bar
                                showSearch(
                                    context: context,
                                    // delegate to customize the search bar
                                    delegate: CustomSearchDelegate());
                              },
                              icon: const Icon(Icons.search),
                            )
                          ],
                        )),
                    stockDataList(snapshot.data ?? []),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }

  Widget stockDataList(List<StockDataModel> stockDataList) {
    return Expanded(
      child: ListView.builder(
        itemCount: stockDataList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              trailing: IconButton(
                  icon: Icon(
                    Icons.add_circle_outline_sharp,
                    color: AppThemeData.lightColorScheme.primary,
                  ),
                  onPressed: () {}),
              title: Text(stockDataList[index].symbol),
              subtitle: Text(stockDataList[index].companyName),
            ),
          );
        },
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List searchTerms = stockList;
  // List searchTerms = stockList.map((e) => e.companyName.toString()).toList();

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List matchQuery = [];
    for (var stock in searchTerms) {
      if (stock.companyName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(stock);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List matchQuery = [];
    for (var stock in searchTerms) {
      if (stock.companyName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(stock);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return Card(
            child: ListTile(
              trailing: IconButton(
                  icon: Icon(
                    Icons.add_circle_outline_sharp,
                    color: AppThemeData.lightColorScheme.primary,
                  ),
                  onPressed: () {}),
              title: Text(result.symbol),
              subtitle: Text(result.companyName),
            ),
          );
      },
    );
  }
}
