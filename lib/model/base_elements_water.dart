// To parse this JSON data, do
//
//     final ElementWater = ElementWaterFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ElementWater {
  ElementWater({
    required this.sourceEn,
    required this.sourceTh,
    required this.typeAbbr,
    required this.typeTh,
    required this.idType,
    required this.subType,
  });

  String sourceEn;
  String sourceTh;
  String typeAbbr;
  String typeTh;
  int idType;
  List<SubType> subType;

  factory ElementWater.fromJson(Map<String, dynamic> json) => ElementWater(
        sourceEn: json["Source_EN"],
        sourceTh: json["Source_TH"],
        typeAbbr: json["Type_Abbr"],
        typeTh: json["Type_TH"],
        idType: json["ID_Type"],
        subType: List<SubType>.from(
            json["Sub_Type"].map((x) => SubType.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //     "Source_EN": sourceEn,
  //     "Source_TH": sourceTh,
  //     "Type_Abbr": typeAbbr,
  //     "Type_TH": typeTh,
  //     "ID_Type": idType,
  //     "Sub_Type": List<dynamic>.from(subType.map((x) => x.toJson())),
  // };

  static List<ElementWater> fromJsonList(List list) {
    return list.map((item) => ElementWater.fromJson(item)).toList();
  }

  @override
  String toString() => typeTh;
}

class SubType {
  String typeAbbr;
  String typeTh;
  List<String>? size;
  SubType({
    required this.typeAbbr,
    required this.typeTh,
    required this.size,
  });

  factory SubType.fromJson(Map<String, dynamic> json) => SubType(
        typeAbbr: json["Type_EN"],
        typeTh: json["Type_TH"].toString(),
        size: json["Size"] == null
            ? ["null"]
            : List<String>.from(json["Size"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Type_EN": typeAbbr,
        "Type_TH": typeTh,
        "Size":
            size == null ? ["null"] : List<dynamic>.from(size!.map((x) => x)),
      };
  // static List<SubType> fromJsonList(List list) {
  //   return list.map((item) => SubType.fromJson(item)).toList();
  // }

  // @override
  // String toString() => typeTh;
}
