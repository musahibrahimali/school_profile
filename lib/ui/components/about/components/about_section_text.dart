import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class MobileAboutSectionText extends StatelessWidget {
  const MobileAboutSectionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 4),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: BrandColors.kCustomTextColor,
          height: 1.5,
        ),
      ),
    );
  }
}
