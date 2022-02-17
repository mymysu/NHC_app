import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/api/province_api.dart';
import 'package:water_resources_application/model/province_th.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';

class ProvinceWidget extends StatelessWidget {
  ProvinceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataWater>(
      builder: (context, waterProvider, child) => DropdownSearch<ProvinceTH>(
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
        onFind: (String? filter) {
          return ProvincesData.getProvincedropdown(context);
        },
        // onFind: (String? filter) => getProvincedropdown(filter),
        onChanged: (var value) {
          waterProvider.water.province = value!.provinceId;
          // print("${waterProvider.water.province} ติดonChanged");
        },
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
            labelText: "ค้นหาชื่อจังหวัด",
          ),
        ),
        hint: "เลือก",

        popupTitle: Container(
          height: 80,
          width: 120,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
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
