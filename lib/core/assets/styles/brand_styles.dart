import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_profile/index.dart';

class BrandStyles {
  static get headingTextStyle => GoogleFonts.montserrat(
        fontSize: 32.0,
        color: Colors.white,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.1,
      );
  static get whiteNameTextStyle => GoogleFonts.montserrat(
        fontSize: 24.0,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      );
  static get whiteSubHeadingTextStyle => GoogleFonts.montserrat(
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      );
  static get titleStyle => GoogleFonts.montserrat(
        fontSize: 22.0,
        color: BrandColors.colorText,
        fontWeight: FontWeight.w600,
      );
  static get subTitleStyle => GoogleFonts.montserrat(
        fontSize: 18.0,
        color: BrandColors.colorText,
        fontWeight: FontWeight.w200,
      );
  static get actionMenuStyle => GoogleFonts.montserrat(
        fontSize: 16.0,
        color: BrandColors.colorPrimary,
        fontWeight: FontWeight.w700,
        letterSpacing: 5,
      );
  static get onlineStyle => GoogleFonts.montserrat(
        fontSize: 10.0,
        color: BrandColors.colorGreen,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      );
  static get kilometerStyle => GoogleFonts.montserrat(
        fontSize: 14.0,
        color: BrandColors.kDark,
        fontWeight: FontWeight.w600,
        letterSpacing: 3,
      );
}
