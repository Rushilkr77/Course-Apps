import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'AUD';
  String selectedcryptocurrency = 'BTC';

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getData();
        });
      },
    );
  }

  DropdownButton<String> cryptoDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String cryptocurrency in cryptoList) {
      var newItem = DropdownMenuItem(
        child: Text(cryptocurrency),
        value: cryptocurrency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedcryptocurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedcryptocurrency = value;
          getData();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getData();
        });
      },
      children: pickerItems,
    );
  }

  String value = '?';

  Map<String, String> coinvalues = {};
  bool iswaiting = false;

  void getData() async {
    iswaiting = true;
    try {
      var data = await CoinData()
          .getCoinData(selectedCurrency, selectedcryptocurrency);
      iswaiting = false;
      setState(() {
        coinvalues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Cryptocard(
                value: iswaiting ? '?' : coinvalues[selectedcryptocurrency],
                selectedCurrency: selectedCurrency,
                cryptocurrency: selectedcryptocurrency,
              ),
            ],
          ),
          Container(
            height: 80.0,
            padding: EdgeInsets.all(20.0),
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: androidDropdown(),
                ),
                Expanded(child: cryptoDropdown()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Cryptocard extends StatelessWidget {
  Cryptocard(
      {@required this.value,
      @required this.selectedCurrency,
      @required this.cryptocurrency});

  final String value;
  final String selectedCurrency;
  final String cryptocurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptocurrency = $value $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
