import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryWater {
  String? nameTH, nameProvince, nameDistrict, nameSubdistrict;
  bool? status;
  String? date;
  HistoryWater(
      {this.nameTH,
      this.nameProvince,
      this.nameDistrict,
      this.nameSubdistrict,
      this.status,
      this.date});
}

Future<List<HistoryWater>> getHistoryWater(String uid, bool status) async {
  QuerySnapshot qShot = await FirebaseFirestore.instance
      .collection('water_source_information_new')
      .where('uid', isEqualTo: uid)
      .where('status', isEqualTo: status)
      .get();

  return qShot.docs
      .map(
        (doc) => HistoryWater(
          nameTH: (doc.data() as dynamic)['name_TH'],
          nameProvince: (doc.data() as dynamic)['nameProvince'],
          nameDistrict: (doc.data() as dynamic)['nameDistrict'],
          nameSubdistrict: (doc.data() as dynamic)['nameSubdistrict'],
          date: (doc.data() as dynamic)['date'].toString(),
          status: (doc.data() as dynamic)['status'],
        ),
      )
      .toList();
}
