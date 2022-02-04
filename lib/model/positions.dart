import 'package:cloud_firestore/cloud_firestore.dart';

class JobPositions {
  String? positions;
  JobPositions({this.positions});
}

Future<List<JobPositions>> getPositions() async {
  QuerySnapshot qShot = await FirebaseFirestore.instance
      .collection('users')
      .doc("ozJiDBr67YKy0gsqCLlX")
      .collection("JobPositions")
      .get();

  var a = qShot.docs
      .map(
        (doc) => JobPositions(
          positions: (doc.data() as dynamic)['Positions'],
        ),
      )
      .toList();
  // print(a[1].positions);
  return a;
}
