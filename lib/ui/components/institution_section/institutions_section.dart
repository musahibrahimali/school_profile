import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class MobileInstitutionSection extends StatelessWidget {
  const MobileInstitutionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // get the first three schools if they exist
    List<SchoolModel> firstThreeSchools = schoolController.schools.length > 3 ? schoolController.schools.sublist(0, 3) : schoolController.schools;

    return Container(
      // margin: const EdgeInsets.only(top: kDefaultPadding * 4),
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
          // Transform.translate(
          //   offset: const Offset(0, -70),
          //   child: const MobileGetInTouchCard(),
          // ),
          Container(
            color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      pageController.animateToPage(
                        1,
                        duration: const Duration(seconds: 1),
                        curve: Curves.linear,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        // controller: _pickupController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.start,
                        enabled: false,
                        onChanged: (value) async {
                          // setState(() {
                          //   _destinationPredictionList = [];
                          // });
                          // List<Prediction>? thisList = await HelperFunctions.searchPickUpPoint(value);
                          // if (thisList!.isNotEmpty) {
                          //   setState(() {
                          //     _pickUpPointPredictionList = thisList;
                          //   });
                          // }
                        },
                        keyboardAppearance: themeController.isLightTheme ? Brightness.light : Brightness.dark,
                        decoration: InputDecoration(
                          hintText: "Search for schools",
                          hintStyle: GoogleFonts.montserrat(
                            color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                          ),
                          filled: false,
                          contentPadding: const EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: themeController.isLightTheme ? BrandColors.colorLightGray : BrandColors.colorWhiteAccent,
                              style: BorderStyle.solid,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: themeController.isLightTheme ? BrandColors.colorLightGray : BrandColors.colorWhiteAccent,
                              style: BorderStyle.solid,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: themeController.isLightTheme ? BrandColors.colorLightGray : BrandColors.colorWhiteAccent,
                              style: BorderStyle.solid,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: themeController.isLightTheme ? BrandColors.colorLightGray : BrandColors.colorWhiteAccent,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    pageController.animateToPage(
                      1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.linear,
                    );
                  },
                  icon: Icon(
                    LineAwesomeIcons.search,
                    color: themeController.isLightTheme ? BrandColors.colorDarkTheme : BrandColors.colorBackground,
                    size: 28.0,
                  ),
                ),
              ],
            ),
          ),

          Obx(
            () => MobileSectionTitle(
              title: "Popular Schools",
              subTitle: "Most visitors to our website in your area has wards in either of these Schools",
              color: const Color(0xFFFFB100),
              titleColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.white,
              subTitleColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.white,
            ),
          ),
          const SizedBox(height: kDefaultPadding * 1.5),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: kDefaultPadding,
              runSpacing: kDefaultPadding * 1,
              children: List.generate(
                firstThreeSchools.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: MobileInstitutionCard(
                    schoolModel: firstThreeSchools[index],
                    press: () {
                      SchoolModel schoolModel = firstThreeSchools[index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => AdminSchoolProfileScreen(schoolModel: schoolModel),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding * 2),
        ],
      ),
    );
  }
}
