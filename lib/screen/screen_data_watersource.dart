import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_resources_application/widget/card_datawater.dart';

class Datawatersource extends StatelessWidget {
  const Datawatersource({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size_page = MediaQuery.of(context).size;

    return DefaultTabController(
        length: 7,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 232, 237, 251),
          appBar: AppBar(
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.blueAccent[700],
            title: Text(
              "ความหมายของแหล่งน้ำ",
              style: GoogleFonts.prompt(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            // foregroundColor: Colors.greenAccent,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue[300],
                  child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.white,
                      indicatorColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(color: Colors.blue[900]),
                      tabs: [
                        Tab(
                          child: Container(
                            padding: EdgeInsets.all(12),
                            // color: Colors.brown,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "ทั้งหมด",
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
                            // color: Colors.brown,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "แหล่งน้ำผิวดินธรรมชาติ",
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

                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "แหล่งน้ำผิวดินมนุษย์สร้างขึ้น",
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
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "ทางน้ำธรรมชาติ",
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
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "ทางน้ำมนุษย์สร้าง",
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
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "อาคารชลศาสตร์",
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
            Carddatawater(typewater: "all"),
            Carddatawater(typewater: "NAT_WTR_BODY"),
            Carddatawater(typewater: "MM_WTR_BODY"),
            Carddatawater(typewater: "NAT_STREAM"),
            Carddatawater(typewater: "MM_CANAL"),
            Carddatawater(typewater: "HYDRAUL_BUILD"),
            Carddatawater(typewater: "UNDERGROUND"),
          ]),
        ));
  }
}
