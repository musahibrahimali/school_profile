class LikesModel {
  String? schoolId;
  String? userId;

  LikesModel({
    this.schoolId,
    this.userId,
  });

  factory LikesModel.fromJson(Map<String, dynamic> json) => LikesModel(
        schoolId: json["school_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "school_id": schoolId,
        "user_id": userId,
      };

  // copy with
  LikesModel copyWith({
    String? schoolId,
    String? userId,
  }) {
    return LikesModel(
      schoolId: schoolId ?? this.schoolId,
      userId: userId ?? this.userId,
    );
  }
}
