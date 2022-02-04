class District {
  final String districtId;
  final String districtCode;
  final String districtName;
  final String provinceId;
  final String geodistrictId;

  District({
    required this.districtId,
    required this.districtCode,
    required this.districtName,
    required this.provinceId,
    required this.geodistrictId,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      districtId: json['DISTRICT_ID'].toString(),
      districtCode: json['DISTRICT_CODE'].toString(),
      districtName: json['DISTRICT_NAME'].toString(),
      provinceId: json['PROVINCE_ID'].toString(),
      geodistrictId: json['GEO_ID'].toString(),
    );
  }

  static List<District> fromJsonList(List list, String indexProvince) {
    if (indexProvince == "0" || (indexProvince == "null")) {
      return list.map((item) => District.fromJson(item)).toList();
    }
    return list
        .map((item) => District.fromJson(item))
        .where((element) => element.provinceId == indexProvince)
        .toList();
  }

  @override
  String toString() => districtName;
}
