import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_profile/index.dart';

class MobileAboutTextWithSign extends StatelessWidget {
  const MobileAboutTextWithSign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "About \nthis project",
          maxLines: 3,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 38.0,
            fontWeight: FontWeight.w900,
            color: const Color(0xFFA600FF),
          ),
        ),
        const SizedBox(height: kDefaultPadding * 2),
        Image.asset(
          Assets.imagesSign,
        ),
      ],
    );
  }
}
