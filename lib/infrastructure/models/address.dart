class Address {
  String? placeName;
  double? latitude;
  double? longitude;
  String? placeId;
  String? placeFormattedAddress;

  Address({
    this.placeId,
    this.latitude,
    this.longitude,
    this.placeName,
    this.placeFormattedAddress,
  });

  // to map
  Map<String, dynamic> toMap() {
    return {
      'placeId': placeId,
      'latitude': latitude,
      'longitude': longitude,
      'placeName': placeName,
      'placeFormattedAddress': placeFormattedAddress,
    };
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'placeId': placeId,
      'latitude': latitude,
      'longitude': longitude,
      'placeName': placeName,
      'placeFormattedAddress': placeFormattedAddress,
    };
  }

  // from json
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      placeId: json['placeId'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      placeName: json['placeName'],
      placeFormattedAddress: json['placeFormattedAddress'],
    );
  }

  // from map
  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      placeId: map['placeId'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      placeName: map['placeName'],
      placeFormattedAddress: map['placeFormattedAddress'],
    );
  }

  // to string
  @override
  String toString() {
    return "$placeId $placeName $latitude $longitude $placeName $placeFormattedAddress";
  }

  // copy with
  Address copyWith({
    String? placeId,
    double? latitude,
    double? longitude,
    String? placeName,
    String? placeFormattedAddress,
  }) {
    return Address(
      placeId: placeId ?? this.placeId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      placeName: placeName ?? this.placeName,
      placeFormattedAddress: placeFormattedAddress ?? this.placeFormattedAddress,
    );
  }
}
