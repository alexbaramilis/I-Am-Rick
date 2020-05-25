import 'package:flutter/material.dart';
import 'package:iamrick/models/candlestick_series.dart';
import 'package:iamrick/models/most_recent_trade.dart';
import 'package:iamrick/utilities/constants.dart';
import 'dart:io' show Platform;
import 'package:iamrick/components/android_dropdown.dart';
import 'package:iamrick/components/iOS_picker.dart';
import 'package:iamrick/services/loopring_service.dart';
import 'package:iamrick/components/most_recent_trade_container.dart';
import 'package:iamrick/components/spin_container.dart';
import 'package:iamrick/components/error_container.dart';
import 'package:iamrick/components/trading_view.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String selectedTradingPair = kInitialTradingPair;
  LoopringService loopringService = LoopringService();
  Future<MostRecentTrade> futureMostRecentTrade;
  Future<CandlestickSeries> futureCandlestickSeries;

  void refresh() {
    futureMostRecentTrade =
        loopringService.getMostRecentTrade(tradingPair: selectedTradingPair);
    futureCandlestickSeries =
        loopringService.getCandlestickData(tradingPair: selectedTradingPair);
  }

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick\'s DEX'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            futureBuildMostRecentTrade(),
            futureBuildTradingView(),
            buildTradingPairSelector(),
            buildPoweredBy(),
          ],
        ),
      ),
    );
  }

  FutureBuilder<MostRecentTrade> futureBuildMostRecentTrade() {
    return FutureBuilder<MostRecentTrade>(
      future: futureMostRecentTrade,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return SpinContainer(height: kHeightMostRecentTrade);
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return MostRecentTradeContainer(
                selectedTradingPair: selectedTradingPair,
                mostRecentTrade: snapshot.data,
              );
            } else if (snapshot.hasError) {
              return ErrorContainer(
                height: kHeightMostRecentTrade,
                errorMessage: snapshot.error.toString(),
              );
            }
        }
        return Container();
      },
    );
  }

  FutureBuilder<CandlestickSeries> futureBuildTradingView() {
    return FutureBuilder<CandlestickSeries>(
      future: futureCandlestickSeries,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return SpinContainer(height: calculateTradingViewHeight());
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return TradingView(
                height: calculateTradingViewHeight(),
                candlestickSeries: snapshot.data,
              );
            } else if (snapshot.hasError) {
              return ErrorContainer(
                height: calculateTradingViewHeight(),
                errorMessage: snapshot.error.toString(),
              );
            }
        }
        return Container();
      },
    );
  }

  double calculateTradingViewHeight() {
    // full screen height
    double height = MediaQuery.of(context).size.height;
    // height without SafeArea
    var padding = MediaQuery.of(context).padding;
    height = height - padding.top - padding.bottom;
    // height without widgets
    for (double widgetHeight in kWidgetHeights) {
      height = height - widgetHeight - kHeightMargin;
    }
    return height;
  }

  Container buildTradingPairSelector() {
    return Container(
      height: kHeightTradingPair,
      color: kColourBackgroundDark,
      alignment: Alignment.center,
      child: Platform.isIOS
          ? IOSPicker(
              selectedTradingPair: selectedTradingPair,
              onPickerChanged: (selectedItemIndex) {
                setState(() {
                  selectedTradingPair = kTradingPairs[selectedItemIndex];
                });
                refresh();
              },
            )
          : AndroidDropdown(
              selectedTradingPair: selectedTradingPair,
              onDropdownChanged: (value) {
                setState(() {
                  selectedTradingPair = value;
                });
                refresh();
              },
            ),
    );
  }

  Container buildPoweredBy() {
    return Container(
      height: kHeightPoweredBy,
      color: kColourBackgroundDark,
      alignment: Alignment.center,
      child: Text(
        'Powered by Loopring.io',
        textAlign: TextAlign.center,
        style: kTextStylePoweredBy,
      ),
    );
  }
}
