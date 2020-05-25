class MostRecentTrade {
  final DateTime time;
  final String direction;
  final double price;

  MostRecentTrade.fromJSON({Map<String, dynamic> json})
      : time = DateTime.fromMillisecondsSinceEpoch(
            int.parse(json['data']['trades'][0][0])),
        direction = json['data']['trades'][0][2],
        price = double.parse(json['data']['trades'][0][4]);
}
