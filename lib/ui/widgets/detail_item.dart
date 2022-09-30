import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_profile/index.dart';

class MobileDetailItem extends StatelessWidget {
  final String title;
  final String? detail;
  final Color? titleColor;
  final Color? detailColor;
  final Color? backgroundColor;
  final double? titleSize;
  final double? detailSize;
  final FontWeight? titleWeight;
  final FontWeight? detailWeight;
  final int? maxLines;
  final Widget? detailWidget;

  const MobileDetailItem({
    Key? key,
    required this.title,
    this.detail,
    this.titleColor,
    this.detailColor,
    this.backgroundColor,
    this.titleSize,
    this.detailSize,
    this.titleWeight,
    this.detailWeight,
    this.maxLines,
    this.detailWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 1,
          vertical: kDefaultPadding,
        ),
        decoration: BoxDecoration(
          color: backgroundColor ?? BrandColors.colorWhiteAccent,
          // borderRadius: BorderRadius.circular(
          //   kDefaultPadding * 1.5,
          // ),
          boxShadow: themeController.isLightTheme
              ? <BoxShadow>[
                  BoxShadow(
                    color: BrandColors.kGrey.withOpacity(0.5),
                    offset: const Offset(0.5, 6.0),
                    blurRadius: 7.0,
                    spreadRadius: 5.0,
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // clip rect to make sure the text doesn't overflow
            Flexible(
              child: ClipRRect(
                child: CustomTextWidget(
                  text: "${title.toUpperCase()} : ",
                  fontSize: 18.0,
                  fontWeight: titleWeight ?? FontWeight.w900,
                  color: titleColor ?? BrandColors.colorText,
                  textAlign: TextAlign.left,
                  maxLines: 4,
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                child: detailWidget ??
                    CustomTextWidget(
                      text: detail ?? "",
                      fontSize: detailSize ?? 18.0,
                      fontWeight: detailWeight ?? FontWeight.w400,
                      color: detailColor ?? BrandColors.colorText,
                      maxLines: maxLines ?? 30,
                      textAlign: TextAlign.left,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
