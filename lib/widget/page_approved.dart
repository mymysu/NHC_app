import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/model/history_water.dart';
import 'package:water_resources_application/provider/user_provider.dart';

class ApprovedPage extends StatelessWidget {
  const ApprovedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return FutureBuilder(
        future: getHistoryWaterApproved(
            userProvider.userProfile.uid.toString(), true),
        builder:
            (BuildContext context, AsyncSnapshot<List<HistoryWater>> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, i) {
                var name = snapshot.data![i];
                var a = snapshot.data![i].dateApproved!.toDate();
                final DateFormat formatter2 = DateFormat('dd/MM/yyyy hh:mm:ss');
                final String formatted = formatter2.format(a);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.orange.shade100,
                    child: Padding(
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
                              "????????????????????? ${name.latitude!.toStringAsFixed(8)} ???????????????????????? ${name.longitude!.toStringAsFixed(8)}",
                              style: GoogleFonts.prompt(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "???????????? ${name.nameSubdistrict} ??????????????? ${name.nameDistrict} ????????????????????? ${name.nameProvince}",
                              style: GoogleFonts.prompt(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "????????????????????????????????? : ${formatted}",
                              style: GoogleFonts.prompt(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ]),
                    ),
                  ),
                );
              },
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
