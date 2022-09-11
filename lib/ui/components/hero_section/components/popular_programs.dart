import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_profile/index.dart';

class MobileProgramCard extends StatefulWidget {
  final int index;
  const MobileProgramCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<MobileProgramCard> createState() => _MobileProgramCardState();
}

class _MobileProgramCardState extends State<MobileProgramCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      child: Obx(
        () => Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            vertical: 2.0,
            horizontal: 2.0,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          decoration: BoxDecoration(
            color: themeController.isLightTheme ? popularCourses[widget.index].color : BrandColors.colorDarkTheme,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
              width: 1.0,
            ),
            boxShadow: [kDefaultCardShadow],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(kDefaultPadding * 1.5),
                // height: 120.0,
                // width: 120.0,
                decoration: BoxDecoration(
                  color: themeController.isLightTheme ? Colors.white : BrandColors.colorDarkTheme,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
                    width: 2.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.0, 20.0),
                      blurRadius: 30.0,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Image.asset(
                  popularCourses[widget.index].image,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              CustomTextWidget(
                text: popularCourses[widget.index].title,
                fontSize: 2.5.h,
                color: themeController.isLightTheme ? BrandColors.colorTextDark : BrandColors.colorWhiteAccent, //
              ),
            ],
          ),
        ),
      ),
    );
  }
}
