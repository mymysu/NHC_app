import 'package:flutter/gestures.dart';
import 'package:advance_image_picker/advance_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/app_styles.dart';
import 'package:water_resources_application/screen/screen_%20app_onboarding.dart';
import 'package:water_resources_application/screen/screen_add_water.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:water_resources_application/widget/get_location_water.dart';
import 'package:water_resources_application/widget/widget_alertdialog_loding.dart';

class BeginAddwater extends StatefulWidget {
  const BeginAddwater({Key? key}) : super(key: key);

  @override
  State<BeginAddwater> createState() => _BeginAddwaterState();
}

class _BeginAddwaterState extends State<BeginAddwater> {
  List<ImageObject> _imgObjs = [];
  final configs = ImagePickerConfigs();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DataWater waterProvider = Provider.of<DataWater>(context);
    double screenHeight = MediaQuery.of(context).size.height;

    final configs = ImagePickerConfigs();
    configs.appBarTextColor = Colors.white;
    configs.appBarBackgroundColor = Colors.green;
    configs.translateFunc = (name, value) {
      switch (name) {
        case 'image_picker_select_images_title':
          return 'จำนวนภาพที่เลือก';
        case 'image_picker_select_images_guide':
          return 'คุณสามารถลากรูปภาพเพื่อจัดเรียงรายการ...';
        case 'image_picker_camera_title':
          return 'กล้อง';
        case 'image_picker_album_title':
          return 'อัลบั้ม';
        case 'image_picker_preview_title':
          return 'ตัวอย่าง';
        case 'image_picker_confirm_delete':
          return 'คุณต้องการลบภาพนี้หรือไม่?';
        case "image_picker_confirm_reset_changes":
          return 'คุณต้องการล้างการเปลี่ยนแปลงทั้งหมดของภาพนี้หรือไม่?';
        case "image_picker_exit_without_selecting":
          return 'คุณต้องการออกโดยไม่เลือกรูปภาพหรือไม่?';

        case 'image_picker_no_images':
          return 'ไม่มีภาพ...';
        case 'image_picker_select_button_title':
          return 'ส่ง';
        case 'image_picker_confirm':
          return 'ยืนยัน';
        case 'no':
          return 'ยกเลิก';
        case 'yes':
          return 'ตกลง';

        default:
          return value;
      }
    };
    configs.albumGridCount = 4;
    configs.cropFeatureEnabled = false;
    configs.adjustFeatureEnabled = false;
    configs.stickerFeatureEnabled = false;
    configs.adjustFeatureEnabled = false;
    configs.customStickerOnly = false;
    configs.filterFeatureEnabled = false;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blueAccent[700],
      //   centerTitle: true,
      //   toolbarHeight: 70,
      //   title: Text(
      //     "เพิ่มข้อมูลแหล่งน้ำ",
      //     style: GoogleFonts.prompt(
      //       color: Colors.white,
      //       fontSize: 28,
      //       fontWeight: FontWeight.bold,
      //     ),
      //     textAlign: TextAlign.start,
      //   ),
      // ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "เพิ่มข้อมูลแหล่งน้ำ",
                style: GoogleFonts.prompt(
                  color: addPrimaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 8),
              child: RichText(
                text: TextSpan(
                    text: "ข้อมูลที่ต้องกรอก\n",
                    style: GoogleFonts.prompt(
                      color: Colors.indigo.shade900,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "\n   + รูปภาพประกอบแหล่งน้ำ\n",
                        style: GoogleFonts.prompt(
                            color: Colors.indigo.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      TextSpan(
                        text: "\n   + ประเภทข้อมูล\n",
                        style: GoogleFonts.prompt(
                            color: Colors.indigo.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      TextSpan(
                        text:
                            "\n   + ที่อยู่ ละติจูด ลองติจูด ตำบล อำเภอ จังหวัด\n",
                        style: GoogleFonts.prompt(
                            color: Colors.indigo.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      TextSpan(
                        text: "\n   + คำอธิบายเพิ่มเติม\n",
                        style: GoogleFonts.prompt(
                            color: Colors.indigo.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      TextSpan(
                        text: "\nสามารถดูวิธีสาธิการเพิ่มข้อมูล  ",
                        style: GoogleFonts.prompt(
                            color: Color(0xFF11048B),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      TextSpan(
                          text: " ได้ที่นี่ ",
                          style: GoogleFonts.prompt(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OnboardingScreen()),
                              );
                            }),
                    ]),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Consumer<DataWater>(
              builder: (context, waterProvider, child) => Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: Colors.blue.shade900,
                  child: Text(
                    "เริ่มการเพิ่มข้อมูล",
                    style: GoogleFonts.prompt(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    final List<ImageObject>? objects =
                        await Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (context, animation, __) {
                      return const ImagePicker(
                        maxCount: 5,
                      );
                    }));

                    showAlertDialog(context);
                    if ((objects?.length ?? 0) > 0) {
                      setState(() {
                        _imgObjs = objects!;
                        waterProvider.water.image = objects;
                      });
                      Position position = await getGeoLocationPosition(context);

                      await getAddressFromLatLong(
                        position.latitude,
                        position.longitude,
                        waterProvider,
                        context,
                      );
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddWaterResourcesScreen()));
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
