import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_profile/index.dart';

class MobileAllInstitutions extends StatelessWidget {
  const MobileAllInstitutions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SchoolModel> schoolModels = schoolController.schools;
    // return a grid view with four containers
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF7E8FF).withOpacity(0.3),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Assets.imagesRecentWorkBg),
        ),
      ),
      child: Column(
        children: [
          const MobileSectionTitle(
            title: "All Schools",
            subTitle: "Explore Ghana's finest Schools",
            color: Color(0xFFFFB100),
          ),
          const SizedBox(height: kDefaultPadding * 1.5),
          SizedBox(
            width: 1200.0,
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: kDefaultPadding,
              runSpacing: kDefaultPadding * 2,
              children: List.generate(
                allInstitutions.length,
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
          const SizedBox(height: kDefaultPadding * 3),
        ],
      ),
    );
  }
}
