import 'dart:developer';
import 'dart:ffi';
import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? lontitude;

  Future<Void?> getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      latitude = position.latitude;
      lontitude = position.longitude;
      throw '';
    } catch (e) {
      log('$e');
    }
  }
}
