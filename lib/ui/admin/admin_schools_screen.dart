import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

    return Obx(
      () => Scaffold(
        backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
          iconTheme: IconThemeData(color: themeController.isLightTheme ? BrandColors.black : BrandColors.white),
          elevation: 0,
          title: Text(
            "Admin Schools",
            style: TextStyle(
              color: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          shadowColor: themeController.isLightTheme ? BrandColors.black.withOpacity(0.5) : Colors.transparent,
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
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
                    titleColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                    subTitleColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                    color: const Color(0xFFFFB100),
                  ),
                  const SizedBox(height: kDefaultPadding * 1.5),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: themeController.isLightTheme ? const Color(0xFFF7E8FF).withOpacity(0.3) : BrandColors.colorDarkTheme,
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
                                  List<dynamic> _likes = [];
                                  // update the school likes and set it to firebase
                                  LikesModel likesModel = LikesModel(
                                    schoolId: schoolModels[index].id,
                                    userId: userController.currentUserInfo.uid,
                                  );
                                  // debugPrint("likes ${widget.schoolModel.likes}");
                                  _likes.add(likesModel.toJson());
                                  schoolModels[index].likes = _likes;

                                  // debugPrint("school likes ${schoolModels[index].likes}");
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
      ),
    );
  }
}
