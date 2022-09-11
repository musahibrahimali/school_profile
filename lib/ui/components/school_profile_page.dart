import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:school_profile/index.dart';

class SchoolProfilePage extends StatefulWidget {
  static const String id = 'school_profile_page';
  final SchoolModel schoolModel;
  const SchoolProfilePage({
    Key? key,
    required this.schoolModel,
  }) : super(key: key);

  @override
  State<SchoolProfilePage> createState() => _SchoolProfilePageState();
}

class _SchoolProfilePageState extends State<SchoolProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isKeyboardOpen = false;
  List<UserModel>? users;

  @override
  void initState() {
    _isKeyboardOpen = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // check if keyboard is open
    final double screenHeight = MediaQuery.of(context).size.height;

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

    return Obx(
      () => Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
        appBar: AppBar(
          backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
          elevation: 5,
          leading: InkWell(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: themeController.isLightTheme ? BrandColors.colorDarkTheme : BrandColors.colorWhiteAccent,
                  width: 1.5,
                ),
              ),
              child: Icon(
                LineAwesomeIcons.angle_left,
                color: themeController.isLightTheme ? BrandColors.black : BrandColors.white,
                size: 28.0,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: CustomText(
            text: "School Profile",
            color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _isKeyboardOpen
                      ? Container()
                      : Expanded(
                          flex: 2,
                          child: Stack(
                            children: <Widget>[
                              OpaqueImage(
                                imageUrl: widget.schoolModel.avatar ?? widget.schoolModel.images![0],
                              ),
                              SafeArea(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                                  margin: const EdgeInsets.only(bottom: 20.0),
                                  child: Column(
                                    children: <Widget>[
                                      MyInfo(school: widget.schoolModel),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                  /// cards
                  Expanded(
                    flex: 6,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(top: 40.0),
                            margin: const EdgeInsets.only(bottom: 20.0),
                            color: themeController.isLightTheme ? Colors.white : BrandColors.colorDarkTheme,
                            child: Table(
                              children: [
                                // first row
                                TableRow(
                                  children: [
                                    // new events
                                    ProfileInfoBigCard(
                                      firstText: widget.schoolModel.rating ?? "3.0",
                                      secondText: "Rating",
                                      icon: Icon(
                                        Icons.star,
                                        size: 32.0,
                                        color: themeController.isLightTheme ? BrandColors.colorPink : BrandColors.kErrorColor,
                                      ),
                                    ),

                                    // responded events
                                    ProfileInfoBigCard(
                                      firstText: widget.schoolModel.studentsPopulation ?? "0",
                                      secondText: "Students",
                                      icon: Icon(
                                        LineAwesomeIcons.user_graduate,
                                        size: 32,
                                        color: themeController.isLightTheme ? BrandColors.colorBlue : BrandColors.colorWhiteAccent,
                                      ),
                                    ),
                                  ],
                                ),

                                /// second row
                                TableRow(
                                  children: [
                                    // critical issues
                                    ProfileInfoBigCard(
                                      firstText: widget.schoolModel.teachersPopulation ?? "0",
                                      secondText: "Teachers",
                                      icon: Icon(
                                        LineAwesomeIcons.chalkboard_teacher,
                                        size: 32,
                                        color: themeController.isLightTheme ? BrandColors.colorBlue : BrandColors.colorWhiteAccent,
                                      ),
                                    ),

                                    /// rematch
                                    ProfileInfoBigCard(
                                      firstText: widget.schoolModel.nonTeachingStaffPopulation ?? "0",
                                      secondText: "Non-Teachers",
                                      icon: Icon(
                                        LineAwesomeIcons.briefcase,
                                        size: 32,
                                        color: themeController.isLightTheme ? BrandColors.colorBlue : BrandColors.colorWhiteAccent,
                                      ),
                                    ),
                                  ],
                                ),

                                /// third row
                                TableRow(
                                  children: [
                                    // phone
                                    InkWell(
                                      onTap: () {
                                        // url to open phone dialer
                                        String url = "tel:${widget.schoolModel.phoneNumber}";
                                        HelperFunctions.iLaunchUrl(url);
                                      },
                                      child: ProfileInfoBigCard(
                                        firstText: widget.schoolModel.phoneNumber ?? "0500 00 00 00",
                                        secondText: "Phone",
                                        icon: Icon(
                                          LineAwesomeIcons.phone,
                                          size: 32,
                                          color: themeController.isLightTheme ? BrandColors.colorBlue : BrandColors.colorWhiteAccent,
                                        ),
                                      ),
                                    ),

                                    /// email
                                    InkWell(
                                      onTap: () {
                                        // url to open email app
                                        String url = "mailto:${widget.schoolModel.emailAddress}";
                                        HelperFunctions.iLaunchUrl(url);
                                      },
                                      child: ProfileInfoBigCard(
                                        firstText: widget.schoolModel.emailAddress ?? "example@email.com",
                                        secondText: "Email",
                                        maxLines: 1,
                                        icon: Icon(
                                          LineAwesomeIcons.envelope,
                                          size: 32,
                                          color: themeController.isLightTheme ? BrandColors.colorBlue : BrandColors.colorWhiteAccent,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height * 0.20,
                                decoration: BoxDecoration(
                                  color: themeController.isLightTheme ? const Color(0xFFF7E8FF).withOpacity(0.3) : BrandColors.colorDarkTheme.withOpacity(0.3),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      Assets.imagesBgImg2,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    CustomTextWidget(
                                      text: widget.schoolModel.name!.toUpperCase(),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 36.0,
                                      maxLines: 5,
                                      color: themeController.isLightTheme ? BrandColors.colorPrimaryDark : BrandColors.colorWhiteAccent,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: kDefaultPadding / 2),
                                    CustomTextWidget(
                                      text: widget.schoolModel.slogan!.toUpperCase(),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 28.0,
                                      maxLines: 2,
                                      color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    /// name of school
                                    MobileDetailItem(
                                      title: "Name",
                                      detail: widget.schoolModel.name ?? "",
                                      backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                      titleColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                      detailColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),
                                    BrandDivider(
                                      color: BrandColors.kGrey,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),

                                    /// year of establishment
                                    MobileDetailItem(
                                      title: "Date of Est.",
                                      detail: widget.schoolModel.yearOfEstablishment ?? "",
                                      backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                      titleColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                      detailColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),
                                    BrandDivider(
                                      color: BrandColors.kGrey,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),

                                    /// category
                                    MobileDetailItem(
                                      title: "School Category",
                                      detail: widget.schoolModel.category ?? "",
                                      backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                      titleColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                      detailColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),
                                    BrandDivider(
                                      color: BrandColors.kGrey,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),

                                    /// level
                                    MobileDetailItem(
                                      title: "School Level",
                                      detail: widget.schoolModel.level ?? "",
                                      backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                      titleColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                      detailColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),
                                    BrandDivider(
                                      color: BrandColors.kGrey,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),

                                    /// region of school
                                    MobileDetailItem(
                                      title: "Region",
                                      detail: widget.schoolModel.region ?? "",
                                      backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                      titleColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                      detailColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),
                                    BrandDivider(
                                      color: BrandColors.kGrey,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),

                                    /// district of school
                                    MobileDetailItem(
                                      title: "District",
                                      detail: widget.schoolModel.district ?? "",
                                      backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                      titleColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                      detailColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),
                                    BrandDivider(
                                      color: BrandColors.kGrey,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),

                                    /// address of school
                                    MobileDetailItem(
                                      title: "Address",
                                      detail: widget.schoolModel.address ?? "",
                                      backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                      titleColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                      detailColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),
                                    BrandDivider(
                                      color: BrandColors.kGrey,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),

                                    /// region of school
                                    MobileDetailItem(
                                      title: "Town",
                                      detail: widget.schoolModel.town ?? "",
                                      backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                      titleColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                      detailColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),
                                    BrandDivider(
                                      color: BrandColors.kGrey,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),

                                    /// region of school
                                    MobileDetailItem(
                                      title: "HeadTeacher",
                                      detail: widget.schoolModel.nameOfHeadTeacher ?? "",
                                      backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                      titleColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                      detailColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),
                                    BrandDivider(
                                      color: BrandColors.kGrey,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),

                                    /// region of school
                                    MobileDetailItem(
                                      title: "Fee Range",
                                      detail: "(GHS) ${widget.schoolModel.feeRange ?? ""}",
                                      backgroundColor: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
                                      titleColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                      detailColor: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),
                                    BrandDivider(
                                      color: BrandColors.kGrey,
                                    ),
                                    const SizedBox(height: kDefaultPadding * 0.5),

                                    const SizedBox(height: kDefaultPadding * 1.5),

                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          // const SizedBox(height: kDefaultPadding * 1.5),
                                          CustomTextWidget(
                                            text: "About ${widget.schoolModel.name}".toUpperCase(),
                                            fontSize: 38.0,
                                            fontWeight: FontWeight.w900,
                                            color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                            maxLines: 5,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: kDefaultPadding * 1.5),
                                          Column(
                                            children: [
                                              AutoSizeText(
                                                widget.schoolModel.history ?? "",
                                                textAlign: TextAlign.justify,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                                ),
                                              ),
                                              const SizedBox(height: kDefaultPadding * 1.5),
                                              CustomTextWidget(
                                                text: "Facilities".toUpperCase(),
                                                fontSize: 38.0,
                                                fontWeight: FontWeight.w900,
                                                color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                                maxLines: 5,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(height: kDefaultPadding * 1.5),
                                              AutoSizeText(
                                                widget.schoolModel.facilities ?? "",
                                                textAlign: TextAlign.justify,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                                ),
                                              ),
                                              const SizedBox(height: kDefaultPadding * 1.5),
                                              CustomTextWidget(
                                                text: "Extra Curricular Activities".toUpperCase(),
                                                fontSize: 28.0,
                                                fontWeight: FontWeight.w900,
                                                color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                                maxLines: 5,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(height: kDefaultPadding * 1.5),
                                              AutoSizeText(
                                                widget.schoolModel.extraCurricular ?? "",
                                                textAlign: TextAlign.justify,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                                ),
                                              ),
                                              const SizedBox(height: kDefaultPadding * 1.5),
                                              CustomTextWidget(
                                                text: "Awards and achievements".toUpperCase(),
                                                fontSize: 28.0,
                                                fontWeight: FontWeight.w900,
                                                color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                                maxLines: 5,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(height: kDefaultPadding * 1.5),
                                              AutoSizeText(
                                                widget.schoolModel.awards ?? "",
                                                textAlign: TextAlign.justify,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                                ),
                                              ),
                                              const SizedBox(height: kDefaultPadding * 1.5),
                                              CustomTextWidget(
                                                text: "Performance".toUpperCase(),
                                                fontSize: 28.0,
                                                fontWeight: FontWeight.w900,
                                                color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                                maxLines: 5,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(height: kDefaultPadding * 1.5),
                                              AutoSizeText(
                                                widget.schoolModel.performance ?? "",
                                                textAlign: TextAlign.justify,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                                ),
                                              ),
                                            ],
                                          ),

                                          const SizedBox(height: kDefaultPadding * 1.5),
                                          // create a grid to display the images of the school
                                          GridView.builder(
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemCount: widget.schoolModel.images!.length,
                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: kDefaultPadding,
                                              mainAxisSpacing: kDefaultPadding,
                                              childAspectRatio: 1.0,
                                            ),
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  // open the image widget in a dialog
                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return CustomDialog(
                                                        child: Column(
                                                          children: <Widget>[
                                                            CachedNetworkImage(
                                                              width: 180.0.w,
                                                              imageUrl: widget.schoolModel.images![index],
                                                              fit: BoxFit.cover,
                                                              placeholder: (context, url) => Container(
                                                                width: 180.0.w,
                                                                decoration: const BoxDecoration(
                                                                  image: DecorationImage(
                                                                    image: AssetImage(Assets.updatesNews),
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              errorWidget: (context, url, dynamic) {
                                                                return Container(
                                                                  width: 180.0.w,
                                                                  decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                      image: AssetImage(Assets.updatesNews),
                                                                      fit: BoxFit.cover,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(20.0),
                                                  child: CachedNetworkImage(
                                                    width: 180.0.w,
                                                    imageUrl: widget.schoolModel.images![index],
                                                    fit: BoxFit.cover,
                                                    placeholder: (context, url) => Container(
                                                      width: 180.0.w,
                                                      decoration: const BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(Assets.updatesNews),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    errorWidget: (context, url, dynamic) {
                                                      return Container(
                                                        width: 180.0.w,
                                                        decoration: const BoxDecoration(
                                                          image: DecorationImage(
                                                            image: AssetImage(Assets.updatesNews),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          const SizedBox(height: kDefaultPadding * 1.5),
                                          // reviews of the school
                                          if (widget.schoolModel.reviews != null || widget.schoolModel.reviews!.isNotEmpty)
                                            Container(
                                              margin: const EdgeInsets.only(bottom: 10.0),
                                              child: CustomTextWidget(
                                                text: "REVIEWS".toUpperCase(),
                                                fontSize: 28.0,
                                                fontWeight: FontWeight.w900,
                                                color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                                maxLines: 5,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          if (widget.schoolModel.reviews == null || widget.schoolModel.reviews!.isEmpty)
                                            Container(
                                              margin: const EdgeInsets.only(bottom: 10.0),
                                              child: CustomTextWidget(
                                                text: "No Reviews Yet",
                                                fontSize: 28.0,
                                                fontWeight: FontWeight.w900,
                                                color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                                                maxLines: 5,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          if (widget.schoolModel.reviews != null || widget.schoolModel.reviews!.isNotEmpty)
                                            Builder(
                                              builder: (context) {
                                                return ListView.builder(
                                                  shrinkWrap: true,
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  itemCount: widget.schoolModel.reviews!.length,
                                                  itemBuilder: (context, index) {
                                                    fetchData({required int index}) async {
                                                      final response = await FirebaseFirestore.instance.collection('users').doc(widget.schoolModel.reviews![index]['userId']).get();
                                                      // debugPrint("data $response");
                                                      dynamic data = response.data();
                                                      return data;
                                                    }

                                                    var data = fetchData(index: index);
                                                    // use a future builder to get the user data
                                                    return FutureBuilder(
                                                      future: data,
                                                      builder: (context, snapshot) {
                                                        if (snapshot.hasData) {
                                                          return Container(
                                                            margin: const EdgeInsets.only(bottom: 15.0),
                                                            child: SchoolReviewCard(
                                                              user: UserModel.fromMap(snapshot.data as Map<String, dynamic>),
                                                              review: ReviewModel.fromJson(widget.schoolModel.reviews![index]),
                                                            ),
                                                          );
                                                        } else {
                                                          return Container();
                                                        }
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              MobileReviewSection(
                                onSave: () async {
                                  if (userController.isUserLoggedIn == true) {
                                    showLoading(context);
                                    FocusScope.of(context).unfocus();
                                    FirebaseFirestore.instance.collection(FirestorePaths.schoolsCollection).doc(widget.schoolModel.id).update(
                                      {
                                        'reviews': FieldValue.arrayUnion([
                                          {
                                            'uid': "",
                                            'userId': userController.currentUserInfo.uid,
                                            'schoolId': widget.schoolModel.id,
                                            'review': reviewContentController.text,
                                            'date': HelperFunctions.getCurrentDate(),
                                          }
                                        ])
                                      },
                                    ).whenComplete(() {
                                      Navigator.pop(context);
                                      FocusScope.of(context).unfocus();
                                      reviewContentController.clear();
                                      schoolController.clearFilteredSchools();
                                      schoolController.schools.clear();
                                      HelperMethods.getAllSchools();
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
                                      // debugPrint('Field Added');
                                    });
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
                              const SizedBox(height: kDefaultPadding * 2),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // progress fill
              _isKeyboardOpen
                  ? Container()
                  : Positioned(
                      top: screenHeight * (3 / 8) - 70 / 0.5,
                      left: 16.0,
                      right: 16.0,
                      child: SizedBox(
                        height: 80.0,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            ProfileInfoCard(
                              firstText: widget.schoolModel.likes!.isNotEmpty ? widget.schoolModel.likes!.length.toString() : "0",
                              secondText: "Likes",
                            ),
                            const ProfileInfoCard(
                              hasImage: true,
                              imagePath: Assets.iconsPulse,
                            ),
                            ProfileInfoCard(
                              firstText: widget.schoolModel.rating ?? "3.0",
                              secondText: "Rating",
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
