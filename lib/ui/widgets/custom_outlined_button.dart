import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_profile/index.dart';

class CustomOutlineButton extends StatelessWidget {
  final String? title;
  final void Function()? onPressed;
  final Color? color;

  const CustomOutlineButton({
    Key? key,
    this.title,
    this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: color ?? BrandColors.colorPrimaryDark),
        primary: color ?? BrandColors.colorPrimaryDark,
        textStyle: TextStyle(
          color: color ?? BrandColors.colorPrimaryDark,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      onPressed: onPressed ??
          () {
            Navigator.pop(context);
          },
      child: SizedBox(
        height: 50.0,
        child: Center(
          child: Text(
            title ?? "CLOSE",
            style: GoogleFonts.montserrat(
              fontSize: 15.0,
              color: color ?? BrandColors.colorPrimaryDark,
            ),
          ),
        ),
      ),
    );
  }
}
