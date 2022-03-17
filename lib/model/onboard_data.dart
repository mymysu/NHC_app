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
      image: 'assets/images/0.png',
      details1: 'ก่อนอื่นทำความรู้จักความหมายแหล่งน้ำต่าง',
      details2: 'สามารถกดไปดูความหมายได้ที่'),
  OnBoarding(
      title: 'ขั้นแรก',
      image: 'assets/images/0.png',
      details1: 'เลือกประเภทข้อมูลแหล่งน้ำที่เราจะเพิ่ม',
      details2: 'หากต้องการเพิ่มข้อมูลแหล่งน้ำ กดปุ่ม บวก '),
  OnBoarding(
      title: 'หน้าแอดข้อมูลแหล่งน้ำ\n ประเภทของแหล่งน้ำ',
      image: 'assets/images/1.png',
      details1: 'ตรวจสอบประเภทแหล่งน้ำใช่ที่เราต้องการไหม',
      details2:
          'หากไม่ใช่ข้อมูลที่เราต้องการเพิ่ม\nให้กดปุ่มยกเลิกที่มุมซ้าบล่าง'),
  OnBoarding(
      title: 'ตั้งชื่อแหล่งน้ำ',
      image: 'assets/images/2.png',
      details1: 'ตั้งจากประเภทแหล่งน้ำ หรือ ที่ตั้งที่แหล่งน้ำนั้นอยู่',
      details2: 'เช่น หนองบ้านทุ่งนางครวญ บึงเกริงกระเวีย '),
  OnBoarding(
      title: 'คำอธิบาย',
      image: 'assets/images/3.png',
      details1: 'ที่ลักษณะที่ตั้ง หรือ ลักษณะแหล่งน้ำ ปริมาณน้ำ',
      details2:
          'เช่น หนองน้ำมีการแห้งเหือดช่วงเมษายน-พฤษาคม\n,แหล่งน้ำอยู่ข้างโรงเรียน '),
  OnBoarding(
      title: 'ที่อยู่แหล่งน้ำ',
      image: 'assets/images/4.png',
      details1: 'มีการเพิ่ม จังหวัด อำเภอ ตำบล และ ละติจูลองติจู',
      details2:
          'ละติจูลองติจูสามารถเพิ่มได้ 2 แบบ \nปุ่มสีเขียว ทำการดึงละติจูลองติจากมือถือ\nปุ่มสีส้ม กดเพิ่มข้อมูลได้'),
  OnBoarding(
      title: 'เพิ่มไฟล์KML',
      image: 'assets/images/5.png',
      details1: 'กดปุ่มอัพโหลดไฟล์ และกดปุ่มอัพโหลดไฟล์ KML ',
      details2:
          ' เมื่อเราเลือกแล้วทำสีเขียวเพิ่มยืนยั่นการเพิ่มไฟล์ KML\nหากต้องการยกเลิกที่เพิ่มมาให้กดปุ่มยกเลิก'),
  OnBoarding(
      title: 'เพิ่มรูปภาพ',
      image: 'assets/images/6.png',
      details2:
          ' เมื่อเสร็จแล้วทำสีเขียวเพิ่มยืนยั่นการเพิ่มรูปภาพ\nหากต้องการยกเลิกที่เพิ่มมาให้กดปุ่มยกเลิก',
      details1: 'กดปุ่มอัพโหลดไฟล์และกดปุ่มอัพเดทรูปภาพ'),
];
