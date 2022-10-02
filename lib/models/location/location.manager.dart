import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationManager {
  Future<Location> getCurrentLocation() async {
    //↓↓↓↓↓↓↓ geolocatorバージョン8.0以上で追記が必要な部分開始 ↓↓↓↓↓↓↓
    //（パーミッションチェック（Geolocator.checkPermission()）の追加要）
    //https://pub.dev/packages/geolocator/changelog#800
    //https://pub.dev/packages/geolocator#example

    final isLocationServiceEnabled =
        await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      return Future.error("位置情報サービスがオフになっています");
    }
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("位置情報へのアクセスをユーザーに拒否されました");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("位置情報へのアクセスが永久に拒否されており、リクエストすらできません。");
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final placeMarks = await geoCoding.placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    final placeMark = placeMarks.first;
    return Future.value(
      convert(
        placeMark,
        position.latitude,
        position.longitude,
      ),
    );
  }

  Future<Location> updateLocation(double latitude, double longitude) async {
    final placeMarks =
        await geoCoding.placemarkFromCoordinates(latitude, longitude);
    final placeMark = placeMarks.first;
    return Future.value(convert(placeMark, latitude, longitude));
  }

  Location convert(
      geoCoding.Placemark placeMark, double latitude, double longitude) {
    return Location(
      latitude: latitude,
      longitude: longitude,
      country: placeMark.country ?? "",
      state: placeMark.administrativeArea ?? "",
      city: placeMark.locality ?? "",
    );
  }
}
