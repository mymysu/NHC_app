import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/app_styles.dart';
import 'package:water_resources_application/model/history_water.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';
import 'package:water_resources_application/provider/user_provider.dart';

class CancelPage extends StatefulWidget {
  @override
  State<CancelPage> createState() => _CancelPageState();
}

class _CancelPageState extends State<CancelPage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    UserProvider userProvider = Provider.of<UserProvider>(context);
    DataWater dataWater = Provider.of<DataWater>(context);

    return FutureBuilder(
        future: getHistoryWaterCancel(userProvider.userProfile.uid.toString(),
            'water_source_information_cancel', 'date'),
        builder:
            (BuildContext context, AsyncSnapshot<List<HistoryWater>> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text('');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (_, i) {
                var name = snapshot.data![i];
                print(snapshot.data![i].dateCancel);
                var a = snapshot.data![i].dateCancel!.toDate();

                final DateFormat formatter2 = DateFormat('dd/MM/yyyy hh:mm:ss');
                final String formatted = formatter2.format(a);
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
                                "${formatted}",
                                style: GoogleFonts.prompt(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "\nเหตุผลที่ยกเลิก ${name.cancelNote}",
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
