import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';
import 'package:school_profile/ui/admin/components/awards_and_achievement.dart';

class HistoryAndAbout extends StatefulWidget {
  const HistoryAndAbout({Key? key}) : super(key: key);

  @override
  State<HistoryAndAbout> createState() => _HistoryAndAboutState();
}

class _HistoryAndAboutState extends State<HistoryAndAbout> {
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
                      "History of the School",
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
                            text: "Please provide a description or history of the school",
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
                        maxLines: 12,
                        label: "History/about",
                        controller: historyController,
                        keyboardType: TextInputType.multiline,
                        error: false,
                        errorMessage: "Invalid input",
                      ),
                    ),
                    const SizedBox(height: 30.0),
                  ],
                ),
              ),
            ),
          ),

          BrandBottomNav(
            index: 7,
            isButtonDisabled: (historyController.text.length <= 150) ? true : false,
            function: () async {
              if (historyController.text.length <= 150) {
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
                  message: 'History must be at least 150 characters',
                  messageColor: themeController.isLightTheme ? BrandColors.colorPink : BrandColors.colorWhiteAccent,
                  icon: LineAwesomeIcons.exclamation_circle,
                  iconColor: themeController.isLightTheme ? BrandColors.kErrorColor : BrandColors.colorWhiteAccent,
                  backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                );
                return;
              }
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AwardsAndAchievements()));
            },
          ),
        ],
      ),
    );
  }
}
