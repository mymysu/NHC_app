import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> showAlertDialog(BuildContext context) async {
  AlertDialog alert = AlertDialog(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircularProgressIndicator(),
        Container(
            margin: EdgeInsets.only(left: 5),
            child: Text(
              "รอสักครู่..... ",
              style: GoogleFonts.prompt(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            )),
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
