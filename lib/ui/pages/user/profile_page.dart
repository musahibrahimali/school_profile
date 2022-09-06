import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_profile/index.dart';

class UserProfilePage extends StatefulWidget {
  static const String id = "user_profile_page";
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    const kSpacingUnit = 10;
    Widget profileInfo = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  Assets.iconsProfileIcon,
                  width: 200,
                  height: 200,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Obx(
            () => CustomText(
              text: userController.currentUserInfo.name ?? "User Name",
              color: themeController.isLightTheme ? BrandColors.colorDarkTheme : BrandColors.colorWhiteAccent,
              fontWeight: FontWeight.w700,
              fontSize: 22.0,
              maxLines: 2,
            ),
          ),
          const SizedBox(height: 10.0),
          Obx(
            () => CustomText(
              text: userController.currentUserInfo.email ?? "johndoe@email.com",
              color: !themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );

    Widget header = Obx(
      () {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(width: 30.0),
              profileInfo,
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SettingsPage.id);
                },
                child: Icon(
                  LineAwesomeIcons.cog,
                  color: !themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.black,
                  size: 32.0,
                ),
              ),
            ],
          ),
        );
      },
    );

    return Scaffold(
      body: Obx(() {
        return Column(
          children: <Widget>[
            SizedBox(height: kSpacingUnit.w * 1),
            header,
            Expanded(child: Container()),
            ProfileListItem(
              onPressed: () async {
                authRepo.signOut();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomeScreen.id,
                  (route) => false,
                );
              },
              icon: LineAwesomeIcons.alternate_sign_out,
              bgColor: themeController.isLightTheme ? BrandColors.white : BrandColors.black,
              iconColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
              textColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
              text: 'Logout',
              hasNavigation: false,
            ),
          ],
        );
      }),
    );
  }
}
