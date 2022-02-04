import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;

import 'package:water_resources_application/model/dam.dart';

class MapPinData {
  Future<List<Dam>> _getData() async {
    final data = await rootBundle.rootBundle.loadString("assets/data/DAM.json");
    final body = json.decode(data);

    if (body != null) {
      var i = Dam.fromJsonList(body);
      return i;
    }
    return [];
  }
}
