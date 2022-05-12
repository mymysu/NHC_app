import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/app_styles.dart';
import 'package:water_resources_application/model/history_water.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';
import 'package:water_resources_application/provider/user_provider.dart';

class WaitapprovalPage extends StatefulWidget {
  const WaitapprovalPage({Key? key}) : super(key: key);

  @override
  State<WaitapprovalPage> createState() => _WaitapprovalPageState();
}

class _WaitapprovalPageState extends State<WaitapprovalPage> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    DataWater dataWater = Provider.of<DataWater>(context);

    final formKey = GlobalKey<FormState>();

    Future<void> _showDialog(BuildContext context, var data) {
      var size_page = MediaQuery.of(context).size;
      String cancelNote = "";
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              // contentPadding: EdgeInsets.only(
              //   top: 10.0,
              // ),
              title: Text(
                " ยกเลิกการเพิ่มข้อมูลแหล่งน้ำ",
                textAlign: TextAlign.start,
                style: GoogleFonts.prompt(
                  fontSize: 18,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            "สาเหตุการยกเลิก",
                            style: GoogleFonts.prompt(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            maxLines: 3,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'หมายเหตุ เช่น กรอกตำแหน่งข้อมูลผิด ',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.redAccent, width: 3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent.shade700,
                                      width: 3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            onSaved: (value) {
                              setState(() {
                                cancelNote = value!;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 60,
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              formKey.currentState!.save();
                              cancelWaterResourcesToFirestore(
                                  data, userProvider, cancelNote);
                              formKey.currentState!.reset();
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent
                                // fixedSize: Size(250, 50),
                                ),
                            child: Text(
                              "ยืนยันการยกเลิก",
                              style: GoogleFonts.prompt(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    }

    return FutureBuilder(
        future: getHistoryWaterAuthorization(
            userProvider.userProfile.uid.toString(),
            'water_source_information_new',
            'date'),
        builder:
            (BuildContext context, AsyncSnapshot<List<HistoryWater>> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text("");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (_, i) {
                var name = snapshot.data![i];
                DateTime a = snapshot.data![i].date!.toDate();
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
                              Align(
                                alignment: Alignment.bottomRight,
                                child: RaisedButton(
                                  onPressed: () => {_showDialog(context, name)},
                                  color: Colors.redAccent,
                                  child: Text(
                                    'ยกเลิก',
                                    style: TextStyle(color: Colors.white),
                                  ),
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
