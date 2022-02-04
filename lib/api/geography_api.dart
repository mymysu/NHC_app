import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:water_resources_application/model/geography.dart';

class GeographyData {
  static Future<List<Geography>> getGeographydropdown(
      BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data =
        await assetBundle.loadString("assets/data/thai_geography.json");
    final body = json.decode(data);
    if (body != null) {
      return Geography.fromJsonList(body);
    }
    return [];
  }
}
