import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_profile/index.dart';

class TwoLineItem extends StatelessWidget {
  final String firstText, secondText;

  const TwoLineItem({
    Key? key,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          firstText,
          maxLines: 2,
          style: GoogleFonts.montserrat(
            fontSize: 16.0,
            color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorLightGrayFair,
          ),
        ),
        Text(
          secondText,
          maxLines: 2,
          style: GoogleFonts.montserrat(
            fontSize: 16.0,
            color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorLightGrayFair,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
