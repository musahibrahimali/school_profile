import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => AnimatedContainer(
          curve: Curves.easeInOutCubic,
          duration: const Duration(milliseconds: 500),
          width: _isCollapsed ? 300 : 70,
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            color: themeController.isLightTheme ? BrandColors.colorBackground : const Color.fromRGBO(20, 20, 20, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomDrawerHeader(
                  isCollapsed: _isCollapsed,
                ),
                const SizedBox(height: 20.0),
                BrandDivider(color: BrandColors.kLightGray),
                const SizedBox(height: 20.0),
                CustomListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.id,
                      (route) => false,
                    );
                  },
                  isCollapsed: _isCollapsed,
                  icon: Icons.store_mall_directory,
                  title: 'Home',
                  infoCount: 0,
                ),
                CustomListTile(
                  onTap: () {
                    Navigator.pop(context);
                    pageController.animateToPage(
                      1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOutCubic,
                    );
                  },
                  isCollapsed: _isCollapsed,
                  icon: LineAwesomeIcons.bar_chart,
                  title: 'Schools',
                  infoCount: 0,
                ),
                CustomListTile(
                  onTap: () {
                    Navigator.pop(context);
                    pageController.animateToPage(
                      2,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOutCubic,
                    );
                  },
                  isCollapsed: _isCollapsed,
                  icon: LineAwesomeIcons.bell,
                  title: 'Reviews',
                  infoCount: 0,
                ),
                CustomListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, BlogsPage.id);
                  },
                  isCollapsed: _isCollapsed,
                  icon: LineAwesomeIcons.blog,
                  title: 'Blog',
                  infoCount: 0,
                ),
                CustomListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AboutPage.id);
                  },
                  isCollapsed: _isCollapsed,
                  icon: LineAwesomeIcons.info,
                  title: 'About',
                  infoCount: 0,
                ),
                CustomListTile(
                  onTap: () {
                    Navigator.pop(context);
                    pageController.animateToPage(
                      3,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOutCubic,
                    );
                  },
                  isCollapsed: _isCollapsed,
                  icon: LineAwesomeIcons.user_shield,
                  title: 'Profile',
                  infoCount: 0,
                ),
                const SizedBox(height: 20.0),
                BrandDivider(color: BrandColors.kLightGray),
                const SizedBox(height: 20.0),
                const Spacer(),
                if (!userController.isUserLoggedIn || userController.currentUserInfo.isAdmin == true)
                  Column(
                    children: <Widget>[
                      BrandDivider(color: BrandColors.kLightGray),
                      CustomListTile(
                        isCollapsed: _isCollapsed,
                        icon: LineAwesomeIcons.school,
                        title: 'Register School',
                        infoCount: 0,
                        onTap: () {
                          Navigator.pushNamed(context, RegisterSchoolScreen.id);
                        },
                      ),
                    ],
                  ),
                if (userController.isUserLoggedIn || userController.currentUserInfo.isAdmin == true)
                  Column(
                    children: <Widget>[
                      CustomListTile(
                        isCollapsed: _isCollapsed,
                        icon: LineAwesomeIcons.bar_chart,
                        title: 'Admin Schools',
                        infoCount: 0,
                        onTap: () {
                          Navigator.pushNamed(context, AdminSchoolsScreen.id);
                        },
                      ),
                      BrandDivider(color: BrandColors.kLightGray),
                    ],
                  ),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: LineAwesomeIcons.cog,
                  title: 'Settings',
                  infoCount: 0,
                  onTap: () {
                    Navigator.pushNamed(context, SettingsPage.id);
                  },
                ),
                const SizedBox(height: 10),
                if (userController.isUserLoggedIn)
                  Column(
                    children: <Widget>[
                      BottomUserInfo(isCollapsed: _isCollapsed),
                      BrandDivider(color: BrandColors.kLightGray),
                    ],
                  ),
                Align(
                  alignment: _isCollapsed ? Alignment.bottomRight : Alignment.bottomCenter,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    icon: Icon(
                      _isCollapsed ? LineAwesomeIcons.angle_double_left : LineAwesomeIcons.angle_double_right,
                      color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                      size: 18.0,
                    ),
                    onPressed: () {
                      setState(() {
                        _isCollapsed = !_isCollapsed;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
