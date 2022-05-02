import 'dart:io';

import 'package:advance_image_picker/advance_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';

class Imagewater extends StatefulWidget {
  const Imagewater({Key? key}) : super(key: key);

  @override
  State<Imagewater> createState() => _ImagewaterState();
}

class _ImagewaterState extends State<Imagewater> {
  List<ImageObject> _imgObjs = [];
  final configs = ImagePickerConfigs();

  @override
  Widget build(BuildContext context) {
    DataWater waterProvider = Provider.of<DataWater>(context);
    _imgObjs = waterProvider.water.image;
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
    return Container(
        child: Column(
      children: [
        GridView.builder(
            shrinkWrap: true,
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (BuildContext context, int index) {
              // final image = _imgObjs[index];
              return ((_imgObjs.length > 0) && (index != 5)) &&
                      _imgObjs.length > index
                  ? Padding(
                      padding: const EdgeInsets.all(2),
                      child: Image.file(File(_imgObjs[index].modifiedPath),
                          height: 80, fit: BoxFit.cover),
                    )
                  : index == 5
                      ? RaisedButton(
                          color: Colors.blue[50],
                          onPressed: () async {
                            // Get max 5 images
                            final List<ImageObject>? objects =
                                await Navigator.of(context).push(
                                    PageRouteBuilder(
                                        pageBuilder: (context, animation, __) {
                              return const ImagePicker(
                                maxCount: 5,
                              );
                            }));

                            if ((objects?.length ?? 0) > 0) {
                              setState(() {
                                _imgObjs = objects!;
                                waterProvider.water.image = _imgObjs;
                              });
                            }
                          },
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.blueAccent,
                            size: 50,
                          ),
                        )
                      : Container(
                          color: Colors.blue[50],
                          padding: const EdgeInsets.all(2),
                          child: Icon(
                            Icons.image_outlined,
                            color: Colors.blueAccent[100],
                            size: 50,
                          ),
                        );
            }),
      ],
    ));
  }
}
