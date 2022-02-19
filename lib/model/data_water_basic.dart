import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class Water {
  String? id;
  String? type;
  String? source;
  String? nameTH;
  String? nameEN;
  String? localName;
  double? latitude;
  double? longitude;
  String? riverWatershed;
  String? tributaryWatershed;
  String? geography;
  String? nameProvince;
  String? nameDistrict;
  String? nameSubdistrict;
  String? geographyId;
  String? provinceId;
  String? districtId;
  String? subdistrictId;
  String? village;
  var geom;
  var image;
  String? labelAdmin;
  String? label;
  String? note;
  String? documentation;
  FilePickerResult? kmlFile;

  Water(
      {this.id,
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
      this.nameDistrict,
      this.nameProvince,
      this.nameSubdistrict,
      this.districtId,
      this.provinceId,
      this.subdistrictId,
      this.geom,
      this.image,
      this.documentation,
      this.label,
      this.labelAdmin,
      this.note,
      this.kmlFile});
}
