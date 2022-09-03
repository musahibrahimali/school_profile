import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class SettingsPage extends StatefulWidget {
  static const id = "settings_page";

  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    const kSpacingUnit = 10;

    ThemeSwitcher themeSwitcher = ThemeSwitcher(
      builder: (context) {
        return AnimatedCrossFade(
          duration: const Duration(milliseconds: 200),
          crossFadeState: ThemeModelInheritedNotifier.of(context).theme.brightness == Brightness.dark ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: GestureDetector(
            onTap: () {
              ThemeSwitcher.of(context).changeTheme(
                theme: BrandThemes.lightTheme(context),
              );
              themeController.toggleTheme();
            },
            child: Icon(
              LineAwesomeIcons.sun,
              color: !themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorDarkTheme,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
          secondChild: GestureDetector(
            onTap: () {
              ThemeSwitcher.of(context).changeTheme(
                theme: BrandThemes.darkTheme(context),
              );
              themeController.toggleTheme();
            },
            child: Icon(
              LineAwesomeIcons.moon,
              color: !themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorDarkTheme,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
        );
      },
    );

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: kSpacingUnit.w * 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          LineAwesomeIcons.angle_left,
                          color: !themeController.isLightTheme ? BrandColors.white : BrandColors.black,
                          size: ScreenUtil().setSp(kSpacingUnit.w * 3),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(child: Container()),
                      SizedBox(width: kSpacingUnit.w * 3),
                      themeSwitcher,
                      SizedBox(width: kSpacingUnit.w * 1.5),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: <Widget>[
                        ProfileListItem(
                          icon: LineAwesomeIcons.user_shield,
                          text: 'Privacy Policy',
                          bgColor: themeController.isLightTheme ? BrandColors.white : BrandColors.black,
                          iconColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                          textColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                        ),
                        ProfileListItem(
                          icon: LineAwesomeIcons.history,
                          text: 'History',
                          bgColor: themeController.isLightTheme ? BrandColors.white : BrandColors.black,
                          iconColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                          textColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                        ),
                        ProfileListItem(
                          icon: LineAwesomeIcons.question_circle,
                          text: 'Help & Support',
                          bgColor: themeController.isLightTheme ? BrandColors.white : BrandColors.black,
                          iconColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                          textColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                        ),
                        ProfileListItem(
                          icon: LineAwesomeIcons.user_plus,
                          text: 'Invite a Friend',
                          bgColor: themeController.isLightTheme ? BrandColors.white : BrandColors.black,
                          iconColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                          textColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
          );
        },
      ),
    );
  }
}
