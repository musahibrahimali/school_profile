import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_profile/index.dart';

class ProfileInfoBigCard extends StatelessWidget {
  final String firstText, secondText;
  final Widget icon;
  final int? maxLines;

  const ProfileInfoBigCard({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.icon,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          top: 16,
          bottom: 24,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: icon,
            ),
            Text(
              firstText,
              overflow: TextOverflow.ellipsis,
              maxLines: maxLines ?? 1,
              style: GoogleFonts.montserrat(
                fontSize: 16.0,
                color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorLightGrayFair,
              ),
            ),
            Text(
              secondText,
              overflow: TextOverflow.ellipsis,
              maxLines: maxLines ?? 1,
              style: GoogleFonts.montserrat(
                fontSize: 16.0,
                color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorLightGrayFair,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
