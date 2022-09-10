import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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

    // get only the schools that was uploaded by the current user
    schoolModels = schoolModels
        .where(
          (element) => element.userId == userController.currentUserInfo.uid,
        )
        .toList();

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
                          child: InstitutionCard(
                            schoolModel: schoolModels[index],
                            onLike: () async {
                              if (userController.isUserLoggedIn == true) {
                                List<dynamic> _likes = [];
                                // update the school likes and set it to firebase
                                LikesModel likesModel = LikesModel(
                                  schoolId: schoolModels[index].id,
                                  userId: userController.currentUserInfo.uid,
                                );
                                // debugPrint("likes ${widget.schoolModel.likes}");
                                _likes.add(likesModel.toJson());
                                schoolModels[index].likes = _likes;

                                debugPrint("school likes ${schoolModels[index].likes}");
                                // create a new school model
                                SchoolModel schoolModel = schoolModels[index].copyWith(
                                  likes: schoolModels[index].likes,
                                );
                                // update the firebase database
                                bool response = await HelperMethods.updateSchool(schoolModel: schoolModel);
                                debugPrint("response $response");
                                HelperMethods.getAllSchools();
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
                                  builder: (BuildContext context) => SchoolProfilePage(schoolModel: schoolModel),
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
