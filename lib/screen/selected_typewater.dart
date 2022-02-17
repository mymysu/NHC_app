import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_resources_application/widget/card_type.dart';

class ChoiceTypeWaterAdd extends StatelessWidget {
  const ChoiceTypeWaterAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size_page = MediaQuery.of(context).size;

    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Color(0xFF11048B),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            toolbarHeight: 200,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "เพิ่มข้อมูลแหล่งน้ำ",
                  style: GoogleFonts.prompt(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "เลือกประเภทแหล่งน้ำ",
                  style: GoogleFonts.prompt(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.white,
                      indicatorColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(51),
                          color: Colors.orange),
                      tabs: [
                        Tab(
                          child: Container(
                            padding: EdgeInsets.all(12),
                            // color: Colors.white,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "แหล่งน้ำผิวดิน[ธรรมชาติ]",
                                style: GoogleFonts.prompt(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.all(12),
                            // color: Colors.white,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "แหล่งน้ำผิวดิน [มนุษย์สร้างขึ้น]",
                                style: GoogleFonts.prompt(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.all(12),

                            // color: Colors.white,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "แหล่งน้ำใต้ดิน",
                                style: GoogleFonts.prompt(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.all(12),

                            // color: Colors.white,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "ทางน้ำ[ธรรมชาติ]",
                                style: GoogleFonts.prompt(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                )),
          ),
          body: TabBarView(children: [
            CardType(),
            Center(
              child: Container(
                color: Colors.white,
                child: Text(
                  "Gallery",
                  style: TextStyle(fontSize: 22, color: Colors.blue),
                ),
              ),
            ),
            Center(
              child: Container(
                color: Colors.white,
                child: Text(
                  "Gallery",
                  style: TextStyle(fontSize: 22, color: Colors.blue),
                ),
              ),
            ),
            Center(
              child: Container(
                color: Colors.white,
                child: Text(
                  "Gallery",
                  style: TextStyle(fontSize: 22, color: Colors.blue),
                ),
              ),
            ),
          ]),
        ));
  }
}
