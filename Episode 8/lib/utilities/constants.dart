import 'package:flutter/material.dart';

final kColourPrimary = Colors.red[800];

final kColourBackgroundDark = Color.fromRGBO(28, 29, 36, 1.0);
final kColourBackgroundDarker = Color.fromRGBO(21, 22, 24, 1.0);

final kColourDecrease = Color.fromRGBO(252, 54, 59, 1.0);
final kColourIncrease = Color.fromRGBO(60, 202, 35, 1.0);

const kTextStyleMostRecentTrade = TextStyle(
  color: Colors.white,
  fontSize: 24,
);
final kTextStyleMostRecentTradeBuy = TextStyle(
  color: kColourIncrease,
  fontSize: 24,
);
final kTextStyleMostRecentTradeSell = TextStyle(
  color: kColourDecrease,
  fontSize: 24,
);
final kTextStyleMostRecentTradeTime = TextStyle(
  color: Colors.white70,
  fontSize: 18,
);

const kTextStyleTradingPair = TextStyle(
  color: Colors.white,
  fontSize: 21,
);

const kTextStylePoweredBy = TextStyle(
  color: Colors.white70,
  fontSize: 18,
);

const kTextStyleError = TextStyle(
  color: Colors.white,
  fontSize: 18,
);

const kHeightMostRecentTrade = 90.0;
const kHeightTradingPair = 100.0;
const kHeightPoweredBy = 60.0;
const kWidgetHeights = [
  kHeightMostRecentTrade,
  kHeightTradingPair,
  kHeightPoweredBy
];
const kHeightMargin = 40;

const List<String> kTradingPairs = [
  'LRC-USDT',
  'LRC-ETH',
  'ETH-USDT',
  'ETH-DAI',
  'USDT-DAI',
  'LINK-ETH',
];
const kInitialTradingPair = 'LRC-USDT';
