import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_resources_application/widget/page_approved.dart';
import 'package:water_resources_application/widget/page_cancel.dart';
import 'package:water_resources_application/widget/page_unapproved.dart';
import 'package:water_resources_application/widget/page_waiting_approval.dart';

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
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade700,
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
            Navigator.popAndPushNamed(
              context,
              "/",
            );
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          // indicatorColor: Colors.orange.shade900,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 5, color: Colors.orangeAccent),
            // insets: EdgeInsets.symmetric(vertical: 10),
          ),
          tabs: [
            Tab(
              child: Text(
                "รออนุมัติ",
                style: GoogleFonts.prompt(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            Tab(
              child: Text(
                "ได้รับอนุมัติ",
                style: GoogleFonts.prompt(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            Tab(
              child: Text(
                "ไม่ได้รับอนุมัติ",
                style: GoogleFonts.prompt(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            Tab(
              child: Text(
                "รายการยกเลิก",
                style: GoogleFonts.prompt(
                  fontSize: 14,
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
          WaitapprovalPage(),
          ApprovedPage(),
          UnapprovalPage(),
          CancelPage(),
        ],
      ),
    );
  }
}
