class SchoolLevel {
  String id;
  String name;

  SchoolLevel({
    required this.id,
    required this.name,
  });

  // to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  // to json
  factory SchoolLevel.fromJson(Map<String, dynamic> json) {
    return SchoolLevel(
      id: json['id'],
      name: json['name'],
    );
  }

  // from json
  static List<SchoolLevel> fromJsonList(List list) {
    if (list.isEmpty) return [];
    return list.map((item) => SchoolLevel.fromJson(item)).toList();
  }

  // to string
  @override
  String toString() {
    return 'SchoolLevel{id: $id, name: $name}';
  }
}
