import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/api/subdistrict_api.dart';
import 'package:water_resources_application/app_styles.dart';
import 'package:water_resources_application/model/subdistricts_th.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';

class SubDistrictWidget extends StatelessWidget {
  SubDistrictWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataWater>(
      builder: (context, waterProvider, child) => DropdownSearch<SubDistrictTH>(
        mode: Mode.DIALOG,
        dropdownSearchDecoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
          focusedBorder: outlineInputBorderfocused,
          enabledBorder: outlineInputBorderenabled,
        ),
        // onFind: (String? filter) => SubDistrictData.getSubDistrictDropdown(
        //     context, waterProvider.water.districtId.toString()),
        onChanged: (var value) {
          waterProvider.water.nameSubdistrict = value!.nameSubdistrict;
          waterProvider.water.subdistrictId = value.subdistrictId;
        },
        hint: "เลือก",
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
              labelText: "ค้นหาชื่อตำบล",
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        ),
        popupTitle: Container(
          height: 80,
          width: 120,
          decoration: bDecoration,
          child: Center(
            child: Text(
              'ตำบล',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        popupShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18))),
      ),
    );
  }
}
