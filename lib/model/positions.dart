import 'package:cloud_firestore/cloud_firestore.dart';

class JobPositions {
  String positions;
  JobPositions({required this.positions});
  @override
  String toString() => positions;
}

Future<List<JobPositions>> getPositions() async {
  QuerySnapshot qShot =
      await FirebaseFirestore.instance.collection('JobTitles').get();

  var a = qShot.docs
      .map(
        (doc) => JobPositions(
          positions: (doc.data() as dynamic)['JobTitle'],
        ),
      )
      .toList();
  print(a[0].positions);
  return a;
}
