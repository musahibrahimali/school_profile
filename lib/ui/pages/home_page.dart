import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SchoolModel> schools = schoolController.schools;
  // get the first three schools if they exist
  List<SchoolModel> firstThreeSchools = schoolController.schools.length > 3 ? schoolController.schools.sublist(0, 3) : schoolController.schools;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              MobileHeader(),
              MobileInstitutionSection(),
              MobileHeroSection(),
              MobileFeedBackSection(),
              MobileFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
