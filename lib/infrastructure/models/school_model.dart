import 'package:school_profile/index.dart';

class SchoolModel {
  // text editing controllers
  String? name;
  String? slogan;
  String? category;
  String? yearOfEstablishment;
  String? emailAddress;
  String? phoneNumber;
  String? address;
  String? mapAddress;
  String? region;
  String? district;
  String? nameOfHeadTeacher;
  String? studentsPopulation;
  String? teachersPopulation;
  String? nonTeachingStaffPopulation;
  String? history;
  String? awards;
  String? rating;
  String? facilities;
  String? performance;
  List<dynamic>? images;
  List<dynamic>? videos;
  List<ReviewModel>? reviews;

  SchoolModel({
    this.name,
    this.address,
    this.mapAddress,
    this.nameOfHeadTeacher,
    this.yearOfEstablishment,
    this.slogan,
    this.region,
    this.district,
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
    this.reviews,
  });

  // from json
  factory SchoolModel.fromJson(Map<String, dynamic> json) {
    return SchoolModel(
      name: json['name'] ?? "",
      address: json['address'] ?? "",
      mapAddress: json['mapAddress'] ?? "",
      nameOfHeadTeacher: json['nameOfHeadTeacher'] ?? "",
      yearOfEstablishment: json['yearOfEstablishment'] ?? "",
      slogan: json['slogan'] ?? "",
      region: json['region'] ?? "",
      district: json['district'] ?? "",
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
      images: json['images'] ?? [],
      videos: json['videos'] ?? [],
      reviews: json['reviews'] ?? [],
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'mapAddress': mapAddress,
      'nameOfHeadTeacher': nameOfHeadTeacher,
      'yearOfEstablishment': yearOfEstablishment,
      'slogan': slogan,
      'region': region,
      'district': district,
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
      'images': images,
      'videos': videos,
      'reviews': reviews,
    };
  }

  // copy with
  SchoolModel copyWith({
    String? name,
    String? address,
    String? mapAddress,
    String? nameOfHeadTeacher,
    String? yearOfEstablishment,
    String? slogan,
    String? region,
    String? district,
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
    List<dynamic>? images,
    List<dynamic>? videos,
    List<ReviewModel>? reviews,
  }) {
    return SchoolModel(
      name: name ?? this.name,
      address: address ?? this.address,
      mapAddress: mapAddress ?? this.mapAddress,
      nameOfHeadTeacher: nameOfHeadTeacher ?? this.nameOfHeadTeacher,
      yearOfEstablishment: yearOfEstablishment ?? this.yearOfEstablishment,
      slogan: slogan ?? this.slogan,
      region: region ?? this.region,
      district: district ?? this.district,
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
      images: images ?? this.images,
      videos: videos ?? this.videos,
      reviews: reviews ?? this.reviews,
    );
  }
}
