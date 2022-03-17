import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_resources_application/model/profile.dart';
import 'package:water_resources_application/provider/user_provider.dart';
import 'package:water_resources_application/widget/profile_widget.dart.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({Key? key}) : super(key: key);
  var user;
  getUserData() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    user = prefs.getStringList("user");
    return user;
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: true);
    // getUserData();
    return FutureBuilder(
      future: getUserData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Error'),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          print(snapshot.data);
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
                  buildName(snapshot.data),
                  buildEditUser(context),
                  buildHistory(context),
                  buildOutButton(userProvider, context),
                ],
              ),
            ),
          );
        }

        return Scaffold(
          body: Center(
            child: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

  Widget buildName(var profile) => Column(
        children: [
          Text(
            "${profile[1] ?? "ชื่อจริง"} \t ${profile[2] ?? "นามสกุล"}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            profile[0] ?? "อีเมล",
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
            Navigator.popAndPushNamed(context, '/login');
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
