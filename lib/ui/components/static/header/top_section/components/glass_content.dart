import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_profile/index.dart';

class MobileGlassContent extends StatelessWidget {
  const MobileGlassContent({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    int index = HelperFunctions.generateRandomNumber(0, 5);
    Map<String, String> item = defaultStrings[index];

    /// get the text to display on the page based on the route index
    String tag = item['tag']!;
    String title = item['title']!;
    String subtitle = item['subtitle']!;

    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Obx(
          () => Container(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5,
            ),
            constraints: BoxConstraints(
              maxWidth: 380.0,
              maxHeight: size.height * 0.3,
            ),
            width: double.infinity,
            color: themeController.isLightTheme ? Colors.white.withOpacity(0.0) : Colors.black.withOpacity(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tag,
                  style: GoogleFonts.dancingScript(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: BrandSizes.h5,
                  ),
                ),
                CustomText(
                  text: title,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  height: 1.5,
                ),
                const SizedBox(height: kDefaultPadding / 2),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.hurricane(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w100,
                    letterSpacing: 1.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
