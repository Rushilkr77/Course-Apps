import 'dart:convert';
import 'package:bitcoin_challenge_gold/price_screen.dart';
import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JMD',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '541b0bfa2043413ed370';

class CoinData {
  String cryptocurrency;
  Future getCoinData(
      String selectedcurrency, String selectedcryptocurrency) async {
    Map<String, String> cryptoprices = {};
    for (cryptocurrency in cryptoList) {
      String requestURL =
          'https://free.currconv.com/api/v7/convert?q=${cryptocurrency}_$selectedcurrency&compact=ultra&apiKey=$apiKey';
      Response response = await get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double lastPrice = decodedData['${cryptocurrency}_$selectedcurrency'];

        cryptoprices[cryptocurrency] = lastPrice.toString();
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoprices;
  }
}
