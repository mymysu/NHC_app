import 'package:flutter/material.dart';
import 'package:water_resources_application/app_styles.dart';
import '../size_configs.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.buttonName,
    required this.onPreesed,
    required this.bgcolor,
  }) : super(key: key);
  final String buttonName;
  final VoidCallback onPreesed;
  final Color bgcolor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        height: SizeConfig.blockSizeH!,
        width: SizeConfig.blockSizeH! * 100,
        child: TextButton(
          onPressed: onPreesed,
          child: Text(
            buttonName,
            style: kBodyText1,
          ),
          style: TextButton.styleFrom(backgroundColor: bgcolor),
        ),
      ),
    );
  }
}
