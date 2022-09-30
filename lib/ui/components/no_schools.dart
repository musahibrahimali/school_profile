import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_profile/index.dart';

class NoSchoolsBox extends StatelessWidget {
  final String? keyword;
  final String? message;
  final bool showExtra;
  const NoSchoolsBox({
    Key? key,
    this.keyword,
    this.message,
    this.showExtra = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0.w),
        padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 5.0.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: themeController.isLightTheme ? BrandColors.colorLightGray.withOpacity(0.5) : BrandColors.colorDarkBlue.withOpacity(0.5),
              blurRadius: 15.0,
              spreadRadius: 0.5,
              offset: const Offset(0.5, 5.0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomText(
              text: message ?? "No Schools Listed",
              color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
              fontSize: 2.5.h,
              maxLines: 8,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 2.0.h),
            showExtra
                ? CustomText(
                    text: "Try searching for a different keyword or check out our most liked schools",
                    color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                    fontSize: 2.5.h,
                    maxLines: 8,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w700,
                  )
                : Container(),
            SizedBox(height: 2.0.h),
            showExtra
                ? CustomText(
                    text: "OR",
                    color: themeController.isLightTheme ? BrandColors.colorDarkGreen : BrandColors.colorWhiteAccent,
                    fontSize: 2.5.h,
                    maxLines: 8,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w900,
                  )
                : Container(),
            SizedBox(height: 2.0.h),
            CustomButton(
              onPressed: () {
                // construct a google search url with the keyword
                String url = "https://www.google.com/search?q=$keyword";
                HelperFunctions.iLaunchUrl(keyword != null ? url : "https://www.ghanabusinessweb.com/search_city-kumasi-primary_schools-862-118-6795.html");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Search the web",
                    color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                    fontSize: 2.0.h,
                    maxLines: 2,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
