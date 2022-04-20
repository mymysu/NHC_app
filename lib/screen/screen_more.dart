import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/model/profile.dart';
import 'package:water_resources_application/provider/user_provider.dart';
import 'package:water_resources_application/widget/profile_widget.dart.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: true);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Icon(
              Icons.person_pin_rounded,
              color: Colors.blueAccent.shade700,
              size: 125,
            ),
            // ProfileWidget(
            //   imagePath:
            //       'https://images.unsplash.com/photo-1554080353-a576cf803bda?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80',
            //   onClicked: () async {},
            // ),
            const SizedBox(height: 24),
            buildName(userProvider.userProfile),
            const SizedBox(height: 10),
            buildEditUser(context),
            const SizedBox(height: 10),
            buildHistory(context),
            const SizedBox(height: 10),
            buildOutButton(userProvider, context),
          ],
        ),
      ),
    );
  }

  Widget buildName(Profile profile) => Column(
        children: [
          Text(
            "${profile.firstName.toString()} \t ${profile.lastName.toString()}",
            style:
                GoogleFonts.prompt(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 4),
          Text(
            profile.email.toString(),
            style: GoogleFonts.prompt(color: Colors.grey),
          )
        ],
      );
  Widget buildOutButton(UserProvider userProvider, context) => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
            primary: Colors.orangeAccent,
            shape: StadiumBorder(
                side: BorderSide(color: Colors.orangeAccent, width: 1)),
          ),
          onPressed: () async {
            userProvider.signOut();
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: Text(
            'ออกจากระบบ',
            style: GoogleFonts.prompt(
                // fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
      );
}

Widget buildEditUser(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        primary: Colors.blueAccent[700],
        shape: StadiumBorder(),
      ),
      child:
          Text('ข้อมูลส่วนตัว', style: GoogleFonts.prompt(color: Colors.white)),
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/dataUser');
      },
    ),
  );
}

Widget buildHistory(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        primary: Colors.blueAccent[700],
        shape: StadiumBorder(),
      ),
      child: Text('ประวัติการเพิ่มข้อมูลแหล่งน้ำ',
          style: GoogleFonts.prompt(color: Colors.white)),
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/historyAdd');
      },
    ),
  );
}
