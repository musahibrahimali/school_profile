import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class MobileInstitutionCard extends StatefulWidget {
  final SchoolModel schoolModel;
  final void Function() press;

  const MobileInstitutionCard({
    Key? key,
    required this.schoolModel,
    required this.press,
  }) : super(key: key);

  @override
  State<MobileInstitutionCard> createState() => _MobileInstitutionCardState();
}

class _MobileInstitutionCardState extends State<MobileInstitutionCard> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 320.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: themeController.isLightTheme ? Colors.white : BrandColors.colorDarkTheme,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [kDefaultCardShadow],
            border: Border.all(
              color: themeController.isLightTheme ? Colors.transparent : BrandColors.grey700,
              width: 1.0,
            ),
          ),
          child: Row(
            children: [
              // sow a network image if the image is not null
              // else show a placeholder image
              if (widget.schoolModel.images != null || widget.schoolModel.images!.isNotEmpty)
                Container(
                  width: 180.0.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.schoolModel.images![0],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              if (widget.schoolModel.images == null || widget.schoolModel.images!.isEmpty)
                Container(
                  width: 180.0.w,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(Assets.imagesWork1),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                    vertical: 10.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(child: Container()),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isLiked = !isLiked;
                              });
                            },
                            icon: !isLiked
                                ? Icon(
                                    LineAwesomeIcons.heart,
                                    color: BrandColors.kGrey,
                                    size: 50.0,
                                  )
                                : Icon(
                                    Icons.favorite,
                                    color: BrandColors.kErrorColor,
                                    size: 50.0,
                                  ),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CustomTextWidget(
                            text: widget.schoolModel.name!.toUpperCase(),
                            color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                            fontSize: 18.0,
                            maxLines: 3,
                            fontWeight: FontWeight.w900,
                          ),
                          const SizedBox(height: kDefaultPadding / 2),
                          CustomTextWidget(
                            // text: "motto",
                            text: widget.schoolModel.slogan!,
                            color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                            maxLines: 5,
                          ),
                          const SizedBox(height: kDefaultPadding),
                          Text(
                            "View Details",
                            style: GoogleFonts.montserrat(
                              decoration: TextDecoration.underline,
                              color: themeController.isLightTheme ? BrandColors.colorText : BrandColors.colorWhiteAccent,
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
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
