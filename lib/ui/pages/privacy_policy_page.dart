import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:school_profile/index.dart';

class PrivacyPolicyPage extends StatefulWidget {
  static const String id = 'privacy_policy_page';
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  // scaffold key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: _scaffoldKey,
        backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  margin: const EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.0,
                        spreadRadius: 0.5,
                        offset: Offset(
                          0.7,
                          0.7,
                        ),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Icon(
                                LineAwesomeIcons.angle_left,
                                color: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Customer care'.toUpperCase(),
                              maxLines: 30,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                fontSize: 20.0,
                                color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 13,
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20.0),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal: 20.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0,
                                      spreadRadius: 0.5,
                                      offset: Offset(
                                        0.7,
                                        0.7,
                                      ),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    /// title and under line
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5.0,
                                            spreadRadius: 0.5,
                                            offset: Offset(
                                              0.7,
                                              0.7,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          /// title
                                          AutoSizeText(
                                            "Privacy Policy".toUpperCase(),
                                            textAlign: TextAlign.center,
                                            maxLines: 30,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                              color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          const SizedBox(height: 5.0),

                                          /// underline
                                          Container(
                                            height: 3.0,
                                            width: 60.0,
                                            color: themeController.isLightTheme ? BrandColors.colorPrimary : BrandColors.colorWhiteAccent,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),

                                    /// privacy intro
                                    Text(
                                      "Last updated: August 5, 2022 This Privacy Policy describes Our policies "
                                      "and procedures on the collection, use and disclosure of Your information "
                                      "when You use the Service and tells You about Your privacy rights and how "
                                      "the law protects You. We use Your Personal data to provide and improve "
                                      "the Service. By using the Service, You agree to the collection and use "
                                      "of information in accordance with this Privacy Policy. This Privacy "
                                      "Policy has been created with the help of the Privacy Policy Generator",
                                      textAlign: TextAlign.justify,
                                      maxLines: 30,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: themeController.isLightTheme ? BrandColors.colorTextDark : BrandColors.colorWhiteAccent,
                                        fontSize: 18.0,
                                      ),
                                    ),

                                    const SizedBox(height: 20.0),

                                    /// interpretation and definitions
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5.0,
                                            spreadRadius: 0.5,
                                            offset: Offset(
                                              0.7,
                                              0.7,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          /// title
                                          AutoSizeText(
                                            "Interpretation and Definitions".toUpperCase(),
                                            textAlign: TextAlign.center,
                                            maxLines: 30,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                              color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          const SizedBox(height: 5.0),

                                          /// underline
                                          Container(
                                            height: 3.0,
                                            width: 60.0,
                                            color: themeController.isLightTheme ? BrandColors.colorPrimary : BrandColors.colorWhiteAccent,
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(height: 20.0),

                                    /// disclaimer
                                    Text(
                                      "The words of which the initial letter is capitalized have meanings defined "
                                      "under the following conditions. The following definitions shall have the "
                                      "same meaning regardless of whether they appear in singular or in plural.",
                                      textAlign: TextAlign.justify,
                                      maxLines: 30,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: themeController.isLightTheme ? BrandColors.colorTextDark : BrandColors.colorWhiteAccent,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),

                                    const SizedBox(height: 20.0),

                                    /// definitions
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5.0,
                                            spreadRadius: 0.5,
                                            offset: Offset(
                                              0.7,
                                              0.7,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          AutoSizeText(
                                            "For the purposes of this Privacy Policy: ",
                                            maxLines: 30,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                              color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),

                                          /// definition terms
                                          /// account
                                          const DefinitionTerm(
                                            title: "Account",
                                            text: "means a unique account created for You to access our Service or "
                                                "parts of our Service.",
                                          ),
                                          const SizedBox(height: 10.0),

                                          /// application
                                          const DefinitionTerm(
                                            title: "Application",
                                            text: "means the software program provided by the Company downloaded by "
                                                "You on any electronic device, named roam",
                                          ),

                                          const SizedBox(height: 10.0),

                                          /// company
                                          const DefinitionTerm(
                                            title: "Company",
                                            text: "(referred to as either 'the Company', 'We', 'Us' or 'Our' "
                                                "in this Agreement) refers to miastudiosinc-ghana LLC, Ayeduase Kumasi,"
                                                " Ghana.",
                                          ),

                                          const SizedBox(height: 10.0),

                                          /// country
                                          const DefinitionTerm(
                                            title: "Country",
                                            text: "Refers to Ghana.",
                                          ),

                                          const SizedBox(height: 10.0),

                                          /// device
                                          const DefinitionTerm(
                                            title: "Device",
                                            text: "means any device that can access the Service such as a computer, "
                                                "a cellphone or a digital tablet.",
                                          ),

                                          const SizedBox(height: 10.0),

                                          /// personal data
                                          const DefinitionTerm(
                                            title: "Personal Data",
                                            text: "is any information that relates to an identified or identifiable"
                                                " individual on this platform.",
                                          ),

                                          const SizedBox(height: 10.0),

                                          /// personal data
                                          const DefinitionTerm(
                                            title: "Personal Data",
                                            text: "is any information that relates to an identified or identifiable"
                                                " individual on this platform.",
                                          ),

                                          const SizedBox(height: 10.0),

                                          /// service
                                          const DefinitionTerm(
                                            title: "Service",
                                            text: "refers to the Application.",
                                          ),

                                          const SizedBox(height: 10.0),

                                          /// service provider
                                          const DefinitionTerm(
                                            title: "Service Provider",
                                            text: "means any natural or legal person who processes the data on "
                                                "behalf of the Company. It refers to third-party companies or "
                                                "individuals employed by the Company to facilitate the Service, "
                                                "to provide the Service on behalf of the Company, to perform "
                                                "services related to the Service or to assist the Company in "
                                                "analyzing how the Service is used.",
                                          ),
                                          const SizedBox(height: 10.0),

                                          /// usage data
                                          const DefinitionTerm(
                                            title: "Usage Data",
                                            text: "refers to data collected automatically, either generated by the "
                                                "use of the Service or from the Service infrastructure itself "
                                                "(for example, the duration of a page visit)",
                                          ),
                                          const SizedBox(height: 10.0),

                                          /// you
                                          const DefinitionTerm(
                                            title: "you",
                                            text: "means the individual accessing or using the Service, or the "
                                                "company, or other legal entity on behalf of which such individual "
                                                "is accessing or using the Service, as applicable.",
                                          ),
                                          const SizedBox(height: 10.0),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),

                                    /// data collection
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5.0,
                                            spreadRadius: 0.5,
                                            offset: Offset(
                                              0.7,
                                              0.7,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          /// title
                                          AutoSizeText(
                                            "Collecting and Using Your Personal Data".toUpperCase(),
                                            textAlign: TextAlign.center,
                                            maxLines: 30,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                              color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          const SizedBox(height: 5.0),

                                          /// underline
                                          Container(
                                            height: 3.0,
                                            width: 60.0,
                                            color: themeController.isLightTheme ? BrandColors.colorPrimary : BrandColors.colorWhiteAccent,
                                          ),

                                          const SizedBox(height: 20.0),

                                          /// types of data
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10.0,
                                              horizontal: 10.0,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
                                                width: 1.5,
                                              ),
                                              borderRadius: BorderRadius.circular(10.0),
                                              color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 5.0,
                                                  spreadRadius: 0.5,
                                                  offset: Offset(
                                                    0.7,
                                                    0.7,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            child: Text(
                                              "Types of Data Collected",
                                              maxLines: 30,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),

                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10.0,
                                              horizontal: 10.0,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
                                                width: 1.5,
                                              ),
                                              borderRadius: BorderRadius.circular(10.0),
                                              color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 5.0,
                                                  spreadRadius: 0.5,
                                                  offset: Offset(
                                                    0.7,
                                                    0.7,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            child: Text(
                                              "Personal Data",
                                              maxLines: 30,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),

                                          /// email address
                                          AutoSizeText(
                                            "Email Address",
                                            maxLines: 30,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                              color: themeController.isLightTheme ? BrandColors.colorPrimary : BrandColors.colorWhiteAccent,
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),

                                          const SizedBox(height: 10.0),

                                          /// full name
                                          AutoSizeText(
                                            "Full Name",
                                            maxLines: 30,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                              color: themeController.isLightTheme ? BrandColors.colorPrimary : BrandColors.colorWhiteAccent,
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),

                                          const SizedBox(height: 10.0),

                                          /// phone number
                                          AutoSizeText(
                                            "Phone Number",
                                            maxLines: 30,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                              color: themeController.isLightTheme ? BrandColors.colorPrimary : BrandColors.colorWhiteAccent,
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),

                                          const SizedBox(height: 10.0),

                                          /// picture
                                          AutoSizeText(
                                            "Picture",
                                            maxLines: 30,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                              color: themeController.isLightTheme ? BrandColors.colorPrimary : BrandColors.colorWhiteAccent,
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(height: 20.0),

                                    /// usage data
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5.0,
                                            spreadRadius: 0.5,
                                            offset: Offset(
                                              0.7,
                                              0.7,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        "Data Usage".toUpperCase(),
                                        maxLines: 30,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18.0,
                                          color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),

                                    /// usage
                                    Text(
                                      "Usage Data is collected automatically when using the Service. Usage Data may "
                                      " include information such as Your Device's Location, The trips you request "
                                      "for, when you make those trip request, where you went to and where you "
                                      "were before the trip. The data collected on this platform may be used to "
                                      "contact you, maintain and run a smooth service. The data may also be used to "
                                      "manage Your registration as a user of the Service. The Personal Data You "
                                      "provide can give You access to different functionality of the Service "
                                      "that are available to You as a registered user. the development, compliance "
                                      "and undertaking of the purchase contract for the products, items or "
                                      "services You have purchased or of any other contract with Us through "
                                      "the Service. The data may be used to contact You by email, telephone calls,"
                                      " SMS, or other "
                                      "equivalent forms of electronic communication, such as a mobile "
                                      "application's push notifications regarding updates or informative "
                                      "communications related to the functionality, products or contracted "
                                      "services, including the security updates, when necessary or reasonable "
                                      "for their implementation.",
                                      textAlign: TextAlign.justify,
                                      maxLines: 30,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: themeController.isLightTheme ? BrandColors.colorTextDark : BrandColors.colorWhiteAccent,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),

                                    const SizedBox(height: 20.0),

                                    /// data retention
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5.0,
                                            spreadRadius: 0.5,
                                            offset: Offset(
                                              0.7,
                                              0.7,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        "Data retention".toUpperCase(),
                                        maxLines: 30,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w900,
                                          color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),

                                    /// retention text
                                    Text(
                                      "The Company will retain Your Personal Data only for as long as is necessary "
                                      "for the purposes set out in this Privacy Policy. We will retain and use "
                                      "Your Personal Data to the extent necessary to comply with our legal "
                                      "obligations (for example, if we are required to retain your data to "
                                      "comply with applicable laws), resolve disputes, and enforce our legal "
                                      "agreements and policies. The Company will also retain Usage Data for "
                                      "internal analysis purposes. Usage Data is generally retained for a "
                                      "shorter period of time, except when this data is used to strengthen "
                                      "the security or to improve the functionality of Our Service, or We are "
                                      "legally obligated to retain this data for longer time periods",
                                      textAlign: TextAlign.justify,
                                      maxLines: 30,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: themeController.isLightTheme ? BrandColors.colorTextDark : BrandColors.colorWhiteAccent,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),

                                    const SizedBox(height: 20.0),

                                    /// data transfer
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5.0,
                                            spreadRadius: 0.5,
                                            offset: Offset(
                                              0.7,
                                              0.7,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        "Data transfer".toUpperCase(),
                                        maxLines: 30,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w900,
                                          color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),

                                    /// retention text
                                    Text(
                                      "Your information, including Personal Data, is processed at the Company's "
                                      "operating offices and in any other places where the parties involved "
                                      "in the processing are located. It means that this information may be "
                                      "transferred to — and maintained on — computers located outside of Your "
                                      "state, province, country or other governmental jurisdiction where the "
                                      "data protection laws may differ than those from Your jurisdiction. Your "
                                      "consent to this Privacy Policy followed by Your submission of such "
                                      "information represents Your agreement to that transfer. The Company "
                                      "will take all steps reasonably necessary to ensure that Your data is "
                                      "treated securely and in accordance with this Privacy Policy and no "
                                      "transfer of Your Personal Data will take place to an organization or "
                                      "a country unless there are adequate controls in place including the "
                                      "security of Your data and other personal information.",
                                      textAlign: TextAlign.justify,
                                      maxLines: 30,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: themeController.isLightTheme ? BrandColors.colorTextDark : BrandColors.colorWhiteAccent,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),

                                    /// law enforcement
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5.0,
                                            spreadRadius: 0.5,
                                            offset: Offset(
                                              0.7,
                                              0.7,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        "Law enforcement".toUpperCase(),
                                        maxLines: 30,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w900,
                                          color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),

                                    /// law enforcement
                                    Text(
                                      "Under certain circumstances, the Company may be required to disclose Your "
                                      "Personal Data if required to do so by law or in response to valid "
                                      "requests by public authorities (e.g. a court or a government agency).",
                                      textAlign: TextAlign.justify,
                                      maxLines: 30,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: themeController.isLightTheme ? BrandColors.colorTextDark : BrandColors.colorWhiteAccent,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),

                                    const SizedBox(height: 20.0),

                                    /// other legal requirement
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5.0,
                                            spreadRadius: 0.5,
                                            offset: Offset(
                                              0.7,
                                              0.7,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        "other legal requirements".toUpperCase(),
                                        maxLines: 30,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w900,
                                          color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 20.0),

                                    /// other legal requirements
                                    Text(
                                      "The Company may disclose Your Personal Data in the good faith belief that "
                                      "such action is necessary to Comply with a legal obligation Protect and "
                                      "defend the rights or property of the Company Prevent or investigate "
                                      "possible wrongdoing in connection with the Service Protect the personal "
                                      "safety of Users of the Service or the public Protect against legal "
                                      "liability.",
                                      textAlign: TextAlign.justify,
                                      maxLines: 30,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: themeController.isLightTheme ? BrandColors.colorTextDark : BrandColors.colorWhiteAccent,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),

                                    const SizedBox(height: 20.0),

                                    /// personal data privacy
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5.0,
                                            spreadRadius: 0.5,
                                            offset: Offset(
                                              0.7,
                                              0.7,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        "Security of Your Personal Data".toUpperCase(),
                                        maxLines: 30,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w900,
                                          color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 20.0),

                                    /// personal data privacy
                                    Text(
                                      "The security of Your Personal Data is important to Us, We use commercially "
                                      "acceptable means to protect Your Personal Data",
                                      textAlign: TextAlign.justify,
                                      maxLines: 30,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: themeController.isLightTheme ? BrandColors.colorTextDark : BrandColors.colorWhiteAccent,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),

                                    const SizedBox(height: 20.0),

                                    /// children privacy privacy
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5.0,
                                            spreadRadius: 0.5,
                                            offset: Offset(
                                              0.7,
                                              0.7,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        "children privacy".toUpperCase(),
                                        maxLines: 30,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w900,
                                          color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 20.0),

                                    /// other legal requirements
                                    Text(
                                      "Our Service does not address anyone under the age of 13. We do not knowingly "
                                      "collect personally identifiable information from anyone under the age of"
                                      " 13. If You are a parent or guardian and You are aware that Your child "
                                      "has provided Us with Personal Data, please contact Us. If We become "
                                      "aware that We have collected Personal Data from anyone under the age "
                                      "of 13 without verification of parental consent, We take steps to remove "
                                      "that information from Our servers. If We need to rely on consent as a "
                                      "legal basis for processing Your information and Your country requires "
                                      "consent from a parent, We may require Your parent's consent before "
                                      "We collect and use that information.",
                                      textAlign: TextAlign.justify,
                                      maxLines: 30,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: themeController.isLightTheme ? BrandColors.colorTextDark : BrandColors.colorWhiteAccent,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),

                                    const SizedBox(height: 20.0),

                                    /// changes to this policy statements
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5.0,
                                            spreadRadius: 0.5,
                                            offset: Offset(
                                              0.7,
                                              0.7,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        "Changes to this Privacy Policy".toUpperCase(),
                                        maxLines: 30,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w900,
                                          color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 20.0),

                                    /// other legal requirements
                                    Text(
                                      "We may update Our Privacy Policy from time to time. We will notify You of "
                                      "any changes by posting the new Privacy Policy on this page. We will let "
                                      "You know via email and/or a prominent notice on Our Service, prior to "
                                      "the change becoming effective and update the 'Last updated' date at the "
                                      "top of this Privacy Policy. You are advised to review this Privacy "
                                      "Policy periodically for any changes. Changes to this Privacy Policy "
                                      "are effective when they are posted on this page.",
                                      textAlign: TextAlign.justify,
                                      maxLines: 30,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: themeController.isLightTheme
                                            ? themeController.isLightTheme
                                                ? BrandColors.colorTextDark
                                                : BrandColors.colorWhiteAccent
                                            : BrandColors.colorWhiteAccent,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),

                                    const SizedBox(height: 20.0),

                                    /// contact us
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5.0,
                                            spreadRadius: 0.5,
                                            offset: Offset(
                                              0.7,
                                              0.7,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        "Contact us".toUpperCase(),
                                        maxLines: 30,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w900,
                                          color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 20.0),

                                    /// other legal requirements
                                    Text(
                                      "If you have any questions about this Privacy Policy, You can contact us ",
                                      textAlign: TextAlign.center,
                                      maxLines: 30,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: themeController.isLightTheme
                                            ? themeController.isLightTheme
                                                ? BrandColors.colorTextDark
                                                : BrandColors.colorWhiteAccent
                                            : BrandColors.colorWhiteAccent,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),

                                    const SizedBox(height: 20.0),

                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5.0,
                                            spreadRadius: 0.5,
                                            offset: Offset(
                                              0.7,
                                              0.7,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              /*
                                              * #####################################################
                                              * #################### launch mail app ################
                                              * #####################################################
                                              * */

                                              EmailContent email = EmailContent(
                                                to: [
                                                  'miastudiosinc@gmail.com',
                                                  'toobudanielnabie@gmail.com',
                                                  'kingsmanreedemer.8@gmail.com',
                                                ],
                                                subject: 'Hello, The School Profiler support team,',
                                                body: 'I want to enquire on...',
                                                // cc: ['user2@domain.com', 'user3@domain.com'],
                                                // bcc: ['boss@domain.com'],
                                              );

                                              OpenMailAppResult result = await OpenMailApp.composeNewEmailInMailApp(nativePickerTitle: 'Select email app to continue', emailContent: email);
                                              if (!result.didOpen && !result.canOpen) {
                                                showCustomFlushBar(
                                                  context: context,
                                                  title: "Error",
                                                  messageText: "No email app installed on this device",
                                                  backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                                  messageColor: themeController.isLightTheme ? BrandColors.kErrorColor : BrandColors.colorWhiteAccent,
                                                  iconColor: themeController.isLightTheme ? BrandColors.kErrorColor : BrandColors.colorWhiteAccent,
                                                  titleColor: themeController.isLightTheme ? BrandColors.kErrorColor : BrandColors.colorWhiteAccent,
                                                  icon: LineAwesomeIcons.times_circle,
                                                  iconSize: 28.0,
                                                );
                                              } else if (!result.didOpen && result.canOpen) {
                                                showDialog(
                                                  context: context,
                                                  builder: (_) => MailAppPickerDialog(
                                                    mailApps: result.options,
                                                    emailContent: email,
                                                  ),
                                                );
                                              }
                                            },
                                            child: AutoSizeText(
                                              "By email: miastudiosinc@gmail.com \ntoobudanielnabie@gmail.com \nkingsmanreedemer.8@gmail.com",
                                              textAlign: TextAlign.center,
                                              maxLines: 30,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                color: themeController.isLightTheme ? BrandColors.colorTextDark : BrandColors.colorWhiteAccent,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20.0),
                                          GestureDetector(
                                            onTap: () {
                                              // construct url to call the phone number
                                              String url = "tel:+233542864498";
                                              HelperFunctions.iLaunchUrl(url);
                                            },
                                            child: AutoSizeText(
                                              "By phone number: +233 (0) 542864498",
                                              textAlign: TextAlign.start,
                                              maxLines: 30,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                color: themeController.isLightTheme ? BrandColors.colorTextDark : BrandColors.colorWhiteAccent,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20.0),
                                          GestureDetector(
                                            onTap: () {
                                              // construct url to call the phone number
                                              String url = "tel:+233246808110";
                                              HelperFunctions.iLaunchUrl(url);
                                            },
                                            child: AutoSizeText(
                                              "By phone number: +233 (0) 246808110",
                                              textAlign: TextAlign.start,
                                              maxLines: 30,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                color: themeController.isLightTheme ? BrandColors.colorTextDark : BrandColors.colorWhiteAccent,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20.0),
                                          GestureDetector(
                                            onTap: () {
                                              // construct url to call the phone number
                                              String url = "tel:+233504745826";
                                              HelperFunctions.iLaunchUrl(url);
                                            },
                                            child: AutoSizeText(
                                              "By phone number: +233 (0) 504745826",
                                              textAlign: TextAlign.start,
                                              maxLines: 30,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                color: themeController.isLightTheme ? BrandColors.colorTextDark : BrandColors.colorWhiteAccent,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 25),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0,
                                      spreadRadius: 0.5,
                                      offset: Offset(
                                        0.7,
                                        0.7,
                                      ),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Built By Students For Parents, Guardians & Students.",
                                      textAlign: TextAlign.center,
                                      maxLines: 30,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                        color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    const SizedBox(height: 5.0),
                                    Container(
                                      height: 3.0,
                                      width: 150.0,
                                      color: themeController.isLightTheme ? BrandColors.colorPrimary : BrandColors.colorWhiteAccent,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
