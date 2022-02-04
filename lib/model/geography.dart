class Geography {
  final String id;
  final String name;

  Geography({
    required this.id,
    required this.name,
  });

  factory Geography.fromJson(Map<String, dynamic> json) {
    return Geography(
      id: json['id'],
      name: json['name'],
    );
  }

  static List<Geography> fromJsonList(List list) {
    return list.map((item) => Geography.fromJson(item)).toList();
  }

  @override
  String toString() => name;
}
