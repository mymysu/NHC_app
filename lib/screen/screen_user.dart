import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/model/profile.dart';
import 'package:water_resources_application/provider/user_provider.dart';

class DataUser extends StatelessWidget {
  const DataUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> firebase = Firebase.initializeApp();
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[700],
        leading: IconButton(
          padding: EdgeInsets.only(left: 20.0),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.popAndPushNamed(
              context,
              '/',
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              size: 30,
            ),
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, '/editUser');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      "ข้อมูลส่วนตัว",
                      style: GoogleFonts.prompt(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent.shade700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      "ชื่อจริง",
                      style: GoogleFonts.prompt(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent[700],
                      ),
                    ),
                  ),
                  BoxDataUser(userProvider.userProfile.firstName.toString()),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      "นามสกุล",
                      style: GoogleFonts.prompt(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent[700],
                      ),
                    ),
                  ),
                  BoxDataUser(userProvider.userProfile.lastName.toString()),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      "อีเมล",
                      style: GoogleFonts.prompt(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent[700],
                      ),
                    ),
                  ),
                  BoxDataUser(userProvider.userProfile.email.toString()),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      "เบอร์โทรศัทพ์",
                      style: GoogleFonts.prompt(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent[700],
                      ),
                    ),
                  ),
                  BoxDataUser(userProvider.userProfile.mobileNumber.toString()),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      "ตำแหน่งงาน",
                      style: GoogleFonts.prompt(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent[700],
                      ),
                    ),
                  ),
                  BoxDataUser(userProvider.userProfile.position.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget BoxDataUser(String userData) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blueAccent,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.person,
          color: Colors.blueAccent.shade700,
        ),
        Text(
          " $userData",
          style: GoogleFonts.prompt(
            fontSize: 16,
            color: Colors.blueAccent[700],
          ),
        ),
      ],
    ),
  );
}
