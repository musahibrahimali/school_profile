import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_profile/index.dart';

class SchoolsPage extends StatefulWidget {
  static const String id = "schools_page";
  const SchoolsPage({Key? key}) : super(key: key);

  @override
  State<SchoolsPage> createState() => _SchoolsPageState();
}

class _SchoolsPageState extends State<SchoolsPage> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

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
    List<SchoolModel> popularSchools = [];
    // get the schools with the most likes
    List<SchoolModel> mostLikedSchools = schoolController.schools;
    // if mostLikedSchools is not empty
    if (mostLikedSchools.isNotEmpty) {
      // sort the schools by likes
      mostLikedSchools.sort((a, b) => b.likes!.length.compareTo(a.likes!.length));
      // get the first three schools if they exist
      popularSchools = mostLikedSchools.length > 3 ? mostLikedSchools.sublist(0, 3) : mostLikedSchools;
    } else {
      popularSchools = mostLikedSchools.length > 3 ? mostLikedSchools.sublist(0, 3) : mostLikedSchools;
    }

    return Obx(
      () => Scaffold(
        backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: true,
          physics: const BouncingScrollPhysics(),
          header: Obx(
            () => WaterDropMaterialHeader(
              distance: 40.0,
              color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
              backgroundColor: themeController.isLightTheme ? const Color(0xff6078ff) : BrandColors.colorDarkTheme,
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
                                onDelete: () async {
                                  showLoading(context);
                                  bool response = await HelperMethods.deleteSchoolById(schoolId: schoolModels[index].id!);
                                  // debugPrint("response $response");
                                  if (response) {
                                    schoolController.schools.clear();
                                    HelperMethods.getAllSchools();
                                    Navigator.pop(context);
                                    showCustomFlushBar(
                                      context: context,
                                      message: "There was an error deleting school",
                                    );
                                    setState(() {});
                                  } else {
                                    showCustomFlushBar(
                                      context: context,
                                      message: "There was an error deleting school",
                                    );
                                  }
                                },
                                onEdit: () async {
                                  // get the school details from the index
                                  SchoolModel schoolModel = schoolModels[index];
                                  schoolController.setSchoolModelDetailsUpForEditing(schoolModel);
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterSchoolScreen()));
                                },
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
                    if (searchSchoolController.text.isNotEmpty && schoolController.filteredSchoolList.isEmpty)
                      Center(
                        child: NoSchoolsBox(
                          showExtra: true,
                          keyword: searchSchoolController.text.isNotEmpty ? searchSchoolController.text : null,
                          message: searchSchoolController.text.isNotEmpty ? "No schools found for ${searchSchoolController.text}" : "No schools Listed",
                        ),
                      ),
                    SizedBox(height: 2.0.h),
                    if (searchSchoolController.text.isNotEmpty && schoolController.filteredSchoolList.isEmpty)
                      Wrap(
                        spacing: kDefaultPadding,
                        runSpacing: kDefaultPadding * 1,
                        children: List.generate(
                          popularSchools.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: InstitutionCard(
                              onDelete: () async {
                                showLoading(context);
                                bool response = await HelperMethods.deleteSchoolById(schoolId: popularSchools[index].id!);
                                // debugPrint("response $response");
                                if (response) {
                                  schoolController.schools.clear();
                                  HelperMethods.getAllSchools();
                                  Navigator.pop(context);
                                  showCustomFlushBar(
                                    context: context,
                                    message: "There was an error deleting school",
                                  );
                                } else {
                                  showCustomFlushBar(
                                    context: context,
                                    message: "There was an error deleting school",
                                  );
                                }
                              },
                              onEdit: () async {
                                // get the school details from the index
                                SchoolModel schoolModel = popularSchools[index];
                                schoolController.setSchoolModelDetailsUpForEditing(schoolModel);
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterSchoolScreen()));
                              },
                              onLike: () async {
                                if (userController.isUserLoggedIn == true) {
                                  if (popularSchools[index].likes!.isEmpty) {
                                    FirebaseFirestore.instance.collection(FirestorePaths.schoolsCollection).doc(popularSchools[index].id).update(
                                      {
                                        'likes': FieldValue.arrayUnion([
                                          {'user_id': userController.currentUserInfo.uid, 'school_id': popularSchools[index].id}
                                        ])
                                      },
                                    ).whenComplete(() {
                                      debugPrint('Field Added');
                                      schoolController.schools.clear();
                                      schoolController.clearFilteredSchools();
                                      HelperMethods.getAllSchools();
                                    });
                                  } else {
                                    for (dynamic like in popularSchools[index].likes!) {
                                      if (like['user_id'] == userController.currentUserInfo.uid) {
                                        // debugPrint("were here $like");
                                        FirebaseFirestore.instance.collection(FirestorePaths.schoolsCollection).doc(popularSchools[index].id).update(
                                          {
                                            'likes': FieldValue.arrayRemove([
                                              {'school_id': popularSchools[index].id, 'user_id': userController.currentUserInfo.uid}
                                            ])
                                          },
                                        ).whenComplete(() {
                                          debugPrint('Field Deleted');
                                          schoolController.schools.clear();
                                          schoolController.clearFilteredSchools();
                                          HelperMethods.getAllSchools();
                                        });
                                      } else {
                                        FirebaseFirestore.instance.collection(FirestorePaths.schoolsCollection).doc(popularSchools[index].id).update(
                                          {
                                            'likes': FieldValue.arrayUnion([
                                              {'user_id': userController.currentUserInfo.uid, 'school_id': popularSchools[index].id}
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
                              schoolModel: popularSchools[index],
                              onPressed: () {
                                SchoolModel schoolModel = popularSchools[index];
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => SchoolProfilePage(schoolModel: schoolModel),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
