import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_resources_application/provider/user_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: true);

    return Center(
      child: Container(
          child: Text(
        "${userProvider.userProfile.email}",
        style: TextStyle(color: Colors.grey, fontSize: 20),
      )),
    );
  }
}
