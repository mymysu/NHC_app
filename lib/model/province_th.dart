import 'package:water_resources_application/provider/dataWater_provider.dart';

class ProvinceTH {
  String provinceId;
  String nameProvince;
  String nameEnProvince;
  String geographiesId;

  ProvinceTH({
    required this.provinceId,
    required this.nameProvince,
    required this.nameEnProvince,
    required this.geographiesId,
  });

  factory ProvinceTH.fromJson(Map<String, dynamic> json) {
    return ProvinceTH(
      provinceId: json["province_ID"],
      nameProvince: json["name_province"],
      nameEnProvince: json["name_en_province"],
      geographiesId: json["geographies_ID"],
    );
  }

  static List<ProvinceTH> fromJsonList(List list, DataWater waterProvider) {
    waterProvider.water.listNameProvince =
        list.map((item) => ProvinceTH.fromJson(item)).toList();

    return list.map((item) => ProvinceTH.fromJson(item)).toList();
  }

  @override
  String toString() => nameProvince;
}
