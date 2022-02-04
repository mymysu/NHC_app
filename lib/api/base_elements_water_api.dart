import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:water_resources_application/model/base_elements_water.dart';
// import 'package:flutter/services.dart' as rootBundle;
// import 'package:http/http.dart' as http;
// import 'package:water_resources_application/model/base_ElementWaters_water.dart';

class ElementWaterData {
  static Future<List<ElementWater>> getElementWaterDropdown(
      BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString("assets/data/type_water.json");
    final body = json.decode(data);
    if (body != null) {
      return ElementWater.fromJsonList(body);
    }
    return [];
  }
}



// class ElementWaterData {
//   static Future<List<SubType>> getElementWaterDropdown(
//       BuildContext context) async {
//     final assetBundle = DefaultAssetBundle.of(context);
//     final data = await assetBundle.loadString("assets/data/subDistricts.json");
//     final body = json.decode(data);
//     if (body != null) {
//       return SubType.fromJsonList(body);
//     }
//     return [];
//   }
// }

