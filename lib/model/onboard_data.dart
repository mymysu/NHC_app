class OnBoarding {
  final String title;
  final String image;
  final String details1;
  final String details2;

  OnBoarding({
    required this.title,
    required this.image,
    required this.details1,
    required this.details2,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
      title: 'ยินดีต้อนรับ \n วิธีการเพิ่มข้อมูลแหล่งน้ำ',
      image: 'assets/images/1.png',
      details1: 'หน้าแรกจะบอกข้อมูลที่ต้องการจะเก็บข้อมูลและแนะนำ',
      details2: 'ให้รู้ความหมายแหล่งน้ำก่อนจะเพิ่มข้อมูล'),
  OnBoarding(
      title: 'แรกการเพิ่มข้อมูล',
      image: 'assets/images/2.png',
      details1: 'เมื่อรู้ความหมายและกดเลือกเพิ่มข้อมูล',
      details2: 'ทำการถ่ายรูปภาพแหล่งน้ำประกอบ ถ่ายเสร็จกด selected'),
  OnBoarding(
      title: 'หน้าแอดข้อมูลแหล่งน้ำ',
      image: 'assets/images/3.png',
      details1:
          'รูปภาพที่ถ่ายไปจะขึ้นมาและดึงที่ตั้งในมือถือเป็นที่อยู่แหล่งน้ำ',
      details2: 'หากต้องการถ่ายรูปใหม่ให้กด รูปกล้อง'),
  OnBoarding(
      title: 'เลือกประเภทของแหล่งน้ำ',
      image: 'assets/images/4.png',
      details1: 'กดเลือกประภทแหล่งน้ำที่ช่อง ควรเลือกประเภทให้ถูกต้อง',
      details2: 'หากไม่รู้ความหมายได้ที่หน้าประชาสัมพันธ์'),
  OnBoarding(
      title: 'ที่อยู่แหล่งน้ำ',
      image: 'assets/images/5.png',
      details1: 'โดยข้อมูลเริ่มต้นคือที่ตั้งในมือถือ',
      details2:
          'หากต้องการกรอกที่ตั้งเอง สามารถใส่เลขละติจูลองติจูเป็นที่ตั้งได้'),
  OnBoarding(
      title: 'คำอธิบาย',
      image: 'assets/images/6.png',
      details1: 'ที่ลักษณะที่ตั้ง หรือ ลักษณะแหล่งน้ำ ปริมาณน้ำ',
      details2: 'เมื่อกรอกข้อมูลเสร็จกดยืนยันการเพิ่ม'),
  OnBoarding(
      title: 'หน้าตรวจสอบข้อมูล',
      image: 'assets/images/7.png',
      details1:
          'มีเวลา google map และข้อมูลที่กรอกไป เมื่อตรวจสอบเสร็จ กดยืนยันรอสักครู่ ',
      details2: ' เพิ่มข้อมูลเสร็จจะไปหน้าประวัติการเพิ่มข้อมูล'),
  OnBoarding(
      title: 'ประวัติการเพิ่มข้อมูล',
      image: 'assets/images/8.png',
      details2: 'เป็นประวัติการเพิ่ม ยกเลิก และการปฎิเสธการเพิ่มข้อมูล',
      details1: 'สามารถกดยกเลิกได้โดยระบุเหตุผลที่ยกเลิก'),
];
