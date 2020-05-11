import 'package:flutter/material.dart';
import 'package:iamrick/models/most_recent_trade.dart';
import 'package:iamrick/utilities/constants.dart';
import 'package:intl/intl.dart';

class MostRecentTradeContainer extends StatelessWidget {
  final String selectedTradingPair;
  final MostRecentTrade mostRecentTrade;

  MostRecentTradeContainer({
    @required this.selectedTradingPair,
    @required this.mostRecentTrade,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kHeightMostRecentTrade,
      color: kColourBackgroundDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$selectedTradingPair: ',
                style: kTextStyleMostRecentTrade,
              ),
              Text(
                '${mostRecentTrade.price}',
                style: mostRecentTrade.direction == 'BUY'
                    ? kTextStyleMostRecentTradeBuy
                    : kTextStyleMostRecentTradeSell,
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            DateFormat('EEEE d MMMM y H:m').format(mostRecentTrade.time),
            style: kTextStyleMostRecentTradeTime,
          ),
        ],
      ),
    );
  }
}
