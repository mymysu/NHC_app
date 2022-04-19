import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:water_resources_application/screen/screen_more.dart';
import 'package:water_resources_application/screen/screen_news.dart';
import 'package:water_resources_application/screen/screen_start_add_water.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> showPages = [NewsScreen(), BeginAddwater(), MoreScreen()];
  int index = 0;
  final List<TabItem<dynamic>> bottomMenuListItem = [
    TabItem(
        icon: Icon(
          Icons.home,
        ),
        title: 'หน้าหลัก'),
    // BottomNavigationBarItem(
    //     icon: Icon(Icons.connected_tv_sharp), label: 'ข่าว'),
    TabItem(
        icon: Icon(
          Icons.water,
        ),
        title: 'เพิ่มแหล่งน้ำ'),
    TabItem(
        icon: Icon(
          Icons.apps,
        ),
        title: 'เพิ่มเติม')
  ];
  Widget appNavigationBar() {
    return ConvexAppBar(
      backgroundColor: Colors.white,
      color: Color(0xFF11048B),
      activeColor: Colors.orange,
      style: TabStyle.reactCircle,
      items: bottomMenuListItem,
      initialActiveIndex: index,
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
