import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_resources_application/app_styles.dart';

class ProjectObjectives extends StatelessWidget {
  const ProjectObjectives({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "ประชาสัมพันธ์",
            style: GoogleFonts.prompt(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent[700],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "การสำรวจข้อมูลแหล่งน้ำ",
                      style: GoogleFonts.prompt(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.asset(
                      "assets/images/S__31383598.jpg",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: RichText(
                      text: TextSpan(
                          text:
                              '   เนื่องด้วยสถาบันสารสนเทศทรัพยากรน้ำ (องค์การมหาชน) ',
                          style: GoogleFonts.prompt(
                            color: Colors.orangeAccent.shade700,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'ต้องการเก็บข้อมูลแหล่งน้ำจากกลุ่มชุมชนเครือข่ายกว่า 1000 ชุมชนทั่วประเทศ'
                                  'ซึ่งในปัจจุบันเป็นการเก็บข้อมูลด้วยเเบบฟอร์มที่เเตกต่างกัน เช่น เก็บข้อมูลเป็นไฟล์ .csv , .pdf หรือ.txt เป็นต้น จึงทำให้การเก็บข้อมูลไม่ได้เป็นมาตรฐานเดียวกัน '
                                  'ดังนั้นทางองค์กรต้องการเก็บข้อมูลเเหล่งน้ำให้อยู่เเบบฟอร์มที่เหมือนกัน เพื่อนำข้อมูลไปใช้ประโยชน์การวิเคราะห์ปริมาตรน้ำในอนาคต ทางองค์กรจึงจัดการสำรวจขึ้นมา '
                                  'ทางองค์กรขอขอบคุณสมาชิกทุกคนที่ให้ความร่วมมือ',
                              style: GoogleFonts.prompt(
                                  color: Colors.blueAccent[700], fontSize: 16),
                            )
                          ]),
                    ),
                  ),
                ]),
          ),
        ));
  }
}
