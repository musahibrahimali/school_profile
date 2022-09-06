import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_profile/index.dart';

class MobileGetInTouchCard extends StatelessWidget {
  const MobileGetInTouchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>  Container(
        padding: const EdgeInsets.all(kDefaultPadding * 1),
        decoration: BoxDecoration(
          color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [kDefaultShadow],
        ),
        child: Row(
          children: [
            Image.asset(
              Assets.imagesEmail,
              height: 60.0,
              width: 60.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              child: SizedBox(
                height: 100.0,
                child: VerticalDivider(
                  color: themeController.isLightTheme ? BrandColors.colorLightGray : BrandColors.colorLightGrayFair,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextWidget(
                    text: "Want to learn more about these institutions?",
                    fontSize: 24.0,
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w900,
                    color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.white,
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  CustomTextWidget(
                    text: "Get in touch with us!",
                    fontWeight: FontWeight.w300,
                    color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.white,
                    fontSize: 18.0,
                  ),
                  DefaultButton(
                    text: "Get a quote!",
                    imageSrc: Assets.imagesHand,
                    press: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
