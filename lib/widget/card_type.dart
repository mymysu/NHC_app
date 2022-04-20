// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:water_resources_application/model/data_water.dart';
// import 'package:water_resources_application/screen/screen_add_water.dart';
// import 'package:water_resources_application/size_configs.dart';

// class CardType extends StatelessWidget {
//   CardType({Key? key, required this.typewater}) : super(key: key);
//   String typewater;
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: getWaterSourceDetails(typewater),
//         builder: (context, AsyncSnapshot<List<WaterSourceDetails>> snapshot) {
//           if (snapshot.hasError) {
//             return Text('Error , Something went wrong');
//           }
//           if (snapshot.connectionState == ConnectionState.done) {
//             // print(snapshot.data?.length);
//             return SizedBox(
//               // height: 80,
//               child: ListView.builder(
//                 padding: const EdgeInsets.all(16),
//                 itemCount: snapshot.data?.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15.0),
//                     ),
//                     color: Colors.green.shade300,
//                     elevation: 10,
//                     child: Row(
//                       children: <Widget>[
//                         Padding(
//                           padding: EdgeInsets.all(10.0),
//                           child: GestureDetector(
//                             onTap: () {},
//                             child: Container(
//                                 width: 100.0,
//                                 height: 100.0,
//                                 decoration: BoxDecoration(
//                                     color: Colors.red,
//                                     image: DecorationImage(
//                                         image: AssetImage(
//                                             'assets/icons/flood.png'),
//                                         fit: BoxFit.cover),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(75.0)),
//                                     boxShadow: [
//                                       BoxShadow(
//                                           blurRadius: 7.0, color: Colors.black)
//                                     ])),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Container(
//                           padding: EdgeInsets.all(10.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 snapshot.data![index].subtypeTH.toString(),
//                                 style: GoogleFonts.prompt(
//                                   fontWeight: FontWeight.w900,
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               Container(
//                                 width: 150,
//                                 child: Text(
//                                   snapshot.data![index].details.toString(),
//                                   style: GoogleFonts.prompt(
//                                     fontSize: 12,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           AddWaterResourcesScreen(
//                                         typeWater: snapshot.data![index],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                                 child: Container(
//                                     padding: EdgeInsets.all(30.0),
//                                     child: Chip(
//                                       label: Icon(
//                                         Icons.add,
//                                         size: 30,
//                                         color: Colors.white,
//                                       ),
//                                       shadowColor: Colors.blue,
//                                       backgroundColor: Colors.orange,
//                                       elevation: 5,
//                                       autofocus: true,
//                                     )),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             );
//           }

//           return Center(child: CircularProgressIndicator());
//         });
//   }
// }
