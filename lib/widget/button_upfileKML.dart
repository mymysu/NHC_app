import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/provider/datawater_provider.dart';

class UpfileKML extends StatelessWidget {
  const UpfileKML({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataWater>(
        builder: (context, waterProvider, child) => RaisedButton(
              color: Color(0xFFFA7D00),
              child: Row(
                children: [
                  const Icon(
                    Icons.upload_file_outlined,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "ไฟล์ .KML",
                    style: GoogleFonts.prompt(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              onPressed: () => _openFile(context),
            ));
  }

  void _openFile(BuildContext context) async {
    FilePickerResult? kmlFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['kml'],
    );
  }
}
