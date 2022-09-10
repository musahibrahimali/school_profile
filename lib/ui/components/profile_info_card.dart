import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_profile/index.dart';

class ProfileInfoCard extends StatelessWidget {
  final String? firstText;
  final String? secondText;
  final bool hasImage;
  final String? imagePath;

  const ProfileInfoCard({
    Key? key,
    this.firstText,
    this.secondText,
    this.hasImage = false,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: hasImage
            ? Obx(
                () => Center(
                  child: Image.asset(
                    imagePath!,
                    color: themeController.isLightTheme ? BrandColors.colorPrimary : BrandColors.colorWhiteAccent,
                    width: 25,
                    height: 25,
                  ),
                ),
              )
            : TwoLineItem(
                firstText: firstText!,
                secondText: secondText!,
              ),
      ),
    );
  }
}
