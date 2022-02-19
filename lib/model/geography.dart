class Geography {
  final String geographiesId;
  final String nameGeo;

  Geography({
    required this.geographiesId,
    required this.nameGeo,
  });

  factory Geography.fromJson(Map<String, dynamic> json) {
    return Geography(
      geographiesId: json["geographies_ID"],
      nameGeo: json["name_geo"],
    );
  }

  static List<Geography> fromJsonList(List list) {
    return list.map((item) => Geography.fromJson(item)).toList();
  }

  @override
  String toString() => nameGeo;
}
