import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:school_profile/index.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
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
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: false,
        physics: const BouncingScrollPhysics(),
        header: Obx(
          () => WaterDropMaterialHeader(
            distance: 40.0,
            color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
            backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
          ),
        ),
        onLoading: () async {
          // clear the schools list
          schoolController.schools.clear();
          HelperMethods.getAllSchools();
          if (mounted) {
            setState(() {});
          }
          _refreshController.loadComplete();
        },
        onRefresh: () async {
          // clear the schools list
          schoolController.schools.clear();
          // refresh the list
          HelperMethods.getAllSchools();
          if (schoolController.schools.isEmpty) {
            _refreshController.refreshCompleted();
          }
          // refresh failed
          _refreshController.refreshFailed();
        },
        dragStartBehavior: DragStartBehavior.start,
        child: SafeArea(
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
      ),
    );
  }
}
