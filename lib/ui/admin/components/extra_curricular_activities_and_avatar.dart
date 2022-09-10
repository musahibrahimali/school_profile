import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class ExtraCurricularAndAvatar extends StatefulWidget {
  const ExtraCurricularAndAvatar({Key? key}) : super(key: key);

  @override
  State<ExtraCurricularAndAvatar> createState() => _ExtraCurricularAndAvatarState();
}

class _ExtraCurricularAndAvatarState extends State<ExtraCurricularAndAvatar> {
  // create a scaffold key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // is keyboard open
  bool _isKeyboardOpen = false;
  final ImagePicker _picker = ImagePicker();

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
                      "School Extra Curricular Activities and Avatar (Logo)",
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
                            text: "Please provide information about any extra curricular activities that the school offers. ",
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
                        maxLines: 5,
                        label: "Extra curricular activities",
                        controller: extraCurricularController,
                        keyboardType: TextInputType.multiline,
                        error: false,
                        errorMessage: "Invalid input",
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    // container to select image
                    Center(
                      child: InkWell(
                        onTap: () async {
                          XFile? file = await _picker.pickImage(source: ImageSource.gallery);
                          if (file != null) {
                            schoolController.updateAvatar(file);
                            setState(() {});
                          }
                        },
                        child: Container(
                          height: 200.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                            // make the shape a circle
                            shape: BoxShape.rectangle,
                            color: schoolController.avatarImage == null ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(50.0),
                            image: schoolController.avatarImage == null
                                ? null
                                : DecorationImage(
                                    image: FileImage(schoolController.avatarImage!),
                                    fit: BoxFit.cover,
                                  ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10.0,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: schoolController.avatarImage == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(
                                      LineAwesomeIcons.image,
                                      size: 50.0,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      "Select Image",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                )
                              : IconButton(
                                  onPressed: () {
                                    schoolController.clearAvatar();
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    LineAwesomeIcons.trash,
                                    color: BrandColors.colorWhiteAccent,
                                    size: 45.0,
                                  ),
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
            index: 11,
            isButtonDisabled: extraCurricularController.text.length <= 3 ? true : false,
            function: () async {
              if (extraCurricularController.text.length <= 3) {
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
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ImagesAndVideos()));
            },
          ),
        ],
      ),
    );
  }
}
