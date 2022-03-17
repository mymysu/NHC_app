import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final String image, sizewater;

  CustomDialog({
    required this.title,
    required this.description,
    required this.buttonText,
    required this.image,
    required this.sizewater,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: Consts.avatarRadius + Consts.padding,
              bottom: Consts.padding,
              left: Consts.padding,
              right: Consts.padding,
            ),
            margin: EdgeInsets.only(top: Consts.avatarRadius),
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(Consts.padding),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                Text(
                  title,
                  style: GoogleFonts.prompt(
                    color: Colors.blue[900],
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.prompt(
                    color: Colors.blue[900],
                    fontSize: 16.0,
                  ),
                ),
                sizewater != ""
                    ? Text(
                        ' ขนาดแหล่งน้ำ : $sizewater',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.prompt(
                          color: Colors.blue[900],
                          fontSize: 16.0,
                        ),
                      )
                    : Text(sizewater),
                SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // To close the dialog
                    },
                    child: Text(
                      buttonText,
                      style: GoogleFonts.prompt(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: Consts.padding,
            right: Consts.padding,
            child: CircleAvatar(
                radius: Consts.avatarRadius,
                child: Image.asset(
                  'assets/icons/flood.png',
                )
                // backgroundColor: Colors.blueAccent,
                // radius: Consts.avatarRadius,
                ),
          ),
        ],
      ),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
