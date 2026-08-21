import 'dart:convert';

import 'geolocation.dart';

class Address {
  Geolocation? geolocation;
  String? city;
  String? street;
  int? number;
  String? zipcode;

  Address({
    this.geolocation,
    this.city,
    this.street,
    this.number,
    this.zipcode,
  });

  factory Address.fromMap(Map<String, dynamic> data) => Address(
    geolocation: data['geolocation'] == null
        ? null
        : Geolocation.fromMap(data['geolocation'] as Map<String, dynamic>),
    city: data['city'] as String?,
    street: data['street'] as String?,
    number: data['number'] as int?,
    zipcode: data['zipcode'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'geolocation': geolocation?.toMap(),
    'city': city,
    'street': street,
    'number': number,
    'zipcode': zipcode,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Address].
  factory Address.fromJson(String data) {
    return Address.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Address] to a JSON string.
  String toJson() => json.encode(toMap());
}
