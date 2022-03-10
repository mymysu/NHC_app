import 'package:cloud_firestore/cloud_firestore.dart';

class WaterSourceDetails {
  String? typeWater, type_th, type_en, details;
  bool? status;
  Timestamp? date;
  WaterSourceDetails({
    this.type_th,
    this.type_en,
    this.details,
  });
}

Future<List<WaterSourceDetails>> getWaterSourceDetails(String nameClass) async {
  QuerySnapshot qShot;
  if (nameClass == "all") {
    qShot =
        await FirebaseFirestore.instance.collection('data water source').get();
  } else {
    qShot = await FirebaseFirestore.instance
        .collection('data water source')
        .where('class', isEqualTo: nameClass)
        .get();
  }

  return qShot.docs
      .map(
        (doc) => WaterSourceDetails(
          type_th: (doc.data() as dynamic)['type_th'],
          type_en: (doc.data() as dynamic)['type_en'],
          details: (doc.data() as dynamic)['details'],
        ),
      )
      .toList();
}
