class SubDistrictTH {
  final String subDistrictId;
  final String subDistrictCode;
  final String subDistrictName;
  final String districtID;
  final String provinceId;
  final String geoId;

  SubDistrictTH({
    required this.subDistrictId,
    required this.subDistrictCode,
    required this.subDistrictName,
    required this.districtID,
    required this.provinceId,
    required this.geoId,
  });

  factory SubDistrictTH.fromJson(Map<String, dynamic> json) {
    return SubDistrictTH(
      subDistrictId: json['SUB_DISTRICT_ID'].toString(),
      subDistrictCode: json['SUB_DISTRICT_CODE'].toString(),
      subDistrictName: json['SUB_DISTRICT_NAME'].toString(),
      districtID: json['DISTRICT_ID'].toString(),
      provinceId: json['PROVINCE_ID'].toString(),
      geoId: json['GEO_ID'].toString(),
    );
  }

  static List<SubDistrictTH> fromJsonList(List list, String indexProvince) {
    // print(indexProvince);
    if (indexProvince == "0" || indexProvince == "null") {
      return list.map((item) => SubDistrictTH.fromJson(item)).toList();
    }
    return list
        .map((item) => SubDistrictTH.fromJson(item))
        .where((element) => element.districtID == indexProvince)
        .toList();
  }

  @override
  String toString() => subDistrictName;
}
