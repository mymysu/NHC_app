import 'package:cloud_firestore/cloud_firestore.dart';

class WaterSourceDetails {
  String subtypeAbbr,
      subtypeID,
      subtypeTH,
      typeID,
      typeTH,
      typeAbbr,
      details,
      sizewater;

  WaterSourceDetails({
    required this.subtypeTH,
    required this.subtypeAbbr,
    required this.details,
    required this.sizewater,
    required this.typeAbbr,
    required this.typeID,
    required this.subtypeID,
    required this.typeTH,
  });

  @override
  String toString() => subtypeTH;
}

Future<List<WaterSourceDetails>> getWaterSourceDetails(String nameClass) async {
  QuerySnapshot qShot;

  if (nameClass == "all") {
    qShot =
        await FirebaseFirestore.instance.collection('data water source').get();
  } else {
    qShot = await FirebaseFirestore.instance
        .collection('data water source')
        .where('type_abbr', isEqualTo: nameClass)
        .get();
  }
  return qShot.docs
      .map(
        (doc) => WaterSourceDetails(
          subtypeID: (doc.data() as dynamic)['subtype_ID'],
          subtypeTH: (doc.data() as dynamic)['subtype_TH'],
          subtypeAbbr: (doc.data() as dynamic)['subtype_EN'],
          typeID: (doc.data() as dynamic)['type_ID'],
          typeAbbr: (doc.data() as dynamic)['type_abbr'],
          typeTH: (doc.data() as dynamic)['type_TH'],
          details: (doc.data() as dynamic)['details'],
          sizewater: (doc.data() as dynamic)['size'],
        ),
      )
      .toList();
}

// Future<List<WaterSourceDetails>> getWaterSourceSize(String nameClass) async {
//   QuerySnapshot qShot = await FirebaseFirestore.instance
//       .collection('size_data_water_source')
//       .get();

//   return qShot.docs
//       .map(
//         (doc) => WaterSourceDetails(
//           details: (doc.data() as dynamic)['details'],
//           sizewater: (doc.data() as dynamic)['size'],
//         ),
//       )
//       .toList();
// }
