import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/api/province_api.dart';
import 'package:water_resources_application/app_styles.dart';
import 'package:water_resources_application/model/geography.dart';
import 'package:water_resources_application/model/province_th.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';

class ProvinceWidget extends StatelessWidget {
  ProvinceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Geography> geography = [
      Geography(geographiesId: "1", nameGeo: "ภาคเหนือ"),
      Geography(geographiesId: "2", nameGeo: "ภาคกลาง"),
      Geography(geographiesId: "3", nameGeo: "ภาคตะวันออกเฉียงเหนือ"),
      Geography(geographiesId: "4", nameGeo: "ภาคตะวันตก"),
      Geography(geographiesId: "5", nameGeo: "ภาคตะวันออก"),
      Geography(geographiesId: "6", nameGeo: "ภาคใต้"),
    ];
    return Consumer<DataWater>(
      builder: (context, waterProvider, child) {
        return DropdownSearch<ProvinceTH>(
          mode: Mode.DIALOG,
          dropdownSearchDecoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
            focusedBorder: outlineInputBorderfocused,
            enabledBorder: outlineInputBorderenabled,
          ),
          // onFind: (String? filter) {
          //   return ProvincesData.getProvincedropdown(context);
          // },

          onChanged: (var value) {
            waterProvider.water.nameProvince = value!.nameProvince;
            waterProvider.water.provinceId = value.provinceId;
            waterProvider.water.geographyId = value.geographiesId;
            waterProvider.water.nameGeography =
                geography[int.parse(value.geographiesId) - 1].nameGeo;
          },
          showSearchBox: true,
          searchFieldProps: TextFieldProps(
              decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
            enabledBorder: OutlineInputBorder(),
            labelText: "ค้นหาชื่อจังหวัด",
          )),
          hint: "เลือก",
          popupTitle: Container(
            height: 80,
            width: 120,
            decoration: bDecoration,
            child: const Center(
              child: Text(
                'จังหวัด',
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
        );
      },
    );
  }
}
