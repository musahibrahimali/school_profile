class ReviewModel {
  String? userId;
  String? schoolId;
  String? review;
  String? date;

  ReviewModel({
    this.userId,
    this.schoolId,
    this.review,
    this.date,
  });

  // from json
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      userId: json['userId'] ?? "",
      schoolId: json['schoolId'] ?? "",
      review: json['review'] ?? "",
      date: json['date'] ?? "",
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'schoolId': schoolId,
      'review': review,
      'date': date,
    };
  }

  // copy with
  ReviewModel copyWith({
    String? userId,
    String? schoolId,
    String? review,
    String? rating,
    String? date,
  }) {
    return ReviewModel(
      userId: userId ?? this.userId,
      schoolId: schoolId ?? this.schoolId,
      review: review ?? this.review,
      date: date ?? this.date,
    );
  }
}
