import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/app_styles.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';
import 'package:water_resources_application/provider/user_provider.dart';
import 'dart:async';

class ShowdialogConfirm {
  static showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 5), child: Text("รอสักครู่.....")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static Future<void> showDialogConfirm(
      BuildContext context, DataWater dataWater, UserProvider userProvider) {
    var size_page = MediaQuery.of(context).size;
    Completer<GoogleMapController> _controller = Completer();
    DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm');
    final String nowtime = formatter.format(now);

    Set<Marker> _markers = {
      Marker(
        markerId: MarkerId("myLocation"),
        position: LatLng(dataWater.water.latitude!.toDouble(),
            dataWater.water.longitude!.toDouble()),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      )
    };
    return showDialog(
        context: context,
        builder: (context) {
          return Consumer<DataWater>(
              builder: (context, waterProvider, child) => AlertDialog(
                    insetPadding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    // contentPadding: EdgeInsets.only(top: 10.0, bottom: 10),
                    title: Text(
                      "ตรวจสอบข้อมูล",
                      style: GoogleFonts.prompt(
                        fontSize: 24.0,
                        color: aPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "วันที่บันทึก : ${nowtime}",
                                style: GoogleFonts.prompt(
                                  color: aPrimaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 15.0),
                              height: MediaQuery.of(context).size.height / 5,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                    zoom: 18,
                                    // bearing: 30,
                                    target: LatLng(
                                        dataWater.water.latitude!.toDouble(),
                                        dataWater.water.longitude!.toDouble()),
                                  ),
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    _controller.complete(controller);
                                  },
                                  markers: _markers,
                                  mapType: MapType.satellite,
                                  zoomControlsEnabled: false,
                                ),
                              ),
                            ),
                            textdata('ประเภทข้อมูลแหล่งน้ำ',
                                "\n   ${dataWater.water.typeTH}  ${dataWater.water.subTypeTH}"),
                            textdata("ละติจู ลองติจู",
                                "\n   ${dataWater.water.latitude},${dataWater.water.longitude}"),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8, bottom: 8),
                              child: RichText(
                                text: TextSpan(
                                    text: "ที่อยู่",
                                    style: GoogleFonts.prompt(
                                      color: Color(0xFF11048B),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "\n   จังหวัด : ",
                                        style: GoogleFonts.prompt(
                                            color: Color(0xFF11048B),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      TextSpan(
                                        text: "${dataWater.water.nameProvince}",
                                        style: GoogleFonts.prompt(
                                            color: Colors.blueAccent,
                                            fontSize: 16),
                                      ),
                                      TextSpan(
                                        text: "\n   อำเภอ : ",
                                        style: GoogleFonts.prompt(
                                            color: Color(0xFF11048B),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      TextSpan(
                                        text: "${dataWater.water.nameDistrict}",
                                        style: GoogleFonts.prompt(
                                            color: Colors.blueAccent,
                                            fontSize: 16),
                                      ),
                                      TextSpan(
                                        text: "\n   ตำบล : ",
                                        style: GoogleFonts.prompt(
                                            color: Color(0xFF11048B),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      TextSpan(
                                        text:
                                            "${dataWater.water.nameSubdistrict}",
                                        style: GoogleFonts.prompt(
                                            color: Colors.blueAccent,
                                            fontSize: 16),
                                      ),
                                    ]),
                              ),
                            ),
                            textdata("คำอธิบายเพิ่มเติม",
                                "\n   ${dataWater.water.note}"),
                            textdata("ไฟล์รูปภาพ",
                                "\n   ${(waterProvider.water.image ?? "NULL") == "NULL" ? "0" : waterProvider.water.image.length} / 9"),
                            Container(
                              width: double.infinity,
                              height: 60,
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  showAlertDialog(context);
                                  // dataWater.addWaterResourcesToFirestore(
                                  //     context,
                                  //     dataWater,
                                  //     widget.typeWater,
                                  //     userProvider);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  // fixedSize: Size(250, 50),
                                ),
                                child: Text(
                                  "ยืนยัน",
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
                  ));
        });
  }
}

textdata(String titleH, String contentD) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, bottom: 8),
    child: RichText(
      text: TextSpan(
          text: titleH,
          style: GoogleFonts.prompt(
            color: Color(0xFF11048B),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          children: <TextSpan>[
            TextSpan(
              text: contentD,
              style: GoogleFonts.prompt(color: Colors.blueAccent, fontSize: 16),
            )
          ]),
    ),
  );
}
