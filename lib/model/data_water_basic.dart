class Water {
  String? id;
  String? type;
  String? source;
  String? nameTH;
  String? nameEN;
  String? localName;
  double? latitude;
  double? longitude;
  String? geography;
  String? riverWatershed;
  String? tributaryWatershed;
  String? province;
  String? district;
  String? subdistrict;
  String? village;
  var geom;
  var image;
  String? labelAdmin;
  String? label;
  String? note;
  String? documentation;

  Water({
    this.id,
    this.type,
    this.source,
    this.nameTH,
    this.nameEN,
    this.localName,
    this.latitude,
    this.longitude,
    this.geography,
    this.riverWatershed,
    this.tributaryWatershed,
    this.district,
    this.province,
    this.subdistrict,
    this.village,
    this.geom,
    this.image,
    this.documentation,
    this.label,
    this.labelAdmin,
    this.note,
  });
}
