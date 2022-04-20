import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_resources_application/app_styles.dart';
import 'package:water_resources_application/model/onboard_data.dart';
import 'package:water_resources_application/size_configs.dart';
import 'package:water_resources_application/widget/button_onboard_nav.dart';
import 'package:water_resources_application/widget/button_selected_typewater_text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currenPage = 0;
  PageController _pageController = PageController(initialPage: 0);
  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(microseconds: 400),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: currenPage == index ? kPrimaryColor : kSecondaryColor,
          shape: BoxShape.circle),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 9,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currenPage = value;
                });
              },
              itemCount: onboardingContents.length,
              itemBuilder: ((context, index) => index == 0
                  ? onboard_page1(
                      sizeV: sizeV,
                      index: index,
                    )
                  : onboard_page2(sizeV: sizeV, index: index)),
            ),
          ),
          Expanded(
            flex: 1,
            child: currenPage == onboardingContents.length - 1
                ? MyTextButton(
                    bgcolor: kPrimaryColor,
                    buttonName: 'เพิ่มข้อมูลแหล่งน้ำ',
                    onPreesed: () {
                      Navigator.pushNamed(context, '/addBeginDatawatersource');
                    },
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OnBoardNavBtn(
                        name: 'ข้าม',
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/addBeginDatawatersource');
                        },
                      ),
                      Row(
                        children: List.generate(onboardingContents.length,
                            (index) => dotIndicator(index)),
                      ),
                      OnBoardNavBtn(
                        name: 'ต่อไป',
                        onPressed: () {
                          _pageController.nextPage(
                              duration: Duration(microseconds: 400),
                              curve: Curves.easeInOut);
                        },
                      )
                    ],
                  ),
          )
        ],
      )),
    );
  }
}

class onboard_page1 extends StatelessWidget {
  const onboard_page1({
    Key? key,
    required this.sizeV,
    required this.index,
  }) : super(key: key);

  final double sizeV;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: sizeV * 5,
        ),
        Text(onboardingContents[index].title,
            style: kTitle, textAlign: TextAlign.center),
        SizedBox(
          height: sizeV * 5,
        ),
        Container(
          height: sizeV * 40,
          child: Image.asset(
            onboardingContents[index].image,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: sizeV * 5,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(style: kBodyText1, children: [
            TextSpan(text: onboardingContents[index].details1),
            TextSpan(
                text: onboardingContents[index].details2,
                style: TextStyle(color: kPrimaryColor)),
            // TextSpan(text: 'TO BE A BETTER '),
            // TextSpan(text: 'VERSION OF '),
            // TextSpan(
            //     text: 'YOURSELF ',
            //     style: TextStyle(color: kPrimaryColor)),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, '/datawatersource'),
            borderRadius: BorderRadius.circular(6),
            splashColor: Colors.black12,
            child: Container(
              height: 35,
              width: sizeV * 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.green,
              ),
              child: Center(
                child: Text(
                  "ความหมายแหล่งน้ำ",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.prompt(
                    color: bgadddataColor,
                    fontSize: SizeConfig.blockSizeH! * 4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: sizeV * 5,
        ),
      ],
    );
  }
}

class onboard_page2 extends StatelessWidget {
  const onboard_page2({
    Key? key,
    required this.sizeV,
    required this.index,
  }) : super(key: key);

  final double sizeV;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: sizeV * 5,
        ),
        Text(onboardingContents[index].title,
            style: kTitle, textAlign: TextAlign.center),
        SizedBox(
          height: sizeV * 5,
        ),
        Container(
          height: sizeV * 40,
          child: Image.asset(
            onboardingContents[index].image,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: sizeV * 5,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(style: kBodyText1, children: [
            TextSpan(text: "${onboardingContents[index].details1}\n"),
            TextSpan(
                text: onboardingContents[index].details2,
                style: TextStyle(color: kPrimaryColor, fontSize: sizeV * 2)),
            // TextSpan(text: 'TO BE A BETTER '),
            // TextSpan(text: 'VERSION OF '),
            // TextSpan(
            //     text: 'YOURSELF ',
            //     style: TextStyle(color: kPrimaryColor)),
          ]),
        ),
        SizedBox(
          height: sizeV * 5,
        ),
      ],
    );
  }
}
