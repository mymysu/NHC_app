// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:water_resources_application/widget/card_type.dart';

// class ChoiceTypeWaterAdd extends StatelessWidget {
//   const ChoiceTypeWaterAdd({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var size_page = MediaQuery.of(context).size;

//     return DefaultTabController(
//         length: 7,
//         child: Scaffold(
//           backgroundColor: Color(0xFF11048B),
//           appBar: AppBar(
//             elevation: 0.0,
//             backgroundColor: Colors.transparent,
//             toolbarHeight: 200,
//             title: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "เพิ่มข้อมูลแหล่งน้ำ",
//                   style: GoogleFonts.prompt(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   "เลือกประเภทแหล่งน้ำ",
//                   style: GoogleFonts.prompt(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//             bottom: PreferredSize(
//                 preferredSize: Size.fromHeight(50),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   child: TabBar(
//                       isScrollable: true,
//                       unselectedLabelColor: Colors.white,
//                       indicatorColor: Colors.white,
//                       indicatorSize: TabBarIndicatorSize.label,
//                       indicator: BoxDecoration(
//                           borderRadius: BorderRadius.circular(51),
//                           color: Colors.orange),
//                       tabs: [
//                         Tab(
//                           child: Container(
//                             padding: EdgeInsets.all(12),
//                             // color: Colors.brown,
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ทั้งหมด",
//                                 style: GoogleFonts.prompt(
//                                   fontSize: 12,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Tab(
//                           child: Container(
//                             padding: EdgeInsets.all(12),
//                             // color: Colors.brown,
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "แหล่งน้ำผิวดินธรรมชาติ",
//                                 style: GoogleFonts.prompt(
//                                   fontSize: 12,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Tab(
//                           child: Container(
//                             padding: EdgeInsets.all(12),
//                             // color: Colors.white,

//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "แหล่งน้ำผิวดินมนุษย์สร้างขึ้น",
//                                 style: GoogleFonts.prompt(
//                                   fontSize: 12,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Tab(
//                           child: Container(
//                             padding: EdgeInsets.all(12),
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ทางน้ำธรรมชาติ",
//                                 style: GoogleFonts.prompt(
//                                   fontSize: 12,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Tab(
//                           child: Container(
//                             padding: EdgeInsets.all(12),
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ทางน้ำมนุษย์สร้าง",
//                                 style: GoogleFonts.prompt(
//                                   fontSize: 12,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Tab(
//                           child: Container(
//                             padding: EdgeInsets.all(12),
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "แหล่งน้ำใต้ดิน",
//                                 style: GoogleFonts.prompt(
//                                   fontSize: 12,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Tab(
//                           child: Container(
//                             padding: EdgeInsets.all(12),
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "อาคารชลศาสตร์",
//                                 style: GoogleFonts.prompt(
//                                   fontSize: 12,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ]),
//                 )),
//           ),
//           body: TabBarView(children: [
//             CardType(typewater: "all"),
//             CardType(typewater: "NAT_WTR_BODY"),
//             CardType(typewater: "MM_WTR_BODY"),
//             CardType(typewater: "NAT_STREAM"),
//             CardType(typewater: "MM_CANAL"),
//             CardType(typewater: "HYDRAUL_BUILD"),
//             CardType(typewater: "UNDERGROUND"),
//           ]),
//         ));
//   }
// }
