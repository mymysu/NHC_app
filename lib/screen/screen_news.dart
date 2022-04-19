import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/provider/user_provider.dart';
import 'package:water_resources_application/screen/screen_%20app_onboarding.dart';
import 'package:water_resources_application/screen/screen_add_water.dart';
import 'package:water_resources_application/screen/screen_data_watersource.dart';
import 'package:water_resources_application/screen/scrern_project_objectives.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    User? result = FirebaseAuth.instance.currentUser;
    userProvider.getProfileFromFirestore(result!.uid);

    return Scaffold(
      appBar: AppBar(
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
        child: Column(
          children: [
            Divider(
              height: 20,
            ),
            cardnews(context, "สาธิต", "วิธีการเพิ่มแหล่งน้ำ", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnboardingScreen()),
              );
            }),
            SizedBox(
              height: 10,
            ),
            cardnews(context, "ข้อมูลแหล่งน้ำ", "ความหมายข้อมูลแหล่งน้ำ", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Datawatersource()),
              );
            }),
            cardnews(context, "การเพิ่มข้อมูลแหล่งน้ำ",
                "วัตถุประสงค์การเพิ่มข้อมูลแหล่งน้ำ", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProjectObjectives()),
              );
            }),
          ],
        ),
      ),
    );
  }
}

cardnews(BuildContext context, String titleH, String contentD,
    VoidCallback onPreesed) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        // Those are our background
        // Text('${snapshot.data![1].title}'),

        Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.blue.shade700,
          ),
          child: Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleH,
                    style: GoogleFonts.prompt(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 1, 40, 99),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    contentD,
                    style: GoogleFonts.prompt(
                      fontSize: 14,
                      color: Color.fromARGB(255, 1, 40, 99),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   width: 50,
              // ),
              Container(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: onPreesed,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange.shade700,
                        border: Border.all(
                            color: Colors.orange.shade700, width: 8.0)),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
