import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_profile/index.dart';

class CreditsPage extends StatefulWidget {
  static const String id = 'credits_page';
  const CreditsPage({Key? key}) : super(key: key);

  @override
  State<CreditsPage> createState() => _CreditsPageState();
}

class _CreditsPageState extends State<CreditsPage> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: themeController.isLightTheme ? Colors.white : BrandColors.colorDarkTheme,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //Back Button & Heading
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: themeController.isLightTheme ? BrandColors.colorDarkTheme : BrandColors.colorWhiteAccent,
                                width: 1.8,
                              ),
                            ),
                            padding: const EdgeInsets.all(6),
                            child: Icon(
                              LineAwesomeIcons.angle_left,
                              color: themeController.isLightTheme ? Colors.black : Colors.white,
                              size: 18.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width > 360 ? 80 : 60),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: AutoSizeText(
                          "Credits",
                          style: GoogleFonts.montserrat(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w900,
                            color: themeController.isLightTheme ? Colors.black : Colors.white,
                          ),
                          maxFontSize: 21,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: themeController.isLightTheme ? Colors.black.withOpacity(0.2) : Colors.transparent,
                            spreadRadius: 2,
                            blurRadius: 17,
                            offset: const Offset(0, 12), // changes position of shadow
                          ),
                        ],
                      ),
                      child: CustomText(
                        text: "The School Profiler",
                        fontSize: 2.5.h,
                        textAlign: TextAlign.center,
                        color: themeController.isLightTheme ? BrandColors.colorText : Colors.white,
                        fontWeight: FontWeight.w900,
                        maxLines: 3,
                      ),
                    ),

                    const SizedBox(height: 30),

                    //Version number
                    AutoSizeText(
                      "Version 1.2.0",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                        color: themeController.isLightTheme ? const Color(0xff009a88) : BrandColors.colorWhiteAccent,
                      ),
                      maxFontSize: 18,
                      maxLines: 1,
                    ),

                    const SizedBox(height: 10),

                    //License Button
                    MaterialButton(
                      elevation: 10,
                      onPressed: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff009a88),
                          border: Border.all(color: const Color(0xff009a88), width: 2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                        child: AutoSizeText(
                          "License",
                          style: GoogleFonts.montserrat(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: themeController.isLightTheme ? Colors.white : Colors.white,
                          ),
                          maxFontSize: 18.0,
                          maxLines: 1,
                        ),
                      ),
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(15),
                  child: AutoSizeText(
                    "The School Profiler is an app made with the Flutter framework to profile schools. It shows various information and details about schools in Ghana. As it is an open-source app feel free to contribute and star on GitHub. More features are underway.",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      letterSpacing: 0.4,
                      height: 1.6,
                      fontWeight: FontWeight.normal,
                      color: themeController.isLightTheme ? const Color(0xff008e7b) : BrandColors.colorWhiteAccent,
                    ),
                    maxFontSize: 16,
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 2.0.h),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CustomText(
                        text: "Project Supervisor",
                        fontSize: 2.5.h,
                        fontWeight: FontWeight.w900,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: BrandDivider(height: 2.0),
                      ),
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 25.0,
                          backgroundImage: AssetImage(Assets.supervisorSupervisor),
                        ),
                        title: CustomText(
                          text: "Dr. Daniel Opoku ",
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          color: themeController.isLightTheme ? BrandColors.colorText : Colors.white,
                        ),
                        subtitle: CustomText(
                          text: "Lecturer, College Engineering, KNUST",
                          fontSize: 12.0,
                          maxLines: 3,
                          fontWeight: FontWeight.w600,
                          color: themeController.isLightTheme ? BrandColors.colorText : Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          // construct url to call the phone number
                          String url = "tel:+233553604143";
                          HelperFunctions.iLaunchUrl(url);
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25.0,
                            backgroundColor: themeController.isLightTheme ? BrandColors.colorPrimary : BrandColors.colorPrimaryDark,
                            child: Center(
                              child: Icon(
                                LineAwesomeIcons.phone,
                                color: themeController.isLightTheme ? BrandColors.white : BrandColors.white,
                              ),
                            ),
                          ),
                          title: CustomText(
                            text: "Contact",
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                            color: themeController.isLightTheme ? BrandColors.colorText : Colors.white,
                          ),
                          subtitle: CustomText(
                            text: "+233553604143",
                            fontSize: 16.0,
                            maxLines: 3,
                            fontWeight: FontWeight.w600,
                            color: themeController.isLightTheme ? BrandColors.colorText : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 4.0.h),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CustomText(
                        text: "Group Members",
                        fontSize: 2.5.h,
                        fontWeight: FontWeight.w900,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: BrandDivider(height: 2.0),
                      ),
                      const AboutMemberCard(
                        name: "Musah Ibrahim Ali",
                        about:
                            "Musah Baba Ali Ibrahim is a final year student reading Bachelor of Science in Electrical and Electronic Engineering. He has undertaken industrial training at Contracta Construction Ltd where he gained skills in electrical services and implementation. He is currently taking advanced courses in project management and website development to better serve him in his career as an entrepreneur. He also gained practical experience in Microsoft word, excel and power points during his time as a virtual intern during the Covid pandemic lockdown. He is an open-minded individual who is ever ready to learn. He is intensely motivated with the drive to better himself continually.",
                        color: Color(0xFFD9FFFC),
                        image: Assets.groupMusah,
                      ),
                      const SizedBox(height: 20),
                      const AboutMemberCard(
                        name: "Toobu Daniel Nabie",
                        about:
                            "Toobu Daniel Nabie is a final year student at the Kwame Nkrumah University of Science and Technology offering Electrical/Electronic Engineering. I had the pleasure to work hand in hand with a cryptocurrency company called CG for four months. My four months experience helped me to understand the trade and also opened my senses to take calculated risk.",
                        color: Color(0xFFFFF3DD),
                        image: Assets.groupNabbie,
                      ),
                      const SizedBox(height: 20),
                      const AboutMemberCard(
                        name: "Owusu Sylvester",
                        about:
                            "Owusu Sylvester is a Final Year Electrical and Electronics Engineering at the Kwame Nkrumah University of Science and Technology. He is very much interested in Python Programming and Automation of repetitive tasks. He is a tech enthusiast, built and managed a couple of websites and hence very suited for managing all the online and website affairs of the business.",
                        color: Color(0xFFFFE0E0),
                        image: Assets.groupSly,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 5.0.h),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () async {
                      HelperFunctions.iLaunchUrl(AppConstants.appGithubUrl);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: themeController.isLightTheme ? Colors.black : Colors.white,
                          width: 1.4,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(width: 5),
                          AutoSizeText(
                            "Made with ",
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: themeController.isLightTheme ? Colors.black : Colors.white,
                            ),
                            maxFontSize: 15,
                            maxLines: 1,
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 18,
                          ),
                          AutoSizeText(
                            " by ",
                            style: GoogleFonts.montserrat(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: themeController.isLightTheme ? Colors.black : Colors.white,
                            ),
                            maxFontSize: 15.0,
                            maxLines: 1,
                          ),
                          AutoSizeText(
                            "Musah, Sylvester & Nabie",
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: themeController.isLightTheme ? Colors.black : Colors.white,
                            ),
                            maxFontSize: 15,
                            maxLines: 1,
                          ),
                          const SizedBox(width: 5),
                          Image(
                            height: 18.0,
                            width: 18.0,
                            color: themeController.isLightTheme ? Colors.black : Colors.white,
                            image: const AssetImage(Assets.iconsGithub),
                          ),
                          const SizedBox(width: 5),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
