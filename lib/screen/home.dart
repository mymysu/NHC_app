import 'package:flutter/material.dart';
import 'package:water_resources_application/screen/add_water.dart';

import 'package:water_resources_application/screen/main.dart';
import 'package:water_resources_application/screen/more.dart';
import 'package:water_resources_application/screen/news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> showPages = [
    MainScreen(),
    NewsScreen(),
    AddWaterResourcesScreen(),
    MoreScreen()
  ];
  int index = 0;
  final List<BottomNavigationBarItem> bottomMenuListItem = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าหลัก'),
    BottomNavigationBarItem(
        icon: Icon(Icons.connected_tv_sharp), label: 'ข่าว'),
    BottomNavigationBarItem(icon: Icon(Icons.water), label: 'เพิ่มแหล่งน้ำ'),
    BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'เพิ่มเติม')
  ];
  Widget appNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: bottomMenuListItem,
      currentIndex: index,
      onTap: (value) {
        setState(() {
          index = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showPages[index],
      bottomNavigationBar: appNavigationBar(),
    );
  }
}
