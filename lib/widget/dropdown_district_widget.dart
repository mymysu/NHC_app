import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/api/district_api.dart';
import 'package:water_resources_application/model/district_th.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';
import 'package:water_resources_application/app_styles.dart';

class DistrictWidget extends StatelessWidget {
  DistrictWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataWater>(
      builder: (context, waterProvider, child) => DropdownSearch<District>(
        mode: Mode.DIALOG,
        dropdownSearchDecoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pink, width: 3),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF11048B), width: 3),
              borderRadius: BorderRadius.all(Radius.circular(25))),
        ),
        // onFind: (String? filter) => DistrictData.getDistrictdropdown(
        //     context, waterProvider.water.provinceId.toString()),
        onChanged: (var value) {
          waterProvider.water.nameDistrict = value!.nameDistrict;
          waterProvider.water.districtId = value.districtId;

          // print(waterProvider.water.district);
        },
        showSearchBox: true,
        hint: "เลือก",
        searchFieldProps: TextFieldProps(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
            labelText: "ค้นหาชื่ออำเภอ",
          ),
        ),
        popupTitle: Container(
          height: 80,
          width: 120,
          decoration: bDecoration,
          child: Center(
            child: Text(
              'อำเภอ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        popupShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
      ),
    );
  }
}
