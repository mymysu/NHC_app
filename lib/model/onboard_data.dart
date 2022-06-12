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
      image:
          'https://firebasestorage.googleapis.com/v0/b/db-water-resources.appspot.com/o/images_onboarding%2F1.png?alt=media&token=84de1ca9-fab8-4d0c-875a-d932117d5648',
      details1: 'หน้าแรกจะบอกข้อมูลที่ต้องการจะเก็บข้อมูลและแนะนำ',
      details2: 'ให้รู้ความหมายแหล่งน้ำก่อนจะเพิ่มข้อมูล'),
  OnBoarding(
      title: 'ขั้นแรกการเพิ่มข้อมูล',
      image:
          'https://firebasestorage.googleapis.com/v0/b/db-water-resources.appspot.com/o/images_onboarding%2F2.png?alt=media&token=d773958b-ada3-49fe-b1a9-46d02627b4a3',
      details1: 'เมื่อรู้ความหมายและกดเลือกเพิ่มข้อมูล',
      details2: 'ทำการถ่ายรูปภาพแหล่งน้ำประกอบ ถ่ายเสร็จกด ส่ง'),
  OnBoarding(
      title: 'หน้าแอดข้อมูลแหล่งน้ำ',
      image:
          'https://firebasestorage.googleapis.com/v0/b/db-water-resources.appspot.com/o/images_onboarding%2F3.png?alt=media&token=c87bf414-1ddf-491e-81d8-7afd5e31c852',
      details1:
          'รูปภาพที่ถ่ายไปจะขึ้นมาและดึงที่ตั้งในมือถือเป็นที่อยู่แหล่งน้ำ',
      details2: 'หากต้องการถ่ายรูปใหม่ให้กด รูปกล้อง'),
  OnBoarding(
      title: 'เลือกประเภทของแหล่งน้ำ',
      image:
          'https://firebasestorage.googleapis.com/v0/b/db-water-resources.appspot.com/o/images_onboarding%2F4.png?alt=media&token=d2e46a0b-b957-476b-9368-ae74ab9089cf',
      details1: 'กดเลือกประภทแหล่งน้ำที่ช่อง ควรเลือกประเภทให้ถูกต้อง',
      details2: 'หากไม่รู้ความหมายได้ที่หน้าประชาสัมพันธ์'),
  OnBoarding(
      title: 'ที่อยู่แหล่งน้ำ',
      image:
          'https://firebasestorage.googleapis.com/v0/b/db-water-resources.appspot.com/o/images_onboarding%2F5.png?alt=media&token=b86a1786-a9f2-4501-965f-a9245515e91e',
      details1: 'โดยข้อมูลเริ่มต้นคือที่ตั้งในมือถือ',
      details2:
          'หากต้องการกรอกที่ตั้งเอง สามารถใส่เลขละติจูดลองติจูดเป็นที่ตั้งได้'),
  OnBoarding(
      title: 'คำอธิบาย',
      image:
          'https://firebasestorage.googleapis.com/v0/b/db-water-resources.appspot.com/o/images_onboarding%2F6.png?alt=media&token=250c2100-73e2-4bd1-ba56-36c58449dfbe',
      details1: 'ที่ลักษณะที่ตั้ง หรือ ลักษณะแหล่งน้ำ ปริมาณน้ำ',
      details2: 'เมื่อกรอกข้อมูลเสร็จกดยืนยันการเพิ่ม'),
  OnBoarding(
      title: 'หน้าตรวจสอบข้อมูล',
      image:
          'https://firebasestorage.googleapis.com/v0/b/db-water-resources.appspot.com/o/images_onboarding%2F7.png?alt=media&token=592b55bb-2501-46b8-a8d1-a6fa10b1308d',
      details1:
          'มีเวลา google map และข้อมูลที่กรอกไป เมื่อตรวจสอบเสร็จ กดยืนยันรอสักครู่ ',
      details2: ' เพิ่มข้อมูลเสร็จจะไปหน้าประวัติการเพิ่มข้อมูล'),
  OnBoarding(
      title: 'ประวัติการเพิ่มข้อมูล',
      image:
          'https://firebasestorage.googleapis.com/v0/b/db-water-resources.appspot.com/o/images_onboarding%2F8.png?alt=media&token=2675d573-5744-4893-a710-2afa28c644f7',
      details2: 'เป็นประวัติการเพิ่ม ยกเลิก และการปฎิเสธการเพิ่มข้อมูล',
      details1: 'สามารถกดยกเลิกได้โดยระบุเหตุผลที่ยกเลิก'),
];
