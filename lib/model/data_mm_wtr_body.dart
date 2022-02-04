//ตารางที่ 1 แหล่งน้ำผิวดินธรรมชาติ ทะเลสาบ/บ่อน้ำ (MS/ML/L)
class DataNatWtrBody {
  String? developmentAgencyMain; //หน่วยงานพัฒนา(หลัก)
  String? developmentAgencyRegion; //หน่วยงานพัฒนา(ภูมิภาค)
  String? developmentDate; //วันที่พัฒนา
  String? improvementAgencyMain; //หน่วยงานปรับปรุง(หลัก)
  String? improvementAgencyRegion; //หน่วยงานปรับปรุง (ภูมิภาค)
  String? updateDate; //วันที่ที่ปรับปรุง
  String? auditingAgencyMain; //หน่วยงาน ตรวจสอบ (หลัก)
  String? auditingAgencyRegion; //หน่วยงาน ตรวจสอบ(ภูมิภาค)
  String? inspectionDate; //วันที่ตรวจสอบ
  DateTime? surveyDate; //วันที่สำรวจ แหล่งน้ำ
  double? capacity; //ความจุ
  double? surfaceArea; //พื้นที่ผิวน้ำ
  double? availableWater; //พื้นที่ผิวน้ำ
  double? agencyReceivingTransfer; //ปริมาณน้ำที่ใช้ได้
  String? transferFrom; //หน่วยงานที่ได้รับ การถ่ายโอน
  String? agency; //ถ่ายโอนจากหน่วยงาน
  bool? transferStatus; //สถานะการถ่ายโอน

// ตารางที่ 2 แหล่งน้ำผิวดินธรรมชาติ ทะเลสาบ/บ่อน้ำ (S)
// ตารางที่ 4 แหล่งน้ำผิวดินธรรมชาติ หนอง/บึง/กุด (S)
// ตารางที่ 5 แหล่งน้ำผิวดินธรรมชาติ ตาน้ำ
  double? depth; //ความลึก
  double? waterRetentionLevel; //ระดับกักเก็บ
  double? waterRetentionHeight; //ความสูงกักเก็บ

  DataNatWtrBody(
      {this.developmentAgencyMain,
      this.developmentAgencyRegion,
      this.developmentDate,
      this.improvementAgencyMain,
      this.improvementAgencyRegion,
      this.updateDate,
      this.auditingAgencyMain,
      this.auditingAgencyRegion,
      this.capacity,
      this.inspectionDate,
      this.surfaceArea,
      this.surveyDate,
      this.agency,
      this.agencyReceivingTransfer,
      this.availableWater,
      this.transferFrom,
      this.transferStatus,
      this.depth,
      this.waterRetentionHeight,
      this.waterRetentionLevel});
}
