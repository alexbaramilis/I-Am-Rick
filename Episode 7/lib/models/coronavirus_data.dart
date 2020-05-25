import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';

class CoronavirusData {
  final String date;
  final String locationLabel;
  final int totalNumber;
  final int recoveredNumber;
  final int deadNumber;
  final int sickNumber;
  final double sickPercentage;
  final double recoveredPercentage;
  final double deadPercentage;

  CoronavirusData(
      {@required this.date,
      @required this.locationLabel,
      @required this.totalNumber,
      @required this.recoveredNumber,
      @required this.deadNumber,
      @required this.sickNumber,
      @required this.sickPercentage,
      @required this.recoveredPercentage,
      @required this.deadPercentage});

  factory CoronavirusData.formatted({
    Map<String, dynamic> json,
    String country,
    String province,
  }) {
    int totalNumber = json['latest']['confirmed'];
    int recoveredNumber = json['latest']['recovered'];
    int deadNumber = json['latest']['deaths'];
    if (totalNumber == 0) {
      throw Exception('No confirmed cases in your area.');
    }
    int sickNumber = totalNumber - recoveredNumber - deadNumber;
    return CoronavirusData(
      date: DateFormat('EEEE d MMMM y').format(DateTime.now()),
      locationLabel: province == null ? country : '$country, $province',
      totalNumber: totalNumber,
      recoveredNumber: recoveredNumber,
      deadNumber: deadNumber,
      sickNumber: sickNumber,
      sickPercentage: sickNumber * 100.0 / totalNumber,
      recoveredPercentage: recoveredNumber * 100.0 / totalNumber,
      deadPercentage: deadNumber * 100.0 / totalNumber,
    );
  }

  // LEGACY

//  static Future<CoronavirusData> byMatchingLocation({
//    Map<String, dynamic> json,
//    Placemark placemark,
//  }) async {
//    List locations = json['locations'];
//    if (locations.length == 1) {
//      print('single location');
//      print(locations[0]);
//      return CoronavirusData.formatted(
//        json: locations[0],
//        country: locations[0]['country'],
//      );
//    } else if (locations.length > 1) {
//      dynamic provinceMatchedCountry;
//      for (dynamic location in locations) {
//        if (location['province'] == placemark.administrativeArea) {
//          print('province match');
//          print(location);
//          return CoronavirusData.formatted(
//            json: location,
//            country: location['country'],
//            province: location['province'],
//          );
//        }
//        if (location['province'] == location['country']) {
//          provinceMatchedCountry = location;
//        }
//      }
//      if (provinceMatchedCountry != null) {
//        print('province and country are equal');
//        print(provinceMatchedCountry);
//        return CoronavirusData.formatted(
//          json: provinceMatchedCountry,
//          country: provinceMatchedCountry['country'],
//        );
//      }
//      double minDistance = double.infinity;
//      dynamic nearestLocation;
//      Geolocator geolocator = Geolocator();
//      for (dynamic location in locations) {
//        double distance = await geolocator.distanceBetween(
//          placemark.position.latitude,
//          placemark.position.longitude,
//          double.parse(location['coordinates']['latitude']),
//          double.parse(location['coordinates']['longitude']),
//        );
//        if (distance < minDistance) {
//          minDistance = distance;
//          nearestLocation = location;
//        }
//      }
//      print('nearest location');
//      print(nearestLocation);
//      return CoronavirusData.formatted(
//        json: nearestLocation,
//        country: nearestLocation['country'],
//        province: nearestLocation['province'],
//      );
//    } else {
//      throw Exception('No locations found.');
//    }
//  }
//
//  // Constructor with mock data
//  factory CoronavirusData.mock() {
//    return CoronavirusData(
//      date: DateFormat('EEEE d MMMM y').format(DateTime.now()),
//      locationLabel: 'Global',
//      totalNumber: 197146,
//      recoveredNumber: 80840,
//      deadNumber: 7905,
//      sickNumber: 197146 - 80840 - 7905,
//      sickPercentage: (197146 - 80840 - 7905) * 100.0 / 197146,
//      recoveredPercentage: 80840 * 100.0 / 197146,
//      deadPercentage: 7905 * 100.0 / 197146,
//    );
//  }
}
