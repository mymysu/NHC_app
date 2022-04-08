import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/app_styles.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';
import 'package:water_resources_application/provider/user_provider.dart';
import 'package:water_resources_application/size_configs.dart';
import 'package:water_resources_application/widget/dropdown_typewater_widget.dart';
import 'package:water_resources_application/widget/widget_image.dart';
import 'package:water_resources_application/widget/widget_showdialog_confirm.dart';
import 'package:water_resources_application/widget/widget_location.dart';

class AddWaterResourcesScreen extends StatefulWidget {
  AddWaterResourcesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddWaterResourcesScreen> createState() =>
      _AddWaterResourcesScreenState();
}

class _AddWaterResourcesScreenState extends State<AddWaterResourcesScreen> {
  String location = 'Null, Press Button';
  String Address = 'search';

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    DataWater dataWater = Provider.of<DataWater>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blueAccent[700],
        title: Text(
          "ความหมายของแหล่งน้ำ",
          style: GoogleFonts.prompt(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "รูปภาพประกอบข้อมูลแหล่งน้ำ",
                    style: GoogleFonts.prompt(
                      color: addPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Imagewater(),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "ประเภทแหล่งน้ำ",
                    style: GoogleFonts.prompt(
                      color: addPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                TypeWaterWidget(),
                LocationWidget(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "คำอธิบายเพิ่มเติม",
                    style: GoogleFonts.prompt(
                      color: addPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    // keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText:
                            "คำอธิบายเพิ่มติม เช่น สิ่งแวดล้อม ลักษณะแหล่งน้ำ",
                        hintStyle: GoogleFonts.prompt(
                          color: Colors.black26,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          // color: Color(0xFF40C0FF),
                        ),
                        focusedBorder: fBorder,
                        enabledBorder: eBorder),
                    onSaved: (value) => dataWater.water.note = value,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      onPressed: () {
                        // if (userProvider.userProfile.uid == null) {
                        //   Fluttertoast.showToast(
                        //     msg: " ลงทะเบียนเข้าใช้งานก่อน ",
                        //     toastLength: Toast.LENGTH_SHORT,
                        //     gravity: ToastGravity.CENTER,
                        //   );
                        // } else {
                        formKey.currentState!.save();
                        ShowdialogConfirm.showDialogConfirm(
                            context, dataWater, userProvider);
                        formKey.currentState!.reset();
                        // }
                      },
                      child: Text(
                        'เพิ่มข้อมูล',
                        style: GoogleFonts.prompt(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueAccent[700]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
