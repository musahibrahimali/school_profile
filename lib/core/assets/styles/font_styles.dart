import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_profile/index.dart';

class FontStyles {
  static const fontWeightBlack = FontWeight.w900;
  static const fontWeightExtraBold = FontWeight.w800;
  static const fontWeightBold = FontWeight.bold;
  static const fontWeightSemiBold = FontWeight.w600;
  static const fontWeightMedium = FontWeight.w500;
  static const fontWeightNormal = FontWeight.normal;
  static const fontWeightLight = FontWeight.w300;
  static const fontWeightExtraLight = FontWeight.w200;
  static const fontWeightThin = FontWeight.w100;
  static const fontStyleNormal = FontStyle.normal;

  static get mapSearchBarFontStyle => GoogleFonts.montserrat(
        fontSize: BrandSizes.h4,
        color: NavigationService.context.textTheme.subtitle1!.color,
        fontWeight: fontWeightNormal,
        fontStyle: fontStyleNormal,
      );
}
