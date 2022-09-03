import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? name;
  String? email;
  String? profile;
  bool? isAdmin;
  List<dynamic>? favorites;
  List<dynamic>? searchHistory;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.profile,
    this.favorites,
    this.searchHistory,
    this.isAdmin,
  });

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map["uid"] ?? "",
      name: map['name'] ?? "",
      email: map['email'] ?? "",
      profile: map['profile'] ?? "",
      isAdmin: map['isAdmin'] ?? false,
      favorites: map['favorites'] as List<dynamic>? ?? [],
      searchHistory: map['searchHistory'] as List<dynamic>? ?? [],
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'profile': profile,
      'favorites': favorites,
      'isAdmin': isAdmin,
      'searchHistory': searchHistory,
    };
  }

  // factory constructor
  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      uid: doc.id,
      name: doc['name'] ?? "",
      email: doc['email'] ?? "",
      profile: doc['profile'] ?? "",
      isAdmin: doc['isAdmin'] ?? false,
      favorites: doc['favorites'] as List<dynamic>? ?? [],
      searchHistory: doc['searchHistory'] as List<dynamic>? ?? [],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'profile': profile,
      'isAdmin': isAdmin,
      'favorites': favorites,
      'searchHistory': searchHistory,
    };
  }

  // copyWith method
  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? profile,
    bool? isAdmin,
    List<dynamic>? favorites,
    List<dynamic>? searchHistory,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      profile: profile ?? this.profile,
      isAdmin: isAdmin ?? this.isAdmin,
      favorites: favorites ?? this.favorites,
      searchHistory: searchHistory ?? this.searchHistory,
    );
  }
}
