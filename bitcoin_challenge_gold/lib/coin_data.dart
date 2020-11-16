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

const coinAPIURL = 'https://free.currconv.com/api/v7/convert?q=PHP_';
const apiKey = '541b0bfa2043413ed370';

class CoinData {
  String cryptocurrency;
  Future getCoinData(String selectedcurrency) async {
    Map<String, String> cryptoprices = {};
    for (cryptocurrency in cryptoList) {
      String requestURL =
          '$coinAPIURL${selectedcurrency},${cryptocurrency}_PHP&compact=ultra&apiKey=$apiKey';
      Response response = await get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double lastPrice = decodedData['PHP_$selectedcurrency'];
        double lastcryptoprice = decodedData['${cryptocurrency}_PHP'];
        cryptoprices[cryptocurrency] = lastPrice.toString();
        cryptoprices[cryptocurrency] = lastcryptoprice.toString();
        print(lastPrice);
        print(lastcryptoprice);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoprices;
  }
}
