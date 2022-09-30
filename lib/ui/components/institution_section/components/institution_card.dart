import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:school_profile/index.dart';

class InstitutionCard extends StatefulWidget {
  final SchoolModel schoolModel;
  final void Function() onLike;
  final void Function() onPressed;
  final void Function()? onEdit;
  final void Function()? onDelete;

  const InstitutionCard({
    Key? key,
    required this.schoolModel,
    required this.onPressed,
    required this.onLike,
    this.onEdit,
    this.onDelete,
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
                  fit: BoxFit.contain,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          if (userController.isUserLoggedIn && userController.currentUserInfo.isAdmin == true && widget.schoolModel.userId == userController.currentUserInfo.uid)
                            GestureDetector(
                              onTap: widget.onDelete ?? () {},
                              child: Icon(
                                LineAwesomeIcons.trash,
                                color: themeController.isLightTheme ? BrandColors.colorLightGray : BrandColors.colorLightGray,
                                size: 30.0,
                              ),
                            ),
                          const SizedBox(width: 10.0),
                          if (userController.isUserLoggedIn && userController.currentUserInfo.isAdmin == true && widget.schoolModel.userId == userController.currentUserInfo.uid)
                            GestureDetector(
                              onTap: widget.onEdit ?? () {},
                              child: Icon(
                                LineAwesomeIcons.edit,
                                color: themeController.isLightTheme ? BrandColors.colorLightGray : BrandColors.colorLightGray,
                                size: 30.0,
                              ),
                            ),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: widget.onLike,
                            child: Container(
                              child: isLiked
                                  ? Icon(
                                      Icons.favorite,
                                      color: BrandColors.kErrorColor,
                                      size: 30.0,
                                    )
                                  : Icon(
                                      Icons.favorite,
                                      color: themeController.isLightTheme ? BrandColors.colorLightGray : BrandColors.colorLightGray,
                                      size: 30.0,
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
                          RatingBar.builder(
                            initialRating: double.tryParse(widget.schoolModel.rating!) ?? 2.0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemSize: 13.0.h,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: BrandColors.colorPink,
                              size: 5.0,
                            ),
                            onRatingUpdate: (rating) {
                              // print(rating);
                            },
                          ),
                          const SizedBox(height: kDefaultPadding / 2),
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
