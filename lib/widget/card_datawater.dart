import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_resources_application/model/data_water.dart';
import 'package:water_resources_application/widget/dialog_data_water.dart';

class Carddatawater extends StatelessWidget {
  Carddatawater({Key? key, required this.typewater}) : super(key: key);
  String typewater;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getWaterSourceDetails(typewater),
        builder: (context, AsyncSnapshot<List<WaterSourceDetails>> snapshot) {
          if (snapshot.hasError) {
            return Text('Error , Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return SizedBox(
              height: 120,
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomDialog(
                          title: snapshot.data![index].subtypeTH.toString(),
                          description: snapshot.data![index].details.toString(),
                          buttonText: "เข้าใจแล้ว",
                          image: 'assets/icons/flood.png',
                          sizewater: snapshot.data![index].sizewater.toString(),
                        ),
                      );
                    },
                    child: Card(
                      // padding: const EdgeInsets.all(8),
                      color: Colors.blueAccent[100],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Image.asset(
                              'assets/icons/flood.png',
                              height: 40,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.indigo,
                            child: Center(
                              child: Text(
                                "${snapshot.data![index].subtypeTH}",
                                // textAlign: TextAlign.center,
                                style: GoogleFonts.prompt(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
