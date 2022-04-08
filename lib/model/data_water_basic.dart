import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:water_resources_application/model/district_th.dart';
import 'package:water_resources_application/model/province_th.dart';
import 'package:water_resources_application/model/subdistricts_th.dart';

class Water {
  String? id;
  String? typeTH;
  String? subTypeTH;
  String? typeEN;
  String? subTypeEN;
  String? typeID;
  String? subTypeID;
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
  String? urlkmlFile;
  List<String>? urlFileImage;
  List<ProvinceTH>? listNameProvince;
  List<District>? listNameDistrict;
  List<SubDistrictTH>? listNameSubdistrict;

  Water(
      {this.id,
      this.typeEN,
      this.subTypeEN,
      this.typeTH,
      this.subTypeTH,
      this.typeID,
      this.subTypeID,
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
      this.kmlFile,
      this.urlkmlFile,
      this.urlFileImage,
      this.listNameDistrict,
      this.listNameProvince,
      this.listNameSubdistrict});
}
