import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/app_styles.dart';
import 'package:water_resources_application/model/data_water.dart';
import 'package:water_resources_application/model/onboard_data.dart';
import 'package:water_resources_application/provider/dataWater_provider.dart';
import 'package:water_resources_application/provider/user_provider.dart';
import 'package:water_resources_application/size_configs.dart';
import 'package:water_resources_application/widget/button_confirm_addwater.dart';
import 'package:water_resources_application/widget/button_onboard_nav.dart';

import 'package:water_resources_application/widget/page_add_water2.dart';
import 'package:water_resources_application/widget/page_add_water3.dart';

class AddWaterResourcesScreen extends StatefulWidget {
  AddWaterResourcesScreen({Key? key, required this.typeWater})
      : super(key: key);
  WaterSourceDetails typeWater;
  @override
  State<AddWaterResourcesScreen> createState() =>
      _AddWaterResourcesScreenState();
}

class _AddWaterResourcesScreenState extends State<AddWaterResourcesScreen> {
  // DataNatWtrBody datawater = DataNatWtrBody();

  final formKey = GlobalKey<FormState>();
  int currenPage = 0;
  PageController _pageController = PageController(initialPage: 0);
  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(microseconds: 400),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: currenPage == index ? kPrimaryColor : kSecondaryColor,
          shape: BoxShape.circle),
    );
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 5), child: Text("รอสักครู่.....")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> _showDialogFile(BuildContext context, DataWater dataWater,
      WaterSourceDetails typeWater, UserProvider userProvider) {
    var size_page = MediaQuery.of(context).size;
    return showDialog(
        context: context,
        builder: (context) {
          return Consumer<DataWater>(
              builder: (context, waterProvider, child) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20.0,
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    title: Text(
                      "ตรวจสอบข้อมูล",
                      style: GoogleFonts.prompt(
                        fontSize: 24.0,
                        color: aPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "ประเภทข้อมูลแหล่งน้ำ\n  ${typeWater.typeTH}  ${typeWater.subtypeTH}",
                                style: GoogleFonts.prompt(color: aPrimaryColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "ชื่อแหล่งน้ำ\n  ${dataWater.water.nameTH}",
                                style: GoogleFonts.prompt(color: aPrimaryColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "คำอธิบายเพิ่มเติม \n  ${dataWater.water.note}",
                                style: GoogleFonts.prompt(color: aPrimaryColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "ที่อยู่\n  ${dataWater.water.nameProvince}  ${dataWater.water.nameDistrict}  ${dataWater.water.nameSubdistrict}",
                                style: GoogleFonts.prompt(color: aPrimaryColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "ละติจู ลองติจู\n ${dataWater.water.latitude},${dataWater.water.longitude}",
                                style: GoogleFonts.prompt(color: aPrimaryColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "ไฟล์KML\n  ${(waterProvider.water.kmlFile ?? "NULL") == "NULL" ? "ว่าง" : waterProvider.water.kmlFile!.names}",
                                style: GoogleFonts.prompt(color: aPrimaryColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "ไฟล์รูปภาพ\n  ${(waterProvider.water.image ?? "NULL") == "NULL" ? "0" : waterProvider.water.image.length} / 9",
                                style: GoogleFonts.prompt(color: aPrimaryColor),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 60,
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  showAlertDialog(context);
                                  dataWater.addWaterResourcesToFirestore(
                                      context,
                                      dataWater,
                                      widget.typeWater,
                                      userProvider);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  // fixedSize: Size(250, 50),
                                ),
                                child: Text(
                                  "ยืนยัน",
                                  style: GoogleFonts.prompt(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
        });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    DataWater dataWater = Provider.of<DataWater>(context);
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: bgadddataColor,
      body: SafeArea(
          child: Form(
        key: formKey,
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currenPage = value;
                  });
                },
                itemCount: 3,
                itemBuilder: ((context, index) {
                  return SingleChildScrollView(
                    child: index == 0
                        ? Column(
                            children: [
                              SizedBox(
                                height: sizeV * 5,
                              ),
                              Text("เพิ่มข้อมูลแหล่งน้ำ",
                                  style: GoogleFonts.prompt(
                                    color: addPrimaryColor,
                                    fontSize: SizeConfig.blockSizeH! * 7,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: sizeV * 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Card(
                                  shape: cBorder,
                                  color: bgadddataColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                            "ประเภทแหล่งน้ำ",
                                            style: GoogleFonts.prompt(
                                              color: addPrimaryColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '    ${widget.typeWater.typeTH}\n          ${widget.typeWater.subtypeTH}',
                                            style: GoogleFonts.prompt(
                                              fontSize: 16,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                            "ชื่อแหล่งน้ำ",
                                            style: GoogleFonts.prompt(
                                              color: addPrimaryColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        TextFormField(
                                          // keyboardType: TextInputType.multiline,
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText:
                                                  "กรุณาพิมพ์ชื่อแหล่งน้ำ",
                                              hintStyle: GoogleFonts.prompt(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black26,
                                              ),
                                              focusedBorder: fBorder,
                                              enabledBorder: eBorder),

                                          onChanged: (value) {
                                            print(widget.typeWater.subtypeTH!);
                                          },
                                          onSaved: (value) =>
                                              dataWater.water.nameTH = value,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                            "คำอธิบายเพิ่มเติม",
                                            style: GoogleFonts.prompt(
                                              color: addPrimaryColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        TextFormField(
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
                                          onSaved: (value) =>
                                              dataWater.water.note = value,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : index == 1
                            ? AddwaterPage2(
                                sizeV: sizeV,
                                dataWater: dataWater,
                                widget: widget)
                            : AddwaterPage3(
                                sizeV: sizeV,
                                dataWater: dataWater,
                                widget: widget),
                  );
                }),
              ),
            ),
            Expanded(
              flex: 1,
              child: currenPage == 2
                  ? Buttonconfirm(
                      bgcolor: kPrimaryColor,
                      buttonName: 'เพิ่มข้อมูล',
                      onPreesed: () {
                        if (userProvider.userProfile.uid == null) {
                          Fluttertoast.showToast(
                            msg: " ลงทะเบียนเข้าใช้งานก่อน ",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                          );
                        } else {
                          formKey.currentState!.save();
                          dataWater.water.note = "ข้างบ่อน้ำใหญ่";
                          dataWater.water.nameTH = "หนองน้ำใหญ่";
                          print(dataWater.water.note);
                          _showDialogFile(context, dataWater, widget.typeWater,
                              userProvider);
                          formKey.currentState!.reset();
                        }
                      },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        currenPage == 0
                            ? OnBoardNavBtn(
                                name: 'ยกเลิก',
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            : OnBoardNavBtn(
                                name: 'ย้อนกลับ',
                                onPressed: () {
                                  _pageController.previousPage(
                                      duration: Duration(microseconds: 400),
                                      curve: Curves.easeInOut);
                                },
                              ),
                        Row(
                          children:
                              List.generate(3, (index) => dotIndicator(index)),
                        ),
                        OnBoardNavBtn(
                          name: 'ต่อไป',
                          onPressed: () {
                            _pageController.nextPage(
                                duration: Duration(microseconds: 400),
                                curve: Curves.easeInOut);
                          },
                        )
                      ],
                    ),
            )
          ],
        ),
      )),
    );
  }
}
