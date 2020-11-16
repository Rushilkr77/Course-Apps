//TODO: Add your imports here.
import 'dart:convert';
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

const coinAPIURL =
    'https://free.currconv.com/api/v7/convert?q=PHP_USD&compact=ultra';
const apiKey = '541b0bfa2043413ed370';

class CoinData {
  Future getcoindata() async {
    String requesturl = '$coinAPIURL&apiKey=$apiKey';
    Response response = await get(requesturl);

    if (response.statusCode == 200) {
      var decodedata = jsonDecode(response.body);
      var rate = decodedata['PHP_USD'];
      return rate;
    } else {
      print(response.statusCode);
    }
  }
}
