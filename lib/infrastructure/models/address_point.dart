class SchoolMapAddress {
  String addressName;
  double addressLatitude;
  double addressLongitude;
  String addressPlaceId;
  String addressPlaceFormattedAddress;

  SchoolMapAddress({
    required this.addressPlaceId,
    required this.addressLatitude,
    required this.addressLongitude,
    required this.addressName,
    required this.addressPlaceFormattedAddress,
  });
}
