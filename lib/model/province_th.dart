class ProvinceTH {
  final String provinceId;
  final String provinceCode;
  final String provinceName;
  final String geoId;

  ProvinceTH({
    required this.provinceId,
    required this.provinceCode,
    required this.provinceName,
    required this.geoId,
  });

  factory ProvinceTH.fromJson(Map<String, dynamic> json) {
    return ProvinceTH(
      provinceId: json['PROVINCE_ID'].toString(),
      provinceCode: json['PROVINCE_CODE'].toString(),
      provinceName: json['PROVINCE_NAME'].toString(),
      geoId: json['GEO_ID'].toString(),
    );
  }

  static List<ProvinceTH> fromJsonList(List list) {
    return list.map((item) => ProvinceTH.fromJson(item)).toList();
  }

  @override
  String toString() => provinceName;
}
