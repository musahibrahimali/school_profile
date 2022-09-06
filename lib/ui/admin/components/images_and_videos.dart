import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class ImagesAndVideos extends StatefulWidget {
  const ImagesAndVideos({Key? key}) : super(key: key);

  @override
  State<ImagesAndVideos> createState() => _ImagesAndVideosState();
}

class _ImagesAndVideosState extends State<ImagesAndVideos> {
  // create a scaffold key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // create a picker instance to pick images
  final ImagePicker _picker = ImagePicker();

  // is keyboard open
  bool _isKeyboardOpen = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    double contentHeight = screenHeight - keyboardHeight;

    // if keyboard is opened
    if (MediaQuery.of(context).viewInsets.bottom != 0) {
      setState(() {
        _isKeyboardOpen = true;
      });
    } else {
      setState(() {
        _isKeyboardOpen = false;
      });
    }

    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xffF06A66),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Stack(
        children: [
          // background container
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: BrandGradients.boarding,
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                height: contentHeight,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.02),
                    Text(
                      "Images of of the school",
                      style: TextStyle(
                        fontSize: height * 0.03,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text.rich(
                      const TextSpan(
                        children: [
                          TextSpan(
                            text: "Please provide good images of your school",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      style: TextStyle(
                        fontSize: 2.h,
                        color: BrandColors.white,
                      ),
                    ),
                    SizedBox(height: _isKeyboardOpen ? 8.0.h : 18.h),
                    // add a button to select images
                    InkWell(
                      onTap: () async {
                        List<XFile>? files = await _picker.pickMultiImage();
                        if (files != [] || files != null) {
                          schoolController.addAllImages(files);
                          setState(() {});
                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              LineAwesomeIcons.image,
                              size: 50.0,
                              color: BrandColors.kGrey,
                            ),
                            const SizedBox(width: 10.0),
                            const Text(
                              "Select Images",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                            itemCount: schoolController.imageFiles?.length ?? 0,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                            itemBuilder: (BuildContext context, int index) {
                              // allow the user to delete the image
                              return InkWell(
                                onTap: () {
                                  schoolController.removeImage(index);
                                  setState(() {});
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      image: FileImage(File(schoolController.imageFiles![index].path)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      LineAwesomeIcons.trash,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),

                    SizedBox(height: 4.h),
                  ],
                ),
              ),
            ),
          ),

          BrandBottomNav(
            index: 12,
            buttonText: "Proceed",
            isButtonDisabled: schoolController.extraCurricularController.text.length <= 1 ? true : false,
            function: () async {
              if (schoolController.extraCurricularController.text.length <= 3) {
                showCustomFlushBar(
                  context: context,
                  title: 'Error',
                  borderRadius: BorderRadius.circular(50.0),
                  margin: EdgeInsets.symmetric(
                    horizontal: 10.0.w,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 1.0.w,
                    vertical: 4.0.h,
                  ),
                  titleColor: themeController.isLightTheme ? BrandColors.colorDarkTheme : BrandColors.colorWhiteAccent,
                  message: 'Please fill out all the fields',
                  messageColor: themeController.isLightTheme ? BrandColors.colorDarkTheme : BrandColors.colorWhiteAccent,
                  icon: LineAwesomeIcons.exclamation_circle,
                  iconColor: themeController.isLightTheme ? BrandColors.colorDarkTheme : BrandColors.colorWhiteAccent,
                  backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                );
                return;
              }
              schoolController.updateSchoolModelToDatabase();
              schoolController.schoolModelToDatabase.userId = userController.currentUserInfo.uid;
              schoolController.schoolModelToDatabase.likes = [];
              schoolController.schoolModelToDatabase.reviews = [];
              schoolController.schoolModelToDatabase.videos = [];
              List<dynamic>? imagesList;
              showLoading(context);
              if (schoolController.imageFiles != null || schoolController.imageFiles!.isNotEmpty) {
                imagesList = await HelperMethods.uploadFiles(files: schoolController.imageFiles!);
                // debugPrint("image list: $imagesList");
                schoolController.updateSchoolModelImages(imagesList);
              }
              if (schoolController.avatarImage != null) {
                String? avatarUrl = await HelperMethods.uploadFile(file: schoolController.avatarImage!);
                schoolController.updateSchoolModelAvatarImage(avatarUrl);
              }
              // create a new school
              bool response = await HelperMethods.addNewSchool(schoolModel: schoolController.schoolModelToDatabase);
              // debugPrint("response: $response");
              if (response) {
                Navigator.pop(context);
                HelperMethods.getAllSchools();
                if (mounted) {}
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const AdminSchoolsScreen()),
                  (route) => false,
                );
              } else {
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
                    vertical: 4.0.h,
                  ),
                  titleColor: themeController.isLightTheme ? BrandColors.colorDarkTheme : BrandColors.colorWhiteAccent,
                  message: 'There was an error creating the school',
                  messageColor: themeController.isLightTheme ? BrandColors.colorDarkTheme : BrandColors.colorWhiteAccent,
                  icon: LineAwesomeIcons.exclamation_circle,
                  iconColor: themeController.isLightTheme ? BrandColors.colorDarkTheme : BrandColors.colorWhiteAccent,
                  backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
