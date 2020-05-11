import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:iamrick/models/candlestick_series.dart';
import 'package:iamrick/models/most_recent_trade.dart';

class LoopringService {
  final baseUrl = 'https://api.loopring.io/api/v2/';

  Future<MostRecentTrade> getMostRecentTrade({String tradingPair}) async {
    String limit = '1';

    final response =
        await http.get(baseUrl + 'trade?market=$tradingPair&limit=$limit');

    if (response.statusCode == 200) {
      return MostRecentTrade.fromJSON(json: jsonDecode(response.body));
    } else {
      throw Exception('Failed to load most recent trade.');
    }
  }

  Future<CandlestickSeries> getCandlestickData({String tradingPair}) async {
    String interval = '1d';
    int startTime =
        DateTime.now().subtract(Duration(days: 20)).millisecondsSinceEpoch;
    int endTime = DateTime.now().millisecondsSinceEpoch;
    String limit = '20';

    final response = await http.get(baseUrl +
        'candlestick?market=$tradingPair&interval=$interval&start=$startTime&end=$endTime&limit=$limit');

    if (response.statusCode == 200) {
      return CandlestickSeries.fromJson(json: jsonDecode(response.body));
    } else {
      throw Exception('Failed to load candlestick data.');
    }
  }
}
