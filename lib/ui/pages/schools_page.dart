import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_profile/index.dart';

class SchoolsPage extends StatefulWidget {
  static const String id = "schools_page";
  const SchoolsPage({Key? key}) : super(key: key);

  @override
  State<SchoolsPage> createState() => _SchoolsPageState();
}

class _SchoolsPageState extends State<SchoolsPage> {
  @override
  void initState() {
    if (schoolController.schools.isEmpty) {
      HelperMethods.getAllSchools();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<SchoolModel> schoolModels = schoolController.schools;

    // debugPrint("school map address ${schoolModels[0].mapAddress!.toJson()}");

    return Obx(
      () => Scaffold(
        backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          width: double.infinity,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MobileSectionTitle(
                    title: "All Available Schools",
                    subTitle: "All Schools in our database",
                    titleColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                    subTitleColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                    color: const Color(0xff6078ff),
                  ),
                  const SizedBox(height: kDefaultPadding * 1.0),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: kDefaultPadding,
                        runSpacing: kDefaultPadding * 2,
                        children: List.generate(
                          schoolModels.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: MobileInstitutionCard(
                              schoolModel: schoolModels[index],
                              press: () {
                                SchoolModel schoolModel = schoolModels[index];
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => AdminSchoolProfileScreen(schoolModel: schoolModel),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding * 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
