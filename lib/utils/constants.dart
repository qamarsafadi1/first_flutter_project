import 'package:flutter/material.dart';

const kBottomHeight = 80.0;
const kActiveCardColor = Color(0xFF1D1E33);
const kInactiveCardColor = Color(0xFF111328);
const kBottomButtonColor = Colors.pinkAccent;
const kApiKey = '271ad9cd074bea5c568c0d80d57ef676';
const kApiKeyCoin = 'C9B0DFE8-56FF-4CC9-BC0C-CC0AC80FB0DC';
const kOpenWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';
const kCoinUrl = 'https://rest.coinapi.io/v1/exchangerate';

const kTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  color: Colors.white,
);

const kTextButtonStyle = TextStyle(
  fontSize: 25.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
const kTextTitleStyle = TextStyle(
  fontSize: 35.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
const kResultTextTitleStyle = TextStyle(
  fontSize: 85.0,
  color: Colors.white,
  fontWeight: FontWeight.w900,
);

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kInputFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city, color: Colors.white),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide.none),
);
const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    hintText: 'Type your message here...',
    border: InputBorder.none,
    hintStyle: TextStyle(color: Colors.grey));

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
