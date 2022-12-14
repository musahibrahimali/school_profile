import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_profile/index.dart';

class MobileInstitutionSection extends StatelessWidget {
  const MobileInstitutionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      () => Container(
        // margin: const EdgeInsets.only(top: kDefaultPadding * 4),
        width: double.infinity,
        decoration: BoxDecoration(
          color: themeController.isLightTheme ? const Color(0xFFF7E8FF).withOpacity(0.3) : BrandColors.colorDarkTheme,
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(Assets.imagesRecentWorkBg),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        pageController.animateToPage(
                          1,
                          duration: const Duration(seconds: 1),
                          curve: Curves.linear,
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          // controller: _pickupController,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.start,
                          enabled: false,
                          onChanged: (value) async {},
                          keyboardAppearance: themeController.isLightTheme ? Brightness.light : Brightness.dark,
                          decoration: InputDecoration(
                            hintText: "Search for schools",
                            hintStyle: GoogleFonts.montserrat(
                              color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                            ),
                            filled: false,
                            contentPadding: const EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                width: 1.0,
                                color: themeController.isLightTheme ? BrandColors.colorLightGray : BrandColors.colorWhiteAccent,
                                style: BorderStyle.solid,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                width: 1.0,
                                color: themeController.isLightTheme ? BrandColors.colorLightGray : BrandColors.colorWhiteAccent,
                                style: BorderStyle.solid,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                width: 1.0,
                                color: themeController.isLightTheme ? BrandColors.colorLightGray : BrandColors.colorWhiteAccent,
                                style: BorderStyle.solid,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                width: 1.0,
                                color: themeController.isLightTheme ? BrandColors.colorLightGray : BrandColors.colorWhiteAccent,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      pageController.animateToPage(
                        1,
                        duration: const Duration(seconds: 1),
                        curve: Curves.linear,
                      );
                    },
                    icon: Icon(
                      LineAwesomeIcons.search,
                      color: themeController.isLightTheme ? BrandColors.colorDarkTheme : BrandColors.colorBackground,
                      size: 28.0,
                    ),
                  ),
                ],
              ),
            ),
            MobileSectionTitle(
              title: "Popular Schools",
              subTitle: "Most visitors to our website in your area has wards in either of these Schools",
              color: const Color(0xFFFFB100),
              titleColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.white,
              subTitleColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.white,
            ),
            const SizedBox(height: kDefaultPadding * 1.5),
            SizedBox(
              width: double.infinity,
              child: popularSchools.isNotEmpty
                  ? Wrap(
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
                  : const NoSchoolsBox(),
            ),
            const SizedBox(height: kDefaultPadding * 2),
          ],
        ),
      ),
    );
  }
}
