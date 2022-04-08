import 'package:advance_image_picker/advance_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/app_styles.dart';
import 'package:water_resources_application/screen/screen_add_water.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:water_resources_application/widget/get_location_water.dart';
import 'package:water_resources_application/widget/widget_location.dart';
import 'package:geocoding/geocoding.dart';

class BeginAddwater extends StatefulWidget {
  const BeginAddwater({Key? key}) : super(key: key);

  @override
  State<BeginAddwater> createState() => _BeginAddwaterState();
}

class _BeginAddwaterState extends State<BeginAddwater> {
  List<ImageObject> _imgObjs = [];
  final configs = ImagePickerConfigs();
  @override
  Widget build(BuildContext context) {
    DataWater dataWater = Provider.of<DataWater>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    final configs = ImagePickerConfigs();
    configs.appBarTextColor = Colors.white;
    configs.appBarBackgroundColor = Colors.green;
    configs.translateFunc = (name, value) => Intl.message(value, name: name);
    configs.albumGridCount = 4;
    configs.cropFeatureEnabled = false;
    configs.adjustFeatureEnabled = false;
    configs.stickerFeatureEnabled = false;
    configs.adjustFeatureEnabled = false;
    configs.customStickerOnly = false;
    configs.filterFeatureEnabled = false;
    Future<void> getLocation(
        BuildContext context, DataWater waterProvider) async {
      late Position _currentPosition;
      Geolocator.requestPermission();
      Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best,
              forceAndroidLocationManager: true)
          .then((Position position) {
        _currentPosition = position;
        waterProvider.water.latitude = _currentPosition.latitude;
        waterProvider.water.longitude = _currentPosition.longitude;
        setState(() {
          _currentPosition = position;
          waterProvider.curren = true;
          waterProvider.water.geom = _currentPosition;
        });
      }).catchError((e) {
        print(e);
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * 0.3,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "เพิ่มข้อมูลแหล่งน้ำ",
              style: GoogleFonts.prompt(
                color: addPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: screenHeight * 0.3,
          ),
          Container(
            width: double.infinity,
            height: 60,
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                // print(
                //     "dataWater.water.nameProvince ${dataWater.water.nameProvince}");
                // final List<ImageObject>? objects = await Navigator.of(context)
                //     .push(
                //         PageRouteBuilder(pageBuilder: (context, animation, __) {
                //   return const ImagePicker(
                //     maxCount: 5,
                //   );
                // }));

                // if ((objects?.length ?? 0) > 0) {
                //   setState(() {
                //     _imgObjs = objects!;
                //   });
                // }

                // Position position =
                //     await LocationWaterSource.getGeoLocationPosition();
                // LocationWaterSource.getAddressFromLatLong(
                //   position,
                //   dataWater,
                //   context,
                // );
                await getLocation(context, dataWater);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddWaterResourcesScreen()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                // fixedSize: Size(250, 50),
              ),
              child: Text(
                "เพิ่มข้อมูล",
                style: GoogleFonts.prompt(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
