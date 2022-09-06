import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class AdminSchoolsScreen extends StatefulWidget {
  static const String id = "admin_schools_screen";
  const AdminSchoolsScreen({Key? key}) : super(key: key);

  @override
  State<AdminSchoolsScreen> createState() => _AdminSchoolsScreenState();
}

class _AdminSchoolsScreenState extends State<AdminSchoolsScreen> {
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

    return Scaffold(
      backgroundColor: BrandColors.colorBackground,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: BrandColors.colorBackground,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        // shadowColor: BrandColors.black.withOpacity(0.5),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: BrandColors.colorBackground,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MobileSectionTitle(
                  title: "Admin Schools",
                  subTitle: "All Your Schools",
                  titleColor: BrandColors.black,
                  subTitleColor: BrandColors.black,
                  color: const Color(0xFFFFB100),
                ),
                const SizedBox(height: kDefaultPadding * 1.5),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7E8FF).withOpacity(0.3),
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
    );
  }
}
