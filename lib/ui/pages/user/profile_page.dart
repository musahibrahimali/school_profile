import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_profile/index.dart';

class UserProfilePage extends StatefulWidget {
  static const String id = "user_profile_page";
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  List<SchoolModel> schoolModels = [];
  final ImagePicker _imagePicker = ImagePicker();

  void findUserSchools() {
    // loop trough the schools and find
    // loop through the list of schools and check if the user has liked the school
    if (userController.isUserLoggedIn) {
      schoolModels.clear();
      for (SchoolModel schoolModel in schoolController.allSchools) {
        // debugPrint("school likes ${schoolModel.likes}");
        for (var like in schoolModel.likes!) {
          debugPrint("like $like");
          if (like['user_id'] == userController.currentUserInfo.uid!) {
            setState(() {
              schoolModels.add(schoolModel);
            });
          }
        }
      }
    } else {
      setState(() {
        schoolModels = [];
      });
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      findUserSchools();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: Obx(() {
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async {
                        _imagePicker.pickImage(source: ImageSource.gallery).then((image) {
                          if (image != null) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialog(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          width: 80.0.w,
                                          height: 80.0.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: FileImage(File(image.path)),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20.0),
                                      CustomButton(
                                        onPressed: () async {
                                          showLoading(context);
                                          String response = await HelperMethods.uploadFile(file: File(image.path));
                                          if (response.isNotEmpty) {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                            // update the user profile image
                                            UserModel userModel = userController.currentUserInfo.copyWith(
                                              profile: response,
                                            );
                                            await userRepo.updateUser(userModel);
                                            HelperMethods.getUserInfo();
                                          } else {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                            showCustomFlushBar(
                                              context: context,
                                              title: 'Error',
                                              borderRadius: BorderRadius.circular(50.0),
                                              margin: EdgeInsets.symmetric(
                                                horizontal: 10.0.w,
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 1.0.w,
                                                vertical: 1.0.h,
                                              ),
                                              titleColor: themeController.isLightTheme ? BrandColors.colorPink : BrandColors.colorWhiteAccent,
                                              message: 'There was an Error updating your profile image',
                                              messageColor: themeController.isLightTheme ? BrandColors.colorPink : BrandColors.colorWhiteAccent,
                                              icon: LineAwesomeIcons.exclamation_circle,
                                              iconColor: themeController.isLightTheme ? BrandColors.kErrorColor : BrandColors.colorWhiteAccent,
                                              backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                            );
                                          }
                                        },
                                        buttonColor: themeController.isLightTheme ? BrandColors.colorPink : BrandColors.kBigPink,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "Upload",
                                              style: GoogleFonts.montserrat(
                                                color: themeController.isLightTheme ? Colors.white : Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                width: 80.0,
                                height: 80.0,
                                imageUrl: userController.currentUserInfo.profile!,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(Assets.iconsProfileIcon),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, dynamic) {
                                  return Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(Assets.iconsProfileIcon),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              right: 0.0,
                              child: Icon(
                                LineAwesomeIcons.edit,
                                color: themeController.isLightTheme ? Colors.white : Colors.white,
                                size: 28.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomText(
                      text: userController.currentUserInfo.name ?? "User Name",
                      color: themeController.isLightTheme ? BrandColors.colorDarkTheme : BrandColors.colorWhiteAccent,
                      fontWeight: FontWeight.w700,
                      fontSize: 22.0,
                      maxLines: 2,
                      verticalMargin: 0.0,
                    ),
                    const SizedBox(height: 5.0),
                    CustomText(
                      text: userController.currentUserInfo.email ?? "johndoe@email.com",
                      color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
              if (schoolModels.isNotEmpty)
                Expanded(
                  flex: 6,
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
                            title: "Your Favorite Schools",
                            subTitle: "Schools in your favorite list",
                            titleColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                            subTitleColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                            color: const Color(0xff6078ff),
                          ),
                          const SizedBox(height: kDefaultPadding * 1.0),
                          Container(
                            width: double.infinity,
                            color: Colors.transparent,
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
                          const SizedBox(height: 20.0),
                          ProfileListItem(
                            onPressed: () async {
                              authRepo.signOut();
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                HomeScreen.id,
                                (route) => false,
                              );
                            },
                            icon: LineAwesomeIcons.alternate_sign_out,
                            bgColor: themeController.isLightTheme ? BrandColors.white : BrandColors.black,
                            iconColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                            textColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                            text: 'Logout',
                            hasNavigation: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
