import 'dart:convert';

import 'package:http/http.dart' as http;

Future<double> getLivePrice() async {
  var url = Uri.parse("https://partners-staging.safegold.com/v1/buy-price");

  var headers = {
    "Accept": "application/json",
    "Authorization": "Bearer 38778d59d5e17cfadc750e87703eb5e2"
  };

  var response = await http.get(url, headers: headers);

  print(response.body);

  if (response.statusCode == 200) {
    return double.parse(jsonDecode(response.body)['current_price'].toString());
  } else
    return 1.0;
}
