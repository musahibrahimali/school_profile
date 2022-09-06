import 'package:school_profile/index.dart';

class SchoolModel {
  // text editing controllers
  String? id;
  String? userId;
  String? name;
  String? slogan;
  String? category;
  String? level;
  String? yearOfEstablishment;
  String? emailAddress;
  String? phoneNumber;
  String? address;
  Address? mapAddress;
  String? region;
  String? district;
  String? town;
  String? nameOfHeadTeacher;
  String? studentsPopulation;
  String? teachersPopulation;
  String? nonTeachingStaffPopulation;
  String? history;
  String? awards;
  String? rating;
  String? facilities;
  String? performance;
  String? feeRange;
  String? extraCurricular;
  String? avatar;
  List<dynamic>? images;
  List<dynamic>? videos;
  List<ReviewModel>? reviews;
  List<LikesModel>? likes;

  SchoolModel({
    this.id,
    this.userId,
    this.name,
    this.address,
    this.mapAddress,
    this.nameOfHeadTeacher,
    this.yearOfEstablishment,
    this.slogan,
    this.region,
    this.district,
    this.town,
    this.studentsPopulation,
    this.teachersPopulation,
    this.nonTeachingStaffPopulation,
    this.rating,
    this.awards,
    this.history,
    this.facilities,
    this.performance,
    this.emailAddress,
    this.phoneNumber,
    this.images,
    this.videos,
    this.category,
    this.level,
    this.reviews,
    this.likes,
    this.avatar,
    this.extraCurricular,
    this.feeRange,
  });

  // from json
  factory SchoolModel.fromJson(Map<dynamic, dynamic> json) {
    return SchoolModel(
      id: json['uid'] ?? "",
      userId: json['userId'] ?? "",
      name: json['name'] ?? "",
      address: json['address'] ?? "",
      mapAddress: Address(
        placeId: json['mapAddress']['placeId'],
        latitude: json['mapAddress']['latitude'],
        longitude: json['mapAddress']['longitude'],
        placeName: json['mapAddress']['placeName'],
        placeFormattedAddress: json['mapAddress']['placeFormattedAddress'],
      ),
      nameOfHeadTeacher: json['nameOfHeadTeacher'] ?? "",
      yearOfEstablishment: json['yearOfEstablishment'] ?? "",
      slogan: json['slogan'] ?? "",
      region: json['region'] ?? "",
      district: json['district'] ?? "",
      town: json['town'] ?? "",
      studentsPopulation: json['studentsPopulation'] ?? "",
      teachersPopulation: json['teachersPopulation'] ?? "",
      nonTeachingStaffPopulation: json['nonTeachingStaffPopulation'] ?? "",
      rating: json['rating'] ?? "",
      awards: json['awards'] ?? "",
      history: json['history'] ?? "",
      facilities: json['facilities'] ?? "",
      performance: json['performance'] ?? "",
      emailAddress: json['emailAddress'] ?? "",
      phoneNumber: json['phoneNumber'] ?? "",
      category: json['category'] ?? "",
      level: json['level'] ?? "",
      feeRange: json['feeRange'] ?? "",
      extraCurricular: json['extraCurricular'] ?? "",
      avatar: json['avatar'] ?? "",
      images: json['images'] ?? [],
      videos: json['videos'] ?? [],
      reviews: json['reviews'] ?? [],
      likes: json['likes'] ?? [],
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'address': address,
      'mapAddress': mapAddress?.toJson(),
      'nameOfHeadTeacher': nameOfHeadTeacher,
      'yearOfEstablishment': yearOfEstablishment,
      'slogan': slogan,
      'region': region,
      'district': district,
      'town': town,
      'studentsPopulation': studentsPopulation,
      'teachersPopulation': teachersPopulation,
      'nonTeachingStaffPopulation': nonTeachingStaffPopulation,
      'rating': rating,
      'awards': awards,
      'history': history,
      'facilities': facilities,
      'performance': performance,
      'emailAddress': emailAddress,
      'phoneNumber': phoneNumber,
      'category': category,
      'level': level,
      'images': images,
      'videos': videos,
      'reviews': reviews,
      'likes': likes,
      'avatar': avatar,
      'feeRange': feeRange,
      'extraCurricular': extraCurricular,
    };
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'address': address,
      'mapAddress': mapAddress?.toMap(),
      'nameOfHeadTeacher': nameOfHeadTeacher,
      'yearOfEstablishment': yearOfEstablishment,
      'slogan': slogan,
      'region': region,
      'district': district,
      'town': town,
      'studentsPopulation': studentsPopulation,
      'teachersPopulation': teachersPopulation,
      'nonTeachingStaffPopulation': nonTeachingStaffPopulation,
      'rating': rating,
      'awards': awards,
      'history': history,
      'facilities': facilities,
      'performance': performance,
      'emailAddress': emailAddress,
      'phoneNumber': phoneNumber,
      'category': category,
      'level': level,
      'images': images,
      'videos': videos,
      'reviews': reviews,
      'likes': likes,
      'avatar': avatar,
      'feeRange': feeRange,
      'extraCurricular': extraCurricular,
    };
  }

  // copy with
  SchoolModel copyWith({
    String? id,
    String? userId,
    String? name,
    String? address,
    Address? mapAddress,
    String? nameOfHeadTeacher,
    String? yearOfEstablishment,
    String? slogan,
    String? region,
    String? district,
    String? town,
    String? studentsPopulation,
    String? teachersPopulation,
    String? nonTeachingStaffPopulation,
    String? rating,
    String? awards,
    String? history,
    String? facilities,
    String? performance,
    String? emailAddress,
    String? phoneNumber,
    String? category,
    String? level,
    List<dynamic>? images,
    List<dynamic>? videos,
    List<ReviewModel>? reviews,
    List<LikesModel>? likes,
    String? avatar,
    String? feeRange,
    String? extraCurricular,
  }) {
    return SchoolModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      address: address ?? this.address,
      mapAddress: mapAddress ?? this.mapAddress,
      nameOfHeadTeacher: nameOfHeadTeacher ?? this.nameOfHeadTeacher,
      yearOfEstablishment: yearOfEstablishment ?? this.yearOfEstablishment,
      slogan: slogan ?? this.slogan,
      region: region ?? this.region,
      district: district ?? this.district,
      town: town ?? this.town,
      studentsPopulation: studentsPopulation ?? this.studentsPopulation,
      teachersPopulation: teachersPopulation ?? this.teachersPopulation,
      nonTeachingStaffPopulation: nonTeachingStaffPopulation ?? this.nonTeachingStaffPopulation,
      rating: rating ?? this.rating,
      awards: awards ?? this.awards,
      history: history ?? this.history,
      facilities: facilities ?? this.facilities,
      performance: performance ?? this.performance,
      emailAddress: emailAddress ?? this.emailAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      category: category ?? this.category,
      level: level ?? this.level,
      images: images ?? this.images,
      videos: videos ?? this.videos,
      reviews: reviews ?? this.reviews,
      likes: likes ?? this.likes,
      avatar: avatar ?? this.avatar,
      feeRange: feeRange ?? this.feeRange,
      extraCurricular: extraCurricular ?? this.extraCurricular,
    );
  }
}
