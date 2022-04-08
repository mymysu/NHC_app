import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_resources_application/app_styles.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';
import 'package:water_resources_application/screen/screen_add_water.dart';
import 'package:water_resources_application/widget/dropdown_district_widget.dart';
import 'package:water_resources_application/widget/dropdown_province_widget.dart';
import 'package:water_resources_application/widget/dropdown_subdistrict_widget.dart';
import 'package:water_resources_application/widget/widget_location.dart';

class AddwaterPage2 extends StatelessWidget {
  const AddwaterPage2({
    Key? key,
    required this.sizeV,
    required this.dataWater,
    required this.widget,
  }) : super(key: key);

  final double sizeV;
  final DataWater dataWater;
  final AddWaterResourcesScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: sizeV * 5,
        ),
        Text("เพิ่มข้อมูลแหล่งน้ำ", style: aTitle, textAlign: TextAlign.center),
        SizedBox(
          height: sizeV * 2,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            shape: cBorder,
            color: bgadddataColor,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'ที่อยู่',
                      style: GoogleFonts.prompt(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF11048B),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'จังหวัด',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.prompt(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF11048B),
                      ),
                    ),
                  ),
                  ProvinceWidget(),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'อำเภอ',
                      style: GoogleFonts.prompt(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: addPrimaryColor,
                      ),
                    ),
                  ),
                  DistrictWidget(),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'ตำบล',
                      style: GoogleFonts.prompt(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF11048B),
                      ),
                    ),
                  ),
                  SubDistrictWidget(),
                  Divider(),
                  LocationWidget(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
