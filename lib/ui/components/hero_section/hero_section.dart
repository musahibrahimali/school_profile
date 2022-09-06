import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_profile/index.dart';

class MobileHeroSection extends StatelessWidget {
  const MobileHeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => MobileSectionTitle(
            color: const Color(0xFFFF0000),
            title: "School Curriculums",
            subTitle: "All Schools adopt one or more of these curriculums",
            titleColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
            subTitleColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Expanded(
                    child: MobileProgramCard(index: 0),
                  ),
                  // SizedBox(width: 15.0),
                  Expanded(
                    child: MobileProgramCard(index: 1),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Expanded(
                    child: MobileProgramCard(index: 2),
                  ),
                  // SizedBox(width: 15.0),
                  Expanded(
                    child: MobileProgramCard(index: 3),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
