class Dam {
  String type;
  Geometry geometry;
  Properties properties;
  Dam({
    required this.type,
    required this.geometry,
    required this.properties,
  });

  factory Dam.fromJson(Map<String, dynamic> json) {
    return Dam(
      type: json["type"],
      geometry: Geometry.fromJson(json["geometry"]),
      properties: Properties.fromJson(json["properties"]),
    );
  }

  static List<Dam> fromJsonList(List list) {
    return list.map((item) => Dam.fromJson(item)).toList();
  }
}

class Geometry {
  Geometry({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<dynamic> coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates:
            List<dynamic>.from(json["coordinates"].map((x) => x.toInt())),
      );
  static List<Geometry> fromJsonList(List list) {
    return list.map((item) => Geometry.fromJson(item)).toList();
  }
}

class Properties {
  int objectid;
  String prjId;
  String prjType;
  String prjName;
  String village;
  String tambon;
  String amphoe;
  String province;
  String mainbasin;
  String subbasin;
  String river;
  int purple;
  String zone;
  String properties;
  double latitude;
  double longitude;
  int utmX;
  int utmY;
  String fisYear;
  int budget;
  String prjQty;
  String prjDesc;
  int finishYr;
  int cropland;
  int person;
  String household;
  String status;
  String contractor;
  String recentQty;
  String empty;
  int pvIdU;
  String pvNamtU;
  String pvNameU;
  int ampIdU;
  String ampNamtU;
  String ampNameU;
  int re6Id;
  String re6Nam;
  int re4Id;
  String re4Nam;
  int dwrRegion;
  String dwrNam;
  int mbIdU;
  String mbNamtU;
  String mbNameU;
  int damId;
  String damName;
  String damType;
  Properties({
    required this.objectid,
    required this.prjId,
    required this.prjType,
    required this.prjName,
    required this.village,
    required this.tambon,
    required this.amphoe,
    required this.province,
    required this.mainbasin,
    required this.subbasin,
    required this.river,
    required this.purple,
    required this.zone,
    required this.properties,
    required this.latitude,
    required this.longitude,
    required this.utmX,
    required this.utmY,
    required this.fisYear,
    required this.budget,
    required this.prjQty,
    required this.prjDesc,
    required this.finishYr,
    required this.cropland,
    required this.person,
    required this.household,
    required this.status,
    required this.contractor,
    required this.recentQty,
    required this.empty,
    required this.pvIdU,
    required this.pvNamtU,
    required this.pvNameU,
    required this.ampIdU,
    required this.ampNamtU,
    required this.ampNameU,
    required this.re6Id,
    required this.re6Nam,
    required this.re4Id,
    required this.re4Nam,
    required this.dwrRegion,
    required this.dwrNam,
    required this.mbIdU,
    required this.mbNamtU,
    required this.mbNameU,
    required this.damId,
    required this.damName,
    required this.damType,
  });

  factory Properties.fromJson(Map<String, dynamic> json) {
    return Properties(
      objectid: json["OBJECTID"].toInt(),
      prjId: json["PRJ_ID"],
      prjType: json["PRJ_TYPE"],
      prjName: json["PRJ_NAME"],
      village: json["VILLAGE"],
      tambon: json["TAMBON"],
      amphoe: json["AMPHOE"],
      province: json["PROVINCE"],
      mainbasin: json["MAINBASIN"],
      subbasin: json["SUBBASIN"],
      river: json["RIVER"],
      purple: json["สทภ_"].toInt(),
      zone: json["Zone"],
      properties: json["ระว"],
      latitude: json["Latitude"],
      longitude: json["Longitude"].toDouble(),
      utmX: json["UTM_X"].toInt(),
      utmY: json["UTM_Y"].toInt(),
      fisYear: json["FIS_YEAR"],
      budget: json["BUDGET"].toInt(),
      prjQty: json["PRJ_QTY"],
      prjDesc: json["PRJ_DESC"],
      finishYr: json["FINISH_YR"].toInt(),
      cropland: json["CROPLAND"].toInt(),
      person: json["PERSON"].toInt(),
      household: json["HOUSEHOLD"],
      status: json["STATUS"],
      contractor: json["CONTRACTOR"],
      recentQty: json["RECENT_QTY"],
      empty: json["มาจ"],
      pvIdU: json["PV_ID_U"].toInt(),
      pvNamtU: json["PV_NAMT_U"],
      pvNameU: json["PV_NAME_U"],
      ampIdU: json["AMP_ID_U"].toInt(),
      ampNamtU: json["AMP_NAMT_U"],
      ampNameU: json["AMP_NAME_U"],
      re6Id: json["RE_6_ID"].toInt(),
      re6Nam: json["RE_6_NAM"],
      re4Id: json["RE_4_ID"].toInt(),
      re4Nam: json["RE_4_NAM"],
      dwrRegion: json["DWR_REGION"].toInt(),
      dwrNam: json["DWR_NAM"],
      mbIdU: json["MB_ID_U"].toInt(),
      mbNamtU: json["MB_NAMT_U"],
      mbNameU: json["MB_NAME_U"],
      damId: json["DAM_ID"].toInt(),
      damName: json["DAM_Name"],
      damType: json["DAM_Type"],
    );
  }

  static List<Properties> fromJsonList(List list) {
    return list.map((item) => Properties.fromJson(item)).toList();
  }
}
