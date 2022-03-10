import 'package:flutter/material.dart';
import 'package:water_resources_application/app_styles.dart';
import 'package:water_resources_application/model/onboard_data.dart';
import 'package:water_resources_application/screen/screen_selected_typewater.dart';
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
              itemBuilder: ((context, index) => Column(
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
                          TextSpan(text: 'WE CAN '),
                          TextSpan(
                              text: 'HELP YOU ',
                              style: TextStyle(color: kPrimaryColor)),
                          TextSpan(text: 'TO BE A BETTER '),
                          TextSpan(text: 'VERSION OF '),
                          TextSpan(
                              text: 'YOURSELF ',
                              style: TextStyle(color: kPrimaryColor)),
                        ]),
                      ),
                      SizedBox(
                        height: sizeV * 5,
                      ),
                    ],
                  )),
            ),
          ),
          Expanded(
            flex: 1,
            child: currenPage == onboardingContents.length - 1
                ? MyTextButton(
                    bgcolor: kPrimaryColor,
                    buttonName: 'Get Started',
                    onPreesed: () {
                      Navigator.pushNamed(context, '/choiceTypeWaterAdd');
                    },
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OnBoardNavBtn(
                        name: 'Skip',
                        onPressed: () {
                          Navigator.pushNamed(context, '/choiceTypeWaterAdd');
                        },
                      ),
                      Row(
                        children: List.generate(onboardingContents.length,
                            (index) => dotIndicator(index)),
                      ),
                      OnBoardNavBtn(
                        name: 'Next',
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
