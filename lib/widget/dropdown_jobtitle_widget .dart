import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/app_styles.dart';
import 'package:water_resources_application/model/data_water.dart';
import 'package:water_resources_application/model/positions.dart';
import 'package:water_resources_application/model/profile.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';
import 'package:water_resources_application/widget/dialog_data_water.dart';
import 'package:water_resources_application/api/district_api.dart';
import 'package:water_resources_application/model/district_th.dart';

class DropdownJobTitleWidget extends StatefulWidget {
  const DropdownJobTitleWidget({Key? key}) : super(key: key);

  @override
  _DropdownJobTitleWidgetState createState() => _DropdownJobTitleWidgetState();
}

class _DropdownJobTitleWidgetState extends State<DropdownJobTitleWidget> {
  String? dropdownValue = "ผู้นำชุมชน";
  Profile profile = Profile();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: FutureBuilder(
            future: getPositions(),
            builder: (BuildContext context,
                AsyncSnapshot<List<JobPositions>> snapshot) {
              print(snapshot.data![0].positions);
              if (snapshot.hasError) {
                return Text(snapshot.hasError.toString());
              }

              if (snapshot.connectionState == ConnectionState.done) {
                print(snapshot.data![0].positions);
                return DropdownButtonFormField<String>(
                  value: dropdownValue,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.blueAccent,
                    size: 20.09,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ตำแหน่งหน่วยงาน',
                    labelStyle: GoogleFonts.prompt(
                      color: Colors.blueAccent[700],
                    ),
                    prefixIcon: const Icon(
                      Icons.supervised_user_circle,
                      color: Colors.blueAccent,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.orange, width: 2),
                    ),
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: GoogleFonts.prompt(
                    color: Colors.blueAccent[700],
                  ),
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  onSaved: (value) {
                    profile.position = value;
                  },
                  items:
                      snapshot.data!.map<DropdownMenuItem<String>>((var value) {
                    print(value.positions);
                    return DropdownMenuItem<String>(
                      value: value.positions,
                      child: Text(value.positions.toString()),
                    );
                  }).toList(),
                );
              }
              return Scaffold(
                body: Center(
                  child: Center(child: CircularProgressIndicator()),
                ),
              );
            }));
  }
}
