import 'package:water_resources_application/provider/dataWater_provider.dart';

class SubDistrictTH {
  String subdistrictId;
  String districtId;
  String nameSubdistrict;
  String nameEnSubdistrict;
  String latSubdistrict;
  String lngSubdistrict;
  String zipcode;

  SubDistrictTH({
    required this.subdistrictId,
    required this.districtId,
    required this.nameSubdistrict,
    required this.nameEnSubdistrict,
    required this.latSubdistrict,
    required this.lngSubdistrict,
    required this.zipcode,
  });

  factory SubDistrictTH.fromJson(Map<String, dynamic> json) {
    return SubDistrictTH(
      subdistrictId: json["subdistrict_ID"],
      districtId: json["district_ID"],
      nameSubdistrict: json["name_subdistrict"],
      nameEnSubdistrict: json["name_en_subdistrict"],
      latSubdistrict: json["lat_subdistrict"],
      lngSubdistrict: json["lng_subdistrict"],
      zipcode: json["zipcode"],
    );
  }

  static List<SubDistrictTH> fromJsonList(
      List list, String indexProvince, DataWater waterProvider) {
    // print(indexProvince);
    waterProvider.water.listNameSubdistrict =
        list.map((item) => SubDistrictTH.fromJson(item)).toList();
    // print(waterProvider.water.listNameDistrict);

    if (indexProvince == "0" || indexProvince == "null") {
      return list.map((item) => SubDistrictTH.fromJson(item)).toList();
    }
    return list
        .map((item) => SubDistrictTH.fromJson(item))
        .where((element) => element.districtId == indexProvince)
        .toList();
  }

  @override
  String toString() => nameSubdistrict;
}
