import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_profile/index.dart';

class SchoolReviewCard extends StatefulWidget {
  final ReviewModel? review;
  final UserModel? user;
  const SchoolReviewCard({
    Key? key,
    this.review,
    this.user,
  }) : super(key: key);

  @override
  State<SchoolReviewCard> createState() => _SchoolReviewCardState();
}

class _SchoolReviewCardState extends State<SchoolReviewCard> {
  Duration duration = const Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      child: Obx(
        () => AnimatedContainer(
          duration: duration,
          margin: const EdgeInsets.only(top: kDefaultPadding * 3),
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 350.0,
          width: 350.0,
          decoration: BoxDecoration(
            color: themeController.isLightTheme ? BrandColors.colorWhiteAccent : BrandColors.colorDarkTheme,
            border: Border.all(
              color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [kDefaultCardShadow],
          ),
          child: Column(
            children: [
              Transform.translate(
                offset: const Offset(0, -55),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: themeController.isLightTheme ? Colors.white : BrandColors.colorDarkTheme,
                      width: 10.0,
                    ),
                    boxShadow: [kDefaultCardShadow],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1500.0),
                    child: CachedNetworkImage(
                      width: 100.0,
                      height: 100.0,
                      imageUrl: widget.user?.profile ?? "",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.iconsProfileIcon),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, dynamic) {
                        return Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Assets.iconsProfileIcon),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              CustomTextWidget(
                text: widget.review?.review ?? "",
                color: themeController.isLightTheme ? BrandColors.kCustomTextColor : BrandColors.colorLightGray,
                fontSize: 18.0,
                maxLines: 10,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
              const SizedBox(height: kDefaultPadding * 2),
              CustomTextWidget(
                text: widget.user?.name ?? "Anonymous",
                fontWeight: FontWeight.bold,
                color: themeController.isLightTheme ? BrandColors.colorTextDark : BrandColors.colorLightGray,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
