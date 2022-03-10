import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_resources_application/screen/screen_%20app_onboarding.dart';
import 'package:water_resources_application/screen/screen_add_water.dart';
import 'package:water_resources_application/screen/screen_data_watersource.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];
    final List<Map<String, dynamic>> _items = List.generate(
        100,
        (index) => {
              "id": index,
              "title": "Item $index",
              "subtitle": "Subtitle $index"
            });
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าหลัก'),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                alignment: Alignment.topLeft,
                children: <Widget>[
                  // Those are our background
                  // Text('${snapshot.data![1].title}'),

                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.green,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "สาธิต",
                              style: GoogleFonts.prompt(
                                fontSize: 32,
                                color: Colors.brown.shade900,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "วิธีการเพิ่มแหล่งน้ำ",
                              style: GoogleFonts.prompt(
                                fontSize: 18,
                                color: Colors.brown.shade900,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OnboardingScreen(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.deepOrange,
                                  border: Border.all(
                                      color: Colors.deepOrange, width: 8.0)),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                alignment: Alignment.topLeft,
                children: <Widget>[
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.green,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ข้อมูลแหล่งน้ำ",
                              style: GoogleFonts.prompt(
                                fontSize: 32,
                                color: Colors.brown.shade900,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "ความหมายข้อมูลแหล่งน้ำ",
                              style: GoogleFonts.prompt(
                                fontSize: 18,
                                color: Colors.brown.shade900,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Datawatersource()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.deepOrange,
                                  border: Border.all(
                                      color: Colors.deepOrange, width: 8.0)),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // body: ListTileTheme(
      //   contentPadding: EdgeInsets.all(15),
      //   iconColor: Colors.red,
      //   textColor: Colors.black54,
      //   tileColor: Colors.yellow[100],
      //   style: ListTileStyle.list,
      //   dense: true,
      //   child: ListView.builder(
      //     itemCount: _items.length,
      //     itemBuilder: (_, index) => Card(
      //       margin: EdgeInsets.all(10),
      //       child: ListTile(
      //         title: Text(_items[index]['title']),
      //         subtitle: Text(_items[index]['subtitle']),
      //         trailing: Row(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
      //             IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
      //             IconButton(onPressed: () {}, icon: Icon(Icons.add_box)),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // )
    );
  }
}
