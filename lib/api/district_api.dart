import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:water_resources_application/model/district_th.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';

class DistrictData {
  static Future<List<District>> getDistrictdropdown(
      DataWater waterProvider, BuildContext context, String index) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString("assets/data/th_district.json");
    final body = json.decode(data);
    if (body != null) {
      return District.fromJsonList(body, index, waterProvider);
    }
    return [];
  }
}
