import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;
  final Color? textColor;
  final Color? iconColor;
  final Color? bgColor;
  final void Function()? onPressed;

  const ProfileListItem({
    Key? key,
    required this.icon,
    required this.text,
    this.hasNavigation = true,
    this.textColor,
    this.onPressed,
    this.iconColor,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const kSpacingUnit = 10;

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: kSpacingUnit.w * 5.5,
        margin: EdgeInsets.symmetric(
          horizontal: kSpacingUnit.w * 4,
        ).copyWith(
          bottom: kSpacingUnit.w * 2,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: kSpacingUnit.w * 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
          color: bgColor ?? BrandColors.kButtonBlue,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: kSpacingUnit.w * 2,
              offset: Offset(0, kSpacingUnit.w * 1),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: kSpacingUnit.w * 2.5,
              color: iconColor ?? BrandColors.white,
            ),
            SizedBox(width: kSpacingUnit.w * 1.5),
            CustomTextWidget(
              text: text,
              fontWeight: FontWeight.w500,
              color: textColor ?? BrandColors.colorWhiteAccent,
            ),
            const Spacer(),
            if (hasNavigation)
              Icon(
                LineAwesomeIcons.angle_right,
                size: kSpacingUnit.w * 2.5,
                color: iconColor ?? BrandColors.white,
              ),
          ],
        ),
      ),
    );
  }
}
