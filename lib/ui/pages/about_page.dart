import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class AboutPage extends StatefulWidget {
  static const String id = "about_page";
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: _scaffoldKey,
        backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
        appBar: AppBar(
          backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
          elevation: 0,
          leading: InkWell(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: themeController.isLightTheme ? BrandColors.colorDarkTheme : BrandColors.colorWhiteAccent,
                  width: 1.5,
                ),
              ),
              child: Icon(
                LineAwesomeIcons.angle_left,
                color: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                size: 28.0,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                // MobileHeader(),
                MobileAboutSection(),
                MobileFeedBackSection(),
                MobileContactSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
