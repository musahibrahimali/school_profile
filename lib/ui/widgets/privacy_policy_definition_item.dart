import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_profile/index.dart';

class DefinitionTerm extends StatelessWidget {
  final String title;
  final String text;
  const DefinitionTerm({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0,
              spreadRadius: 0.5,
              offset: Offset(
                0.7,
                0.7,
              ),
            ),
          ],
        ),
        child: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: '${title.toUpperCase()} : ',
            style: GoogleFonts.montserrat(
              color: themeController.isLightTheme ? BrandColors.colorPrimary : BrandColors.colorWhiteAccent,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                text: text,
                style: GoogleFonts.montserrat(
                  fontSize: 18.0,
                  color: themeController.isLightTheme ? BrandColors.colorTextDark : BrandColors.colorWhiteAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
