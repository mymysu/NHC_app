import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:water_resources_application/model/subdistricts_th.dart';

class SubDistrictData {
  static Future<List<SubDistrictTH>> getSubDistrictDropdown(
      BuildContext context, String index) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString("assets/data/subDistricts.json");
    final body = json.decode(data);
    if (body != null) {
      return SubDistrictTH.fromJsonList(body, index);
    }
    return [];
  }
}
