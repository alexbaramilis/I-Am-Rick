import 'package:flutter/material.dart';
import 'package:iamrick/models/candlestick_series.dart';
import 'package:iamrick/utilities/constants.dart';
import 'package:flutter_candlesticks/flutter_candlesticks.dart';

class TradingView extends StatelessWidget {
  final double height;
  final CandlestickSeries candlestickSeries;

  TradingView({
    @required this.height,
    @required this.candlestickSeries,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: kColourBackgroundDark,
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: OHLCVGraph(
        data: candlestickSeries.formatDataForOHLCVGraph(),
        enableGridLines: true,
        volumeProp: 0.1,
        decreaseColor: kColourDecrease,
        increaseColor: kColourIncrease,
        lineWidth: 1.5,
        labelPrefix: '',
      ),
    );
  }
}
