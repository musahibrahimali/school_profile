import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_profile/index.dart';

class MobileFeedBackSection extends StatelessWidget {
  const MobileFeedBackSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2.5),
        decoration: BoxDecoration(
          color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
        ),
        child: Column(
          children: <Widget>[
            MobileSectionTitle(
              title: "Feedbacks Received",
              subTitle: "Parent’s  and Guardians testimonials",
              color: const Color(0xFF00B1FF),
              titleColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
              subTitleColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
            ),
            const SizedBox(height: kDefaultPadding),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  feedbacks.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: MobileFeedbackCard(
                      index: index,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
