import 'package:geolocator/geolocator.dart';
import 'package:slr_sharemap/data_models/location.dart';

class LocationManager {
  Future<Location> getCurrentLocation() async {
    final isLocationServiceEnabled =
        await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      return Future.error("位置情報サービスがオフになっています。");
    }
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("位置情報へのアクセスをユーザーに拒否されました");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("位置情報へのアクセス許可がずっと拒否され続けております。");
    }
  }
}
