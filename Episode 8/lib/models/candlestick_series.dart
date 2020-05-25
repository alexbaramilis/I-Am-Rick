import 'package:iamrick/models/candlestick.dart';

class CandlestickSeries {
  final List<Candlestick> candlesticks;

  CandlestickSeries({this.candlesticks});

  factory CandlestickSeries.fromJson({Map<String, dynamic> json}) {
    List<Candlestick> candlestickSeries = [];
    for (dynamic candlestickData in json['data']) {
      candlestickSeries.add(
        Candlestick(
          open: double.parse(candlestickData[2]),
          close: double.parse(candlestickData[3]),
          high: double.parse(candlestickData[4]),
          low: double.parse(candlestickData[5]),
          volume: double.parse(candlestickData[7]),
        ),
      );
    }
    return CandlestickSeries(candlesticks: candlestickSeries);
  }

  List<Map<String, double>> formatDataForOHLCVGraph() {
    List<Map<String, double>> candlestickData = [];
    for (Candlestick candlestick in candlesticks.reversed) {
      candlestickData.add({
        'open': candlestick.open,
        'high': candlestick.high,
        'low': candlestick.low,
        'close': candlestick.close,
        'volumeto': candlestick.volume,
      });
    }
    return candlestickData;
  }

  static List<Map<String, double>> sampleData = [
    {"open": 50.0, "high": 100.0, "low": 40.0, "close": 80, "volumeto": 5000.0},
    {"open": 80.0, "high": 90.0, "low": 55.0, "close": 65, "volumeto": 4000.0},
    {"open": 65.0, "high": 120.0, "low": 60.0, "close": 90, "volumeto": 7000.0},
    {"open": 90.0, "high": 95.0, "low": 85.0, "close": 80, "volumeto": 2000.0},
    {"open": 80.0, "high": 85.0, "low": 40.0, "close": 50, "volumeto": 3000.0},
    {"open": 50.0, "high": 100.0, "low": 40.0, "close": 80, "volumeto": 5000.0},
    {"open": 80.0, "high": 90.0, "low": 55.0, "close": 65, "volumeto": 4000.0},
    {"open": 65.0, "high": 120.0, "low": 60.0, "close": 90, "volumeto": 7000.0},
    {"open": 90.0, "high": 95.0, "low": 85.0, "close": 80, "volumeto": 2000.0},
    {"open": 80.0, "high": 85.0, "low": 40.0, "close": 50, "volumeto": 3000.0},
    {"open": 50.0, "high": 100.0, "low": 40.0, "close": 80, "volumeto": 5000.0},
    {"open": 80.0, "high": 90.0, "low": 55.0, "close": 65, "volumeto": 4000.0},
    {"open": 65.0, "high": 120.0, "low": 60.0, "close": 90, "volumeto": 7000.0},
    {"open": 90.0, "high": 95.0, "low": 85.0, "close": 80, "volumeto": 2000.0},
    {"open": 80.0, "high": 85.0, "low": 40.0, "close": 50, "volumeto": 3000.0},
  ];
}
