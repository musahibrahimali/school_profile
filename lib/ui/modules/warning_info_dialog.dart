import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_profile/index.dart';

class InfoDialog extends StatelessWidget {
  final String title;
  final String message;

  const InfoDialog({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 80,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(width: 5.0),
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: GoogleFonts.sourceSansPro(
                  fontSize: 18.0,
                  color: BrandColors.colorText,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 35.0),
              Text(
                message,
                maxLines: 10,
                style: GoogleFonts.sourceSansPro(
                  fontSize: 16.0,
                  color: BrandColors.colorDimText,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
