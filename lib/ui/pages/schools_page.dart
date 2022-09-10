import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
    List<SchoolModel> schoolModels = schoolController.filteredSchoolList;

    return Obx(
      () => Scaffold(
        backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: themeController.isLightTheme ? const Color(0xFFF7E8FF).withOpacity(0.3) : BrandColors.colorDarkTheme.withOpacity(0.5),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(Assets.imagesRecentWorkBg),
                ),
              ),
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
                            child: InstitutionCard(
                              schoolModel: schoolModels[index],
                              onLike: () async {
                                if (userController.isUserLoggedIn == true) {
                                  if (schoolModels[index].likes!.isEmpty) {
                                    FirebaseFirestore.instance.collection(FirestorePaths.schoolsCollection).doc(schoolModels[index].id).update(
                                      {
                                        'likes': FieldValue.arrayUnion([
                                          {'user_id': userController.currentUserInfo.uid, 'school_id': schoolModels[index].id}
                                        ])
                                      },
                                    ).whenComplete(() {
                                      debugPrint('Field Added');
                                      schoolController.schools.clear();
                                      schoolController.clearFilteredSchools();
                                      HelperMethods.getAllSchools();
                                    });
                                  } else {
                                    for (dynamic like in schoolModels[index].likes!) {
                                      if (like['user_id'] == userController.currentUserInfo.uid) {
                                        // debugPrint("were here $like");
                                        FirebaseFirestore.instance.collection(FirestorePaths.schoolsCollection).doc(schoolModels[index].id).update(
                                          {
                                            'likes': FieldValue.arrayRemove([
                                              {'school_id': schoolModels[index].id, 'user_id': userController.currentUserInfo.uid}
                                            ])
                                          },
                                        ).whenComplete(() {
                                          debugPrint('Field Deleted');
                                          schoolController.schools.clear();
                                          schoolController.clearFilteredSchools();
                                          HelperMethods.getAllSchools();
                                        });
                                      } else {
                                        FirebaseFirestore.instance.collection(FirestorePaths.schoolsCollection).doc(schoolModels[index].id).update(
                                          {
                                            'likes': FieldValue.arrayUnion([
                                              {'user_id': userController.currentUserInfo.uid, 'school_id': schoolModels[index].id}
                                            ])
                                          },
                                        ).whenComplete(() {
                                          debugPrint('Field Added');
                                          schoolController.schools.clear();
                                          schoolController.clearFilteredSchools();
                                          HelperMethods.getAllSchools();
                                        });
                                      }
                                    }
                                  }
                                } else {
                                  showCustomFlushBar(
                                    context: context,
                                    title: 'Info',
                                    borderRadius: BorderRadius.circular(50.0),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10.0.w,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 1.0.w,
                                      vertical: 1.0.h,
                                    ),
                                    titleColor: themeController.isLightTheme ? BrandColors.colorPink : BrandColors.colorWhiteAccent,
                                    message: 'Please log in to like a school',
                                    messageColor: themeController.isLightTheme ? BrandColors.colorPink : BrandColors.colorWhiteAccent,
                                    icon: LineAwesomeIcons.exclamation_circle,
                                    iconColor: themeController.isLightTheme ? BrandColors.kErrorColor : BrandColors.colorWhiteAccent,
                                    backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkBlue,
                                  );
                                }
                              },
                              onPressed: () {
                                SchoolModel schoolModel = schoolModels[index];
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => SchoolProfilePage(
                                      schoolModel: schoolModel,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.0.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
