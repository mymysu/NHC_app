import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/model/history_water.dart';
import 'package:water_resources_application/provider/user_provider.dart';

class UnapprovalPage extends StatelessWidget {
  const UnapprovalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return FutureBuilder(
        future: getHistoryWaterUnapproved(
            userProvider.userProfile.uid.toString(),
            "water_source_information_unapproved"),
        builder:
            (BuildContext context, AsyncSnapshot<List<HistoryWater>> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text('Error , Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (_, i) {
                var name = snapshot.data![i];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.orange.shade100,
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${name.typeTH} ",
                                style: GoogleFonts.prompt(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "${name.subTypeTH} ",
                                style: GoogleFonts.prompt(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "ละติจู ${name.latitude!.toStringAsFixed(8)} ลองติจู ${name.longitude!.toStringAsFixed(8)}",
                                style: GoogleFonts.prompt(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "ตำบล ${name.nameSubdistrict} อำเภอ ${name.nameDistrict} จังหวัด ${name.nameProvince}",
                                style: GoogleFonts.prompt(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "${name.date}",
                                style: GoogleFonts.prompt(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "\nเหตุผลที่ไม่ได้รับอนุมัติ : ${name.unapprovedNote}",
                                style: GoogleFonts.prompt(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrangeAccent.shade700,
                                ),
                              ),
                            ]),
                      ),
                    ]),
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          }

          return Center(
            child: CircularProgressIndicator(
              color: Colors.indigo[900],
              strokeWidth: 5,
            ),
          );
        });
  }
}
