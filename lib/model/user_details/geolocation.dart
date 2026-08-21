import 'dart:convert';

class Geolocation {
  String? lat;
  String? long;

  Geolocation({this.lat, this.long});

  factory Geolocation.fromMap(Map<String, dynamic> data) =>
      Geolocation(lat: data['lat'] as String?, long: data['long'] as String?);

  Map<String, dynamic> toMap() => {'lat': lat, 'long': long};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Geolocation].
  factory Geolocation.fromJson(String data) {
    return Geolocation.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Geolocation] to a JSON string.
  String toJson() => json.encode(toMap());
}
