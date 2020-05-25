import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:iamrick/models/coronavirus_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:alpha2_countries/alpha2_countries.dart';

class CoronavirusService {
  final baseUrl = 'https://coronavirus-tracker-api.herokuapp.com/v2/';

  Future<CoronavirusData> getLatestData() async {
    final response = await http.get(baseUrl + 'latest');

    if (response.statusCode == 200) {
      return CoronavirusData.formatted(
        json: jsonDecode(response.body),
        country: 'Global',
      );
    } else {
      throw Exception('Failed to load latest coronavirus data.');
    }
  }

  Future<CoronavirusData> getLocationDataFromPlacemark(
      Placemark placemark) async {
    final response = await http
        .get(baseUrl + 'locations?country_code=${placemark.isoCountryCode}');

    if (response.statusCode == 200) {
      return CoronavirusData.formatted(
        json: jsonDecode(response.body),
        country: placemark.country,
      );
    } else {
      throw Exception('Failed to load local coronavirus data.');
    }
  }

  Future<CoronavirusData> getLocationDataFromCountryCode(
      String countryCode) async {
    final response =
        await http.get(baseUrl + 'locations?country_code=$countryCode');

    if (response.statusCode == 200) {
      return CoronavirusData.formatted(
        json: jsonDecode(response.body),
        country: Countries().resolveName(countryCode),
      );
    } else {
      throw Exception('Failed to load coronavirus data from search.');
    }
  }

  // LEGACY

//  Future<CoronavirusData> getLocationData(Placemark placemark) async {
//    if (false) {
//      return await getMockLocationData(placemark);
//    }
//
//    final response = await http
//        .get(baseUrl + 'locations?country_code=${placemark.isoCountryCode}');
//
//    if (response.statusCode == 200) {
////      return CoronavirusData.byMatchingLocation(
////        json: jsonDecode(response.body),
////        placemark: placemark,
////      );
//      return CoronavirusData.formatted(
//        json: jsonDecode(response.body),
//        country: placemark.country,
//      );
//    } else {
//      throw Exception('Failed to load local coronavirus data.');
//    }
//  }

// to use mock data import 'package:flutter/services.dart' show rootBundle; at the top

//  Future<CoronavirusData> getMockLocationData(Placemark placemark) async {
//    String locations =
//        await rootBundle.loadString('sample_data/locations.json');
//
//    //someDataAnalysis(json: jsonDecode(locations));
//
//    return CoronavirusData.byMatchingLocation(
//      json: jsonDecode(locations),
//      placemark: placemark,
//    );
//  }

  // ---------------------
  //
  // Data analysis methods
  //
  // ---------------------

//  Future<void> someDataAnalysis({Map<String, dynamic> json}) async {
//    // Organise locations by country
//    Map<String, List<dynamic>> locationsByCountry = Map();
//    for (dynamic location in json['locations']) {
//      if (locationsByCountry == null) {
//        locationsByCountry[location['country']] = [location];
//      } else {
//        if (locationsByCountry.containsKey(location['country'])) {
//          locationsByCountry[location['country']].add(location);
//        } else {
//          locationsByCountry[location['country']] = [location];
//        }
//      }
//    }
//    // Show countries with multiple locations
//    List<String> countriesWithMultipleLocations = List();
//    locationsByCountry.forEach((country, locations) {
//      if (locations.length > 1) {
//        countriesWithMultipleLocations.add(country);
//      }
//    });
//    print(countriesWithMultipleLocations);
//    // Organise locations by country code
//    Map<String, List<dynamic>> locationsByCountryCode = Map();
//    for (dynamic location in json['locations']) {
//      if (locationsByCountryCode == null) {
//        locationsByCountryCode[location['country_code']] = [location];
//      } else {
//        if (locationsByCountryCode.containsKey(location['country_code'])) {
//          locationsByCountryCode[location['country_code']].add(location);
//        } else {
//          locationsByCountryCode[location['country_code']] = [location];
//        }
//      }
//    }
//    // Show country codes with multiple locations
//    List<String> countryCodesWithMultipleLocations = List();
//    locationsByCountryCode.forEach((countryCode, locations) {
//      if (locations.length > 1) {
//        countryCodesWithMultipleLocations.add(countryCode);
//      }
//    });
//    print(countryCodesWithMultipleLocations);
//    // Compare provinces with placemark data (all at once -> gets throttled)
////    await Future.forEach(countriesWithMultipleLocations, (country) async {
////      printProvinces(locations: locationsByCountry[country]);
////      await printPlacemarkData(locations: locationsByCountry[country]);
////    });
//    // Compare provinces with placemark data (one by one)
//    // can also use .getRange(start, end) to reduce results
//    String country = 'Canada';
//    printProvinces(locations: locationsByCountry[country]);
//    printPlacemarkData(locations: locationsByCountry[country]);
//  }
//
//  void printProvinces({dynamic locations}) {
//    List<String> provinces = List();
//    locations.forEach((location) {
//      provinces.add(location['province']);
//    });
//    print(provinces);
//  }
//
//  Future<void> printPlacemarkData({dynamic locations}) async {
//    List<String> names = List();
//    List<String> administrativeAreas = List();
//    List<String> subAdministrativeAreas = List();
//    List<String> localities = List();
//    List<String> subLocalities = List();
//    List<String> thoroughfares = List();
//    List<String> aubThoroughfares = List();
//    Geolocator geolocator = Geolocator();
//    await Future.forEach(locations, (location) async {
//      double latitude = double.parse(location['coordinates']['latitude']);
//      double longitude = double.parse(location['coordinates']['longitude']);
//      List<Placemark> placemarks =
//          await geolocator.placemarkFromCoordinates(latitude, longitude);
//      names.add(placemarks[0].name);
//      administrativeAreas.add(placemarks[0].administrativeArea);
//      subAdministrativeAreas.add(placemarks[0].subAdministrativeArea);
//      localities.add(placemarks[0].locality);
//      subLocalities.add(placemarks[0].subLocality);
//      thoroughfares.add(placemarks[0].thoroughfare);
//      aubThoroughfares.add(placemarks[0].subThoroughfare);
//    });
//    print(names);
//    print(administrativeAreas);
//    print(subAdministrativeAreas);
//    print(localities);
//    print(subLocalities);
//    print(thoroughfares);
//    print(aubThoroughfares);
//  }
}
