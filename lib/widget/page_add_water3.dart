import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_resources_application/app_styles.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';
import 'package:water_resources_application/screen/screen_add_water.dart';
import 'package:water_resources_application/widget/image_up.dart';
import 'package:water_resources_application/widget/xml_up.dart';

class AddwaterPage3 extends StatelessWidget {
  const AddwaterPage3({
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
                  XmlUP(),
                  SizedBox(
                    height: sizeV * 2,
                  ),
                  ImageUP(),
                  SizedBox(
                    height: sizeV * 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
