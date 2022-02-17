import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryWater {
  String? typeWater, province, district, subdistrict;
  bool? status;
  Timestamp? date;
  HistoryWater(
      {this.typeWater,
      this.province,
      this.district,
      this.subdistrict,
      this.status,
      this.date});
}

Future<List<HistoryWater>> getHistoryWater(String uid) async {
  QuerySnapshot qShot = await FirebaseFirestore.instance
      .collection('water_source_information_new')
      .where('uid', isEqualTo: uid)
      .where('status', isEqualTo: false)
      .get();

  return qShot.docs
      .map(
        (doc) => HistoryWater(
          typeWater: (doc.data() as dynamic)['typeWater'],
          province: (doc.data() as dynamic)['province'],
          district: (doc.data() as dynamic)['district'],
          subdistrict: (doc.data() as dynamic)['subdistrict'],
          date: (doc.data() as dynamic)['date'],
          status: (doc.data() as dynamic)['status'],
        ),
      )
      .toList();
}
