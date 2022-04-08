import 'package:water_resources_application/provider/dataWater_provider.dart';

class District {
  String districtId;
  String nameDistrict;
  String nameEnDistrict;
  String provinceId;

  District({
    required this.districtId,
    required this.nameDistrict,
    required this.nameEnDistrict,
    required this.provinceId,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      districtId: json["district_ID"],
      nameDistrict: json["name_district"],
      nameEnDistrict: json["name_en_district"],
      provinceId: json["province_ID"],
    );
  }

  static List<District> fromJsonList(
      List list, String indexProvince, DataWater waterProvider) {
    waterProvider.water.listNameDistrict =
        list.map((item) => District.fromJson(item)).toList();
    print(waterProvider.water.listNameDistrict);
    if (indexProvince == "0" || (indexProvince == "null")) {
      return list.map((item) => District.fromJson(item)).toList();
    }

    return list
        .map((item) => District.fromJson(item))
        .where((element) => element.provinceId == indexProvince)
        .toList();
  }

  @override
  String toString() => nameDistrict;
}
