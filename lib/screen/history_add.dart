import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_resources_application/screen/approved.dart';
import 'package:water_resources_application/widget/waiting_approval.dart';

class HistoryWater extends StatefulWidget {
  const HistoryWater({Key? key}) : super(key: key);

  @override
  State<HistoryWater> createState() => _HistoryWaterState();
}

class _HistoryWaterState extends State<HistoryWater>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF11048B),
        title: Text(
          'ประวัติการเพิ่มข้อมูล',
          style: GoogleFonts.prompt(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          padding: EdgeInsets.only(left: 20.0),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.orange,
          tabs: [
            Tab(
              child: Text(
                "รอการอนุมัติ",
                style: GoogleFonts.prompt(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Tab(
              child: Text(
                "ข้อมูลได้อนุมัติ",
                style: GoogleFonts.prompt(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
          labelColor: Colors.black,
          labelStyle: TextStyle(fontSize: 12),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          WaitApproval(),
          Approved(),
        ],
      ),
    );
  }
}
