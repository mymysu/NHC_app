import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryWater {
  String? typeWater, nameProvince, nameDistrict, nameSubdistrict;
  bool? status;
  Timestamp? date;
  HistoryWater(
      {this.typeWater,
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
          typeWater: (doc.data() as dynamic)['typeWater'],
          nameProvince: (doc.data() as dynamic)['nameProvince'],
          nameDistrict: (doc.data() as dynamic)['nameDistrict'],
          nameSubdistrict: (doc.data() as dynamic)['nameSubdistrict'],
          date: (doc.data() as dynamic)['date'],
          status: (doc.data() as dynamic)['status'],
        ),
      )
      .toList();
}
