import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import '../model/CoinData.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  Widget getDropDownAndroid() {
    List<DropdownMenuItem<String>> dropDownList = [];
    for (String currency in currenciesList) {
      dropDownList.add(DropdownMenuItem(
        child: Text(currency),
        value: currency,
      ));
    }
    return DropdownButton<String>(
      onChanged: (value) {
        setState(() {
          print(value);
          selectedCurrency = value ?? '';
          getCoinData();
        });
      },
      value: selectedCurrency,
      items: dropDownList,
    );
  }

  Widget getPickerIos() {
    List<Text> pickerItem = [];
    for (String currency in currenciesList) {
      pickerItem.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItem,
    );
  }

  String selectedCurrency = 'USD';
  int coinValueBTC = 0;
  int coinValueETH = 0;

  @override
  void initState() {
    getCoinData();
  }

  void updateUi(dynamic coinDataBTC, dynamic contDataETH) {
    setState(() {
      coinValueBTC = coinDataBTC['rate'].toInt();
      coinValueETH = contDataETH['rate'].toInt();
      print(coinValueBTC);
    });
  }

  void getCoinData() async {
    var coinDataBTC = await CoinData().getExChangeRate(selectedCurrency);
    var coinDataETH = await CoinData().getExChangeRateWithDynamicCrypto(selectedCurrency,'ETH');
    updateUi(coinDataBTC,coinDataETH);
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
          Padding(
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
                  '1 BTC = $coinValueBTC $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
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
                  '1 ETH = $coinValueETH $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? getPickerIos() : getDropDownAndroid(),
          ),
        ],
      ),
    );
  }
}
/*

            */
