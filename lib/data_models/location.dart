import 'package:flutter/material.dart';

class Location {
  final double latitude;
  final double longitude;
  final String country;
  final String state;
  final String city;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Location({
    //TODO [Null-Safety] @required => requiredに
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.state,
    required this.city,
  });

  Location copyWith({
    //TODO [Null-Safety] copyWithメソッドの引数Nullableに
    double? latitude,
    double? longitude,
    String? country,
    String? state,
    String? city,
  }) {
    if ((latitude == null || identical(latitude, this.latitude)) &&
        (longitude == null || identical(longitude, this.longitude)) &&
        (country == null || identical(country, this.country)) &&
        (state == null || identical(state, this.state)) &&
        (city == null || identical(city, this.city))) {
      return this;
    }

    return new Location(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
    );
  }

  @override
  String toString() {
    return 'Location{latitude: $latitude, longitude: $longitude, country: $country, state: $state, city: $city}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Location &&
          runtimeType == other.runtimeType &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          country == other.country &&
          state == other.state &&
          city == other.city);

  @override
  int get hashCode =>
      latitude.hashCode ^
      longitude.hashCode ^
      country.hashCode ^
      state.hashCode ^
      city.hashCode;

  factory Location.fromMap(Map<String, dynamic> map) {
    return new Location(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      country: map['country'] as String,
      state: map['state'] as String,
      city: map['city'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'latitude': this.latitude,
      'longitude': this.longitude,
      'country': this.country,
      'state': this.state,
      'city': this.city,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
