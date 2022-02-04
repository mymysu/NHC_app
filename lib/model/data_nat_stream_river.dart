// ตารางที่ 9 ทางน้ำธรรมชาติ ลำน้ำ/แม่น้ำ
class DataNatStream {
  String? developmentAgencyMain; //หน่วยงานพัฒนา(หลัก)
  String? developmentAgencyRegion; //หน่วยงานพัฒนา(ภูมิภาค)
  String? auditingAgencyMain; //หน่วยงาน ตรวจสอบ (หลัก)
  String? auditingAgencyRegion; //หน่วยงาน ตรวจสอบ(ภูมิภาค)
  String? inspectionDate; //วันที่ตรวจสอบ
  String? surveyDate; //วันที่สำรวจ แหล่งน้ำ
  double? length; //ความยาว
  double? depth; //ความลึก
  double? referenceKm; //หลักกิโลเมตร อ้างอิง
  int? riverPotential; //ศักย์ลำน้ำ
  double? flowRateMax; //อัตราการไหล(สูงสุด)
  double? salinityMax; //ค่าความเค็มสูงสุด
  bool? transferStatus; //สถานะการถ่ายโอน

//ตารางที่ 10 ทางน้ำธรรมชาติ ปากน้ำ
  String? improvementAgencyMain; //หน่วยงานปรับปรุง(หลัก)
  String? improvementAgencyRegion; //หน่วยงานปรับปรุง (ภูมิภาค)
  String? updateDate; //วันที่ที่ปรับปรุง
  DataNatStream({
    this.developmentAgencyMain,
    this.developmentAgencyRegion,
    this.surveyDate,
    this.transferStatus,
    this.depth,
    this.auditingAgencyMain,
    this.auditingAgencyRegion,
    this.flowRateMax,
    this.inspectionDate,
    this.length,
    this.referenceKm,
  });
}
