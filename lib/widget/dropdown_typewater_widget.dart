import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:water_resources_application/api/base_elements_water_api.dart';
import 'package:water_resources_application/model/base_elements_water.dart';

class TypeWaterWidget extends StatelessWidget {
  TypeWaterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<ElementWater>(
      mode: Mode.DIALOG,
      showSearchBox: true,
      dropdownSearchDecoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
        border: InputBorder.none,
      ),
      hint: "เลือก",
      onFind: (String? filter) {
        return ElementWaterData.getElementWaterDropdown(context);
      },
      onChanged: print,
      // selectedItem: "Brazil"
    );
  }
}
