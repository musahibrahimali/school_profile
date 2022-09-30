import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:school_profile/index.dart';

class NameAndSlogan extends StatefulWidget {
  const NameAndSlogan({Key? key}) : super(key: key);

  @override
  State<NameAndSlogan> createState() => _NameAndSloganState();
}

class _NameAndSloganState extends State<NameAndSlogan> {
  // create a scaffold key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // is keyboard open
  bool _isKeyboardOpen = false;
  static final List<SchoolLevel> _schoolLevels = <SchoolLevel>[
    SchoolLevel(id: 'Day Care', name: "Day Care"),
    SchoolLevel(id: 'Pre School', name: "Pre School"),
    SchoolLevel(id: 'Creche/Kindergarten', name: "Creche/Kindergarten"),
    SchoolLevel(id: 'Primary', name: "Primary"),
    SchoolLevel(id: 'Junior High School', name: "Junior High School"),
  ];

  final _items = _schoolLevels.map((item) => MultiSelectItem<SchoolLevel>(item, item.name)).toList();
  List<dynamic> _selectedLevels = [];

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
                      "School Name & Moto",
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
                            text: "Please provide your school name and motto",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: BrandTextBox(
                        onChanged: (val) {
                          setState(() {});
                        },
                        label: "School Name",
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        error: false,
                        errorMessage: "Invalid input",
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: BrandTextBox(
                        onChanged: (val) {
                          setState(() {});
                        },
                        label: "Motto", //
                        controller: sloganController,
                        keyboardType: TextInputType.text,
                        error: false,
                        errorMessage: "Invalid input",
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: const Color(0xffEEEEEE),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          MultiSelectBottomSheetField(
                            initialChildSize: 0.4,
                            listType: MultiSelectListType.CHIP,
                            backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                            searchable: true,
                            buttonText: Text(
                              "School Levels",
                              style: GoogleFonts.montserrat(
                                color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                              ),
                            ),
                            buttonIcon: Icon(
                              Icons.arrow_drop_down,
                              color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                            ),
                            title: Text(
                              "School Levels",
                              style: GoogleFonts.montserrat(),
                            ),
                            selectedColor: BrandColors.colorDarkGreen,
                            selectedItemsTextStyle: GoogleFonts.montserrat(
                              color: BrandColors.colorWhiteAccent,
                            ),
                            unselectedColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                            separateSelectedItems: true,
                            onSelectionChanged: (values) {
                              setState(() {
                                _selectedLevels = values;
                              });
                            },
                            items: _items,
                            onConfirm: (values) {
                              setState(() {
                                _selectedLevels = values;
                              });
                            },
                            chipDisplay: MultiSelectChipDisplay(
                              onTap: (value) {
                                setState(() {
                                  _selectedLevels.remove(value);
                                });
                              },
                            ),
                          ),
                          _selectedLevels.isEmpty
                              ? Container(
                                  padding: const EdgeInsets.all(10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "None selected",
                                    style: GoogleFonts.montserrat(
                                      color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorWhiteAccent,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.h),
                  ],
                ),
              ),
            ),
          ),

          BrandBottomNav(
            index: 0,
            isButtonDisabled: (nameController.text.length <= 5 || sloganController.text.length <= 5 || _selectedLevels.isEmpty) ? true : false,
            function: () async {
              if (nameController.text.length <= 5 || sloganController.text.length <= 5 || _selectedLevels.isEmpty) {
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
                  titleColor: themeController.isLightTheme ? BrandColors.colorPink : BrandColors.colorWhiteAccent,
                  message: 'Please fill out all the fields',
                  messageColor: themeController.isLightTheme ? BrandColors.colorPink : BrandColors.colorWhiteAccent,
                  icon: LineAwesomeIcons.exclamation_circle,
                  iconColor: themeController.isLightTheme ? BrandColors.kErrorColor : BrandColors.colorWhiteAccent,
                  backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                );
                return;
              }
              // if user is logged in and not an admin
              if (userController.isUserLoggedIn && userController.currentUserInfo.isAdmin == false) {
                // show dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog(
                      title: "Info",
                      description: "You are not an admin",
                      buttonText: "Login",
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, AdminAuthScreen.id);
                      },
                    );
                  },
                );
              }
              // if user is not logged in
              if (userController.isUserLoggedIn == false) {
                // show dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog(
                      title: "Info",
                      description: "You are not an admin",
                      buttonText: "Login",
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, AdminAuthScreen.id);
                      },
                    );
                  },
                );
              }

              if (userController.isUserLoggedIn && userController.currentUserInfo.isAdmin == true) {
                schoolController.updateSchoolLevels(_selectedLevels.map((e) => e.name).toList());
                Navigator.push(context, MaterialPageRoute(builder: (_) => const CategoryAndYearOfEstablishment()));
              } else {
                return;
              }
            },
          ),
        ],
      ),
    );
  }
}
