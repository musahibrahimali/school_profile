import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_profile/index.dart';

class MobileReviewSection extends StatelessWidget {
  final SchoolModel? schoolModel;
  const MobileReviewSection({
    Key? key,
    this.schoolModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(Assets.imagesBgImg2),
          ),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: kDefaultPadding * 2.5),
            MobileSectionTitle(
              title: "Leave a review",
              subTitle: "Let your voice be heard",
              color: const Color(0xFF07E24A),
              titleColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
              subTitleColor: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
            ),
            MobileReviewBox(schoolModel: schoolModel),
            const SizedBox(height: kDefaultPadding * 2.5),
          ],
        ),
      ),
    );
  }
}

class MobileReviewBox extends StatelessWidget {
  final SchoolModel? schoolModel;
  const MobileReviewBox({
    Key? key,
    this.schoolModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.only(top: kDefaultPadding * 2),
        padding: const EdgeInsets.all(kDefaultPadding * 1),
        decoration: BoxDecoration(
          color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: kDefaultPadding * 2),
            MobileReviewForm(schoolModel: schoolModel),
            const SizedBox(height: kDefaultPadding * 2),
          ],
        ),
      ),
    );
  }
}

class MobileReviewForm extends StatelessWidget {
  final SchoolModel? schoolModel;
  const MobileReviewForm({
    Key? key,
    this.schoolModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          SizedBox(
            child: TextFormField(
              controller: reviewContentController,
              minLines: 10,
              maxLines: 500,
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Leave a review",
                labelStyle: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  color: Colors.blue[200],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.blue[200]!,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.blue[200]!,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: BrandColors.kErrorColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.blue[200]!,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding * 1),
          Center(
            child: FittedBox(
              child: DefaultButton(
                imageSrc: Assets.imagesContactIcon,
                text: "Save",
                press: () async {
                  if (userController.currentUserInfo.isAdmin == true) {
                    // show dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(
                          title: "Info",
                          description: "An admin can't leave a review on a school",
                          buttonText: "Proceed",
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, AuthPage.id);
                          },
                        );
                      },
                    );
                    return;
                  }
                  if (userController.isUserLoggedIn) {
                    showLoading(context);
                    reviewDateController.text = DateTime.now().toString();
                    reviewSchoolController.text = schoolModel!.id!;
                    reviewUserIdController.text = userController.currentUserInfo.uid!;
                    schoolController.updateReviewModelToDatabase();
                    var response = await HelperMethods.addNewReview(reviewModel: schoolController.reviewModelForDatabase);
                    if (response) {
                      Navigator.pop(context);
                      HelperMethods.getAllReviews();
                      showCustomFlushBar(
                        context: context,
                        title: 'Success',
                        borderRadius: BorderRadius.circular(50.0),
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.0.w,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 1.0.w,
                          vertical: 1.0.h,
                        ),
                        titleColor: themeController.isLightTheme ? BrandColors.colorPink : BrandColors.colorWhiteAccent,
                        message: 'Review saved',
                        messageColor: themeController.isLightTheme ? BrandColors.colorPink : BrandColors.colorWhiteAccent,
                        icon: LineAwesomeIcons.check_circle,
                        iconColor: themeController.isLightTheme ? BrandColors.kErrorColor : BrandColors.colorWhiteAccent,
                        backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
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
                          vertical: 1.0.h,
                        ),
                        titleColor: themeController.isLightTheme ? BrandColors.colorPink : BrandColors.colorWhiteAccent,
                        message: 'There was an error saving your review',
                        messageColor: themeController.isLightTheme ? BrandColors.colorPink : BrandColors.colorWhiteAccent,
                        icon: LineAwesomeIcons.exclamation_circle,
                        iconColor: themeController.isLightTheme ? BrandColors.kErrorColor : BrandColors.colorWhiteAccent,
                        backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                      );
                    }
                  } else {
                    // show dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(
                          title: "Info",
                          description: "Please login to leave a review",
                          buttonText: "Proceed",
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, AuthPage.id);
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
