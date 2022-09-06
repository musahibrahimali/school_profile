import 'package:flutter/material.dart';
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
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: BrandColors.colorBackground,
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
    );
  }
}
