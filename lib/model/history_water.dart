import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:water_resources_application/provider/user_provider.dart';

class HistoryWater {
  String? typeID;
  String? typeTH;
  String? typeAbbr;
  String? subtypeEN;
  String? subTypeTH;
  String? subTypeID;
  String? nameGeography;
  String? nameProvince;
  String? nameDistrict;
  String? nameSubdistrict;
  String? geographyId;
  String? provinceId;
  String? districtId;
  String? subdistrictId;
  List<dynamic>? fileNameURL;
  String? note, uid, email;
  double? longitude, latitude;
  bool? status;
  var date, dateCancel, dateApproved;
  String? idDocs, cancelNote, unapprovedNote;

  HistoryWater(
      {this.typeID,
      this.typeTH,
      this.typeAbbr,
      this.subtypeEN,
      this.subTypeTH,
      this.subTypeID,
      this.nameGeography,
      this.nameProvince,
      this.nameDistrict,
      this.nameSubdistrict,
      this.geographyId,
      this.provinceId,
      this.districtId,
      this.subdistrictId,
      this.fileNameURL,
      this.note,
      this.uid,
      this.email,
      this.longitude,
      this.latitude,
      this.status,
      this.date,
      this.dateCancel,
      this.cancelNote,
      this.unapprovedNote,
      this.idDocs,
      this.dateApproved});
}

Future<List<HistoryWater>> getHistoryWaterAuthorization(
    String uid, String nameCollection, String date) async {
  QuerySnapshot qShot = await FirebaseFirestore.instance
      .collection(nameCollection)
      .where('uid', isEqualTo: uid)
      .get();

  return qShot.docs
      .map(
        (doc) => HistoryWater(
          typeID: (doc.data() as dynamic)['type_ID'],
          typeAbbr: (doc.data() as dynamic)['type_Abbr'],
          subtypeEN: (doc.data() as dynamic)['subType_EN'],
          subTypeID: (doc.data() as dynamic)['subType_ID'],
          nameGeography: (doc.data() as dynamic)['nameGeography'],
          geographyId: (doc.data() as dynamic)['geography_ID'],
          provinceId: (doc.data() as dynamic)['province_ID'],
          districtId: (doc.data() as dynamic)['district_ID'],
          subdistrictId: (doc.data() as dynamic)['subdistrict_ID'],
          subTypeTH: (doc.data() as dynamic)['subType_TH'],
          typeTH: (doc.data() as dynamic)['type_TH'],
          nameProvince: (doc.data() as dynamic)['nameProvince'],
          nameDistrict: (doc.data() as dynamic)['nameDistrict'],
          nameSubdistrict: (doc.data() as dynamic)['nameSubdistrict'],
          fileNameURL: (doc.data() as dynamic)['URL_FileImage'],
          note: (doc.data() as dynamic)['note'],
          email: (doc.data() as dynamic)['email'],
          latitude: (doc.data() as dynamic)['latitude'],
          longitude: (doc.data() as dynamic)['longitude'],
          date: (doc.data() as dynamic)[date],
          status: (doc.data() as dynamic)['status'],
          idDocs: doc.id as dynamic,
        ),
      )
      .toList();
}

Future<List<HistoryWater>> getHistoryWaterCancel(
    String uid, String nameCollection, String date) async {
  QuerySnapshot qShot = await FirebaseFirestore.instance
      .collection(nameCollection)
      .where('uid', isEqualTo: uid)
      .get();
  return qShot.docs
      .map(
        (doc) => HistoryWater(
          typeID: (doc.data() as dynamic)['type_ID'],
          typeAbbr: (doc.data() as dynamic)['type_Abbr'],
          subtypeEN: (doc.data() as dynamic)['subType_EN'],
          subTypeID: (doc.data() as dynamic)['subType_ID'],
          nameGeography: (doc.data() as dynamic)['nameGeography'],
          geographyId: (doc.data() as dynamic)['geography_ID'],
          provinceId: (doc.data() as dynamic)['province_ID'],
          districtId: (doc.data() as dynamic)['district_ID'],
          subdistrictId: (doc.data() as dynamic)['subdistrict_ID'],
          subTypeTH: (doc.data() as dynamic)['subType_TH'],
          typeTH: (doc.data() as dynamic)['type_TH'],
          nameProvince: (doc.data() as dynamic)['nameProvince'],
          nameDistrict: (doc.data() as dynamic)['nameDistrict'],
          nameSubdistrict: (doc.data() as dynamic)['nameSubdistrict'],
          fileNameURL: (doc.data() as dynamic)['URL_FileImage'],
          note: (doc.data() as dynamic)['note'],
          email: (doc.data() as dynamic)['email'],
          latitude: (doc.data() as dynamic)['latitude'],
          longitude: (doc.data() as dynamic)['longitude'],
          date: (doc.data() as dynamic)[date],
          status: (doc.data() as dynamic)['status'],
          dateCancel: (doc.data() as dynamic)['dateCancel'],
          cancelNote: (doc.data() as dynamic)['cancelNote'],
          idDocs: doc.id as dynamic,
        ),
      )
      .toList();
}

Future<List<HistoryWater>> getHistoryWaterApproved(
    String uid, bool status) async {
  QuerySnapshot qShot = await FirebaseFirestore.instance
      .collection("water_source_information_approved")
      .where('uid', isEqualTo: uid)
      .where('status', isEqualTo: status)
      .get();

  var a = qShot.docs
      .map(
        (doc) => HistoryWater(
          typeID: (doc.data() as dynamic)['type_ID'],
          typeAbbr: (doc.data() as dynamic)['type_Abbr'],
          subtypeEN: (doc.data() as dynamic)['subType_EN'],
          subTypeID: (doc.data() as dynamic)['subType_ID'],
          nameGeography: (doc.data() as dynamic)['nameGeography'],
          geographyId: (doc.data() as dynamic)['geography_ID'],
          provinceId: (doc.data() as dynamic)['province_ID'],
          districtId: (doc.data() as dynamic)['district_ID'],
          subdistrictId: (doc.data() as dynamic)['subdistrict_ID'],
          subTypeTH: (doc.data() as dynamic)['subType_TH'],
          typeTH: (doc.data() as dynamic)['type_TH'],
          nameProvince: (doc.data() as dynamic)['nameProvince'],
          nameDistrict: (doc.data() as dynamic)['nameDistrict'],
          nameSubdistrict: (doc.data() as dynamic)['nameSubdistrict'],
          note: (doc.data() as dynamic)['note'],
          email: (doc.data() as dynamic)['email'],
          latitude: (doc.data() as dynamic)['latitude'],
          longitude: (doc.data() as dynamic)['longitude'],
          dateApproved: (doc.data() as dynamic)['dateApproved'],
          status: (doc.data() as dynamic)['status'],
          cancelNote: (doc.data() as dynamic)['cancelNote'],
          unapprovedNote: (doc.data() as dynamic)['Reason'],
          idDocs: doc.id as dynamic,
        ),
      )
      .toList();

  return a;
}

void cancelWaterResourcesToFirestore(HistoryWater historyWater,
    UserProvider userProvider, String cancelNote) async {
  DateTime now = DateTime.now();
  // final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm');
  // final String formatted = formatter.format(now);
  await FirebaseFirestore.instance
      .collection("water_source_information_new")
      .doc(historyWater.idDocs)
      .delete();

  await FirebaseFirestore.instance
      .collection("water_source_information_cancel")
      .doc(historyWater.idDocs)
      .set({
    "type_Abbr": historyWater.typeAbbr,
    "type_TH": historyWater.typeTH,
    "type_ID": historyWater.typeID,
    "subType_EN": historyWater.subtypeEN,
    "subType_TH": historyWater.subTypeTH,
    "subType_ID": historyWater.subTypeID,
    "URL_FileImage": historyWater.fileNameURL,
    "latitude": historyWater.latitude,
    "longitude": historyWater.longitude,
    "geography_ID": historyWater.geographyId,
    "province_ID": historyWater.provinceId,
    "district_ID": historyWater.districtId,
    "subdistrict_ID": historyWater.subdistrictId,
    "nameGeography": historyWater.nameGeography,
    "nameProvince": historyWater.nameProvince,
    "nameDistrict": historyWater.nameDistrict,
    "nameSubdistrict": historyWater.nameSubdistrict,
    "note": historyWater.note ?? "",
    "cancelNote": cancelNote,
    "email": userProvider.userProfile.email,
    "uid": userProvider.userProfile.uid,
    "dateCancel": now,
    "date": historyWater.date,
    "status": false
  });
}
