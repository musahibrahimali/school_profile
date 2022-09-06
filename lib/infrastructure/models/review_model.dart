class ReviewModel {
  String? id;
  String? userId;
  String? schoolId;
  String? review;
  String? date;

  ReviewModel({
    this.id,
    this.userId,
    this.schoolId,
    this.review,
    this.date,
  });

  // from json
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['uid'] ?? "",
      userId: json['userId'] ?? "",
      schoolId: json['schoolId'] ?? "",
      review: json['review'] ?? "",
      date: json['date'] ?? "",
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'schoolId': schoolId,
      'review': review,
      'date': date,
    };
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'schoolId': schoolId,
      'review': review,
      'date': date,
    };
  }

  // copy with
  ReviewModel copyWith({
    String? id,
    String? userId,
    String? schoolId,
    String? review,
    String? rating,
    String? date,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      schoolId: schoolId ?? this.schoolId,
      review: review ?? this.review,
      date: date ?? this.date,
    );
  }
}
