import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:water_resources_application/model/district_th.dart';

class DistrictData {
  static Future<List<District>> getDistrictdropdown(
      BuildContext context, String index) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString("assets/data/districts.json");
    final body = json.decode(data);
    if (body != null) {
      return District.fromJsonList(body, index);
    }
    return [];
  }
}
