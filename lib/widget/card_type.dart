import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_resources_application/screen/add_water.dart';

class CardType extends StatelessWidget {
  const CardType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: <Widget>[
                // Those are our background
                // Text('${snapshot.data![1].title}'),
                Container(
                  height: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.yellow[900],
                  ),
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "อ่างเก็บน้ำ",
                        style: GoogleFonts.prompt(
                          fontSize: 30,
                          color: Colors.yellow[900],
                        ),
                      ),
                      Text(
                        "\t-แอ่งขนาดใหญ่ ซึ่งเกิดตามธรรมชาติหรือมนุษย์สร้างขึ้นเพื่อการกักเก็บ และควบคุมน้ำ\n\t- แหล่งน้ำที่เกิดขึ้นเนื่องจากเขื่อนกักเก็บน้ำ",
                        style: GoogleFonts.prompt(
                          fontSize: 14,
                          color: Colors.yellow[900],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.wash_outlined,
                            size: 100,
                            color: Colors.orangeAccent,
                          ),
                          SizedBox(
                            width: 120,
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepOrange,
                                border: Border.all(
                                    color: Colors.deepOrange, width: 2.0)),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AddWaterResourcesScreen(
                                      typeWater: "อ่างเก็บน้ำ",
                                    ),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 20,
            ),
            Stack(
              alignment: Alignment.topLeft,
              children: <Widget>[
                // Those are our background
                // Text('${snapshot.data![1].title}'),
                Container(
                  height: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.yellow[900],
                  ),
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "อ่างเก็บน้ำ",
                        style: GoogleFonts.prompt(
                          fontSize: 30,
                          color: Colors.yellow[900],
                        ),
                      ),
                      Text(
                        "\t-แอ่งขนาดใหญ่ ซึ่งเกิดตามธรรมชาติหรือมนุษย์สร้างขึ้นเพื่อการกักเก็บ และควบคุมน้ำ\n\t- แหล่งน้ำที่เกิดขึ้นเนื่องจากเขื่อนกักเก็บน้ำ",
                        style: GoogleFonts.prompt(
                          fontSize: 14,
                          color: Colors.yellow[900],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.wash_outlined,
                            size: 100,
                            color: Colors.orangeAccent,
                          ),
                          SizedBox(
                            width: 120,
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepOrange,
                                border: Border.all(
                                    color: Colors.deepOrange, width: 2.0)),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AddWaterResourcesScreen(
                                            typeWater: "อ่างเก็บน้ำ"),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
