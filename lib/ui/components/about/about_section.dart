import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_profile/index.dart';

class MobileAboutSection extends StatelessWidget {
  const MobileAboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 2,
          vertical: kDefaultPadding * 2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            MobileAboutTextWithSign(),
            SizedBox(height: kDefaultPadding * 2),
            MobileAboutSectionText(
              text:
                  "Building a mobile/web application that provides a profile of Ghana's pre-school, primary and junior high schools is the aim of this project. Users will be able to search for, discover, and find pre-school, primary and junior high schools using the web app's features and functionalities.",
            ),
            SizedBox(height: kDefaultPadding * 2),
            MobileExperienceCard(numOfExp: "6"),
            SizedBox(height: kDefaultPadding * 2),
            MobileAboutSectionText(
              text:
                  "As technology and innovation advance quickly, people have developed more effective methods of getting information on the internet. The revolutionary trends of computerization have reached the peaks achieving global goals in all fields and sectors. Web-based profiling systems are getting computerized and are leading to a new innovative way to approach things.",
            ),
          ],
        ),
      ),
    );
  }
}
