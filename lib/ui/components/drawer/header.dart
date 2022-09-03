import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class CustomDrawerHeader extends StatelessWidget {
  final bool isCollapsed;
  final double? height;

  const CustomDrawerHeader({
    Key? key,
    required this.isCollapsed,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: height ?? 60.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 5.0),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage(Assets.imagesLogo),
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (isCollapsed) const SizedBox(width: 10),
          if (isCollapsed)
            Expanded(
              flex: 3,
              child: Obx(
                () => CustomText(
                  text: userController.currentUserInfo.name ?? 'User Name',
                  color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  maxLines: 2,
                ),
              ),
            ),
          if (isCollapsed) const Spacer(),
          if (isCollapsed)
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  LineAwesomeIcons.search,
                  color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
