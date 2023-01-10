import 'package:http/http.dart' as http;
import 'dart:convert';
import 'coin_data.dart';

const apiKey = 'EF6D31CA-A225-4640-98F2-FE625135759F';
const coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';

class FetchCoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String requestUrl =
          '$coinApiUrl/$crypto/$selectedCurrency?apiKey=$apiKey';
      http.Response response = await http.get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {
        var decodeData = json.decode(response.body);
        double price = decodeData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
