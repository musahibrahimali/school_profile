import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_profile/index.dart';

class InstitutionCard extends StatefulWidget {
  final SchoolModel schoolModel;
  final void Function() onLike;
  final void Function() onPressed;

  const InstitutionCard({
    Key? key,
    required this.schoolModel,
    required this.onPressed,
    required this.onLike,
  }) : super(key: key);

  @override
  State<InstitutionCard> createState() => _InstitutionCardState();
}

class _InstitutionCardState extends State<InstitutionCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    for (dynamic like in widget.schoolModel.likes!) {
      if (like['user_id'] == userController.currentUserInfo.uid) {
        setState(() {
          isLiked = true;
        });
      } else {
        setState(() {
          isLiked = false;
        });
      }
    }

    return InkWell(
      onTap: widget.onPressed,
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
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
                child: CachedNetworkImage(
                  width: 180.0.w,
                  height: 320.0,
                  imageUrl: widget.schoolModel.avatar ?? widget.schoolModel.images![0],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 180.0.w,
                    height: 320.0,
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
                      height: 320.0,
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
                          GestureDetector(
                            onTap: widget.onLike,
                            child: Container(
                              child: isLiked
                                  ? Icon(
                                      Icons.favorite,
                                      color: BrandColors.kErrorColor,
                                      size: 50.0,
                                    )
                                  : Icon(
                                      Icons.favorite,
                                      color: themeController.isLightTheme ? BrandColors.colorLightGray : BrandColors.colorLightGray,
                                      size: 50.0,
                                    ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
