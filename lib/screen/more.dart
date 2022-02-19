import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(36.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath:
                  'https://images.unsplash.com/photo-1554080353-a576cf803bda?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80',
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            buildName(userProvider.userProfile),
            buildEditUser(context),
            buildHistory(context),
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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            profile.email.toString(),
            style: TextStyle(color: Colors.grey),
          )
        ],
      );
  Widget buildOutButton(UserProvider userProvider, context) => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
            primary: Colors.white,
            shape:
                StadiumBorder(side: BorderSide(color: Colors.white, width: 1)),
          ),
          onPressed: () async {
            userProvider.signOut();
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: Text(
            'ออกจากระบบ',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
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
        primary: Colors.blueAccent,
        shape: StadiumBorder(),
      ),
      child: Text('แก้ไขข้อมูลส่วนตัว'),
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/editUser');
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
        primary: Colors.blueAccent,
        shape: StadiumBorder(),
      ),
      child: Text('ประวัติการเพิ่มข้อมูลแหล่งน้ำ'),
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/historyAdd');
      },
    ),
  );
}
