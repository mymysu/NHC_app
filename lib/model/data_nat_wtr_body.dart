// ตารางที่ 6 แหล่งน้ำผิวดินมนุษย์สร้าง อ่างเก็บน้ำ (MS/ML/L)
class DataMmWtrBody {
  String? developmentAgencyMain; //หน่วยงานพัฒนา(หลัก)
  String? developmentAgencyRegion; //หน่วยงานพัฒนา(ภูมิภาค)
  String? developmentDate; //วันที่พัฒนา
  String? improvementAgencyMain; //หน่วยงานปรับปรุง(หลัก)
  String? improvementAgencyRegion; //หน่วยงานปรับปรุง (ภูมิภาค)
  String? updateDate; //วันที่ที่ปรับปรุง

  String? surveyDate; //วันที่สำรวจ แหล่งน้ำ
  String? constructionStartDate; //วันที่เริ่มต้น ก่อสร้าง
  String? dateCompletion; //วันที่สร้างเสร็จ
  double? capacity; //ความจุ
  double? depth; //ความลึก
  double? waterRetentionLevel; //ระดับกักเก็บ
  double? waterRetentionHeight; //ความสูงกักเก็บ
  String? transferFrom; //หน่วยงานที่ได้รับ การถ่ายโอน
  String? agency; //ถ่ายโอนจากหน่วยงาน
  bool? transferStatus; //สถานะการถ่ายโอน

  //ตารางที่ 7 แหล่งน้ำผิวดินมนุษย์สร้าง อ่างเก็บน้ำ (S)
  double? surfaceArea; //พื้นที่ผิวน้ำ

  // ตารางที่ 8 แหล่งน้ำผิวดินมนุษย์สร้าง สระน้ำ/บ่อน้ำ (มนุษย์สร้าง)
  String? waterSource; //สถานภาพแหล่งน้ำ

  DataMmWtrBody(
      {this.developmentAgencyMain,
      this.developmentAgencyRegion,
      this.developmentDate,
      this.improvementAgencyMain,
      this.improvementAgencyRegion,
      this.updateDate,
      this.capacity,
      this.surveyDate,
      this.agency,
      this.transferFrom,
      this.transferStatus,
      this.constructionStartDate,
      this.dateCompletion,
      this.depth,
      this.surfaceArea,
      this.waterRetentionHeight,
      this.waterRetentionLevel,
      this.waterSource});
}
