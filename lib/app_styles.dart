import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './size_configs.dart';

const kPrimaryColor = Color.fromRGBO(252, 157, 69, 1);
const kSecondaryColor = Color(0xff573353);
const aSecondaryColor = Colors.green;
const aPrimaryColor = Color(0xFF11048B);
const fBorderyColor = Colors.pink;
const eBorderyColor = Color(0xFF11048B);
Color bgadddataColor = Color.fromARGB(255, 255, 255, 255);
Color addPrimaryColor = Color(0xFF11048B);

final kTitle = TextStyle(
  fontSize: SizeConfig.blockSizeH! * 7,
  color: kSecondaryColor,
  fontWeight: FontWeight.bold,
);

final kBodyText1 = TextStyle(
  color: kSecondaryColor,
  fontSize: SizeConfig.blockSizeH! * 4.5,
  fontWeight: FontWeight.bold,
);

final aTitle = GoogleFonts.prompt(
  color: aPrimaryColor,
  fontSize: SizeConfig.blockSizeH! * 7,
  fontWeight: FontWeight.bold,
);

final aBodyText1 = TextStyle(
  color: Color.fromARGB(255, 66, 48, 235),
  fontSize: SizeConfig.blockSizeH! * 3,
);

final bDecoration = BoxDecoration(
    color: kPrimaryColor,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ));

const outlineInputBorderfocused = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orange, width: 3),
    borderRadius: BorderRadius.all(Radius.circular(25)));
const outlineInputBorderenabled = OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF11048B), width: 3),
    borderRadius: BorderRadius.all(Radius.circular(25)));
var fBorder = OutlineInputBorder(
    borderSide: BorderSide(color: fBorderyColor, width: 3),
    borderRadius: BorderRadius.all(Radius.circular(25)));
var eBorder = OutlineInputBorder(
    borderSide: BorderSide(color: eBorderyColor, width: 3),
    borderRadius: BorderRadius.all(Radius.circular(25)));
var cBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
      color: Color.fromARGB(31, 255, 255, 255),
    ));
