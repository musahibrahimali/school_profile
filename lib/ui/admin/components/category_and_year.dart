import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class CategoryAndYearOfEstablishment extends StatefulWidget {
  const CategoryAndYearOfEstablishment({Key? key}) : super(key: key);

  @override
  State<CategoryAndYearOfEstablishment> createState() => _CategoryAndYearOfEstablishmentState();
}

class _CategoryAndYearOfEstablishmentState extends State<CategoryAndYearOfEstablishment> {
  // create a scaffold key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // late SingleValueDropDownController _cnt;

  // is keyboard open
  bool _isKeyboardOpen = false;

  @override
  void initState() {
    // _cnt = SingleValueDropDownController();
    super.initState();
  }

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
                      "School Category and Date of Establishment",
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
                            text: "Please provide your school category and date of establishment",
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
                    const SizedBox(height: 30.0),
                    // select category
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: DropDownTextField(
                        // singleController: _cnt,
                        clearOption: false,
                        enableSearch: false,
                        initialValue: "Select School Category",
                        textStyle: GoogleFonts.montserrat(
                          fontSize: 18.0,
                          color: BrandColors.white,
                        ),
                        textFieldDecoration: const InputDecoration(
                          hintText: "Select School Category",
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
                        dropDownItemCount: 4,
                        dropDownList: const [
                          DropDownValueModel(name: 'Private', value: "Private"),
                          DropDownValueModel(name: 'International', value: "International"),
                          DropDownValueModel(name: 'Public', value: "Public"),
                          DropDownValueModel(name: 'Hybrid', value: "Hybrid"),
                        ],
                        onChanged: (val) {
                          categoryController.text = val.value.toString();
                          debugPrint("Selected value: ${categoryController.text}");
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: DateTimePicker(
                        initialValue: '',
                        firstDate: DateTime(1800),
                        lastDate: DateTime(HelperFunctions.getYear() + 1),
                        dateLabelText: 'Established Date',
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffEEEEEE),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffEEEEEE),
                            ),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffEEEEEE),
                            ),
                          ),
                          labelText: "Date of Establishment",
                          labelStyle: GoogleFonts.montserrat(
                            fontSize: 18.0,
                            color: BrandColors.white,
                          ),
                        ),
                        style: GoogleFonts.montserrat(
                          fontSize: 18.0,
                          color: BrandColors.white,
                        ),
                        onChanged: (val) {
                          yearOfEstablishmentController.text = val;
                          debugPrint("year established ${yearOfEstablishmentController.text}");
                        },
                        validator: (val) {
                          debugPrint(val);
                          return null;
                        },
                        onSaved: (val) => debugPrint(val),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: DateTimePicker(
                              initialValue: '',
                              type: DateTimePickerType.time,
                              initialTime: const TimeOfDay(hour: 8, minute: 0),
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffEEEEEE),
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffEEEEEE),
                                  ),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffEEEEEE),
                                  ),
                                ),
                                labelText: "Opening Time",
                                labelStyle: GoogleFonts.montserrat(
                                  fontSize: 18.0,
                                  color: BrandColors.white,
                                ),
                              ),
                              style: GoogleFonts.montserrat(
                                fontSize: 18.0,
                                color: BrandColors.white,
                              ),
                              onChanged: (val) {
                                openingTimeController.text = val;
                                // debugPrint("opening time ${openingTimeController.text}");
                              },
                              validator: (val) {
                                debugPrint(val);
                                return null;
                              },
                              onSaved: (val) => debugPrint(val),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: DateTimePicker(
                              initialValue: '',
                              type: DateTimePickerType.time,
                              initialTime: const TimeOfDay(hour: 8, minute: 0),
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffEEEEEE),
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffEEEEEE),
                                  ),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffEEEEEE),
                                  ),
                                ),
                                labelText: "Closing Time",
                                labelStyle: GoogleFonts.montserrat(
                                  fontSize: 18.0,
                                  color: BrandColors.white,
                                ),
                              ),
                              style: GoogleFonts.montserrat(
                                fontSize: 18.0,
                                color: BrandColors.white,
                              ),
                              onChanged: (val) {
                                closingTimeController.text = val;
                              },
                              validator: (val) {
                                debugPrint(val);
                                return null;
                              },
                              onSaved: (val) => debugPrint(val),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30.0),

                    Obx(
                      () => ListTile(
                        leading: Checkbox(
                          value: schoolController.weOperateOnSaturdays,
                          side: BorderSide(color: BrandColors.white),
                          activeColor: BrandColors.colorGreen,
                          onChanged: (value) {
                            schoolController.updateWeOperateOnSaturdays(value!);
                          },
                        ),
                        title: Text(
                          "We operate on Saturdays",
                          style: GoogleFonts.montserrat(
                            fontSize: 18.0,
                            color: BrandColors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                  ],
                ),
              ),
            ),
          ),

          BrandBottomNav(
            index: 1,
            isButtonDisabled: (categoryController.text.length <= 3 || yearOfEstablishmentController.text.length <= 3) ? true : false,
            function: () async {
              if (categoryController.text.length <= 3 || yearOfEstablishmentController.text.length <= 3) {
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
              Navigator.push(context, MaterialPageRoute(builder: (_) => const EmailAndPhone()));
            },
          ),
        ],
      ),
    );
  }
}
