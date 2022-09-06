import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class RegionAndDistrict extends StatefulWidget {
  const RegionAndDistrict({Key? key}) : super(key: key);

  @override
  State<RegionAndDistrict> createState() => _RegionAndDistrictState();
}

class _RegionAndDistrictState extends State<RegionAndDistrict> {
  // create a scaffold key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                    SizedBox(height: height * 0.06),
                    Text(
                      "School Region & District",
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
                            text: "Please provide your school region and district",
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
                    // select region
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: SafeArea(
                        child: DropDownTextField(
                          clearOption: false,
                          enableSearch: true,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0,
                          ),
                          initialValue: "Select Region",
                          textStyle: GoogleFonts.montserrat(
                            fontSize: 18.0,
                            color: BrandColors.white,
                          ),
                          textFieldDecoration: const InputDecoration(
                            hintText: "Select Region",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffEEEEEE),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffEEEEEE),
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffEEEEEE),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 16,
                          dropDownList: const [
                            DropDownValueModel(name: 'Ashanti Region', value: "Ashanti Region"),
                            DropDownValueModel(name: 'Savanna Region', value: "Savanna Region"),
                            DropDownValueModel(name: 'Northern Region', value: "Northern Region"),
                            DropDownValueModel(name: 'Upper West Region', value: "Upper West Region"),
                            DropDownValueModel(name: 'Upper East Region', value: "Upper East Region"),
                            DropDownValueModel(name: 'Bono East Region', value: "Bono East Region"),
                            DropDownValueModel(name: 'Bono Region', value: "Bono Region"),
                            DropDownValueModel(name: 'Ahafo Region', value: "Ahafo Region"),
                            DropDownValueModel(name: 'North East Region', value: "North East Region"),
                            DropDownValueModel(name: 'Oti Region', value: "Oti Region"),
                            DropDownValueModel(name: 'Volta Region', value: "Volta Region"),
                            DropDownValueModel(name: 'Western Region', value: "Western Region"),
                            DropDownValueModel(name: 'Eastern Region', value: "Eastern Region"),
                            DropDownValueModel(name: 'Central Region', value: "Central Region"),
                            DropDownValueModel(name: 'Western North Region', value: "Western North Region"),
                            DropDownValueModel(name: 'Greater Accra Region', value: "Greater Accra Region"),
                          ],
                          onChanged: (val) {
                            schoolController.regionController.text = val.value.toString();
                            debugPrint("Selected value: ${schoolController.regionController.text}");
                            FocusScope.of(context).unfocus();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: BrandTextBox(
                        onChanged: (val) {
                          setState(() {});
                        },
                        label: "District (Optional)",
                        controller: schoolController.districtController,
                        keyboardType: TextInputType.text,
                        error: false,
                        errorMessage: "Invalid input",
                      ),
                    ),
                    SizedBox(height: 4.h),
                  ],
                ),
              ),
            ),
          ),

          BrandBottomNav(
            index: 4,
            isButtonDisabled: schoolController.regionController.text.length <= 3 ? true : false,
            function: () async {
              if (schoolController.regionController.text.length <= 3) {
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
              Navigator.push(context, MaterialPageRoute(builder: (_) => const HeadTeacherAndStudentPopulation()));
            },
          ),
        ],
      ),
    );
  }
}
