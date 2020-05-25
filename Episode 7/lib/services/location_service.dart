import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> getPosition() async {
    try {
      return await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
    } catch (e) {
      throw Exception('Failed to get position: $e');
    }
  }

  Future<Placemark> getPlacemark() async {
    Position position = await getPosition();
    try {
      List<Placemark> placemarks =
          await Geolocator().placemarkFromPosition(position);
      return placemarks[0];
    } catch (e) {
      throw Exception('Failed to get placemark: $e');
    }
  }
}
