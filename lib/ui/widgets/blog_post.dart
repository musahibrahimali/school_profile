import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_profile/index.dart';

class BlogPostCard extends StatelessWidget {
  final Blog blog;
  const BlogPostCard({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.only(bottom: kDefaultPadding),
        decoration: BoxDecoration(
          color: themeController.isLightTheme ? BrandColors.colorBackground : BrandColors.colorDarkTheme,
        ),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.78,
              child: Image.asset(
                blog.image,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: themeController.isLightTheme ? Colors.white : BrandColors.colorDarkTheme,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomTextWidget(
                        text: "Design".toUpperCase(),
                        color: themeController.isLightTheme ? BrandColors.kDark : BrandColors.colorWhiteAccent,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(width: kDefaultPadding),
                      Text(
                        blog.date,
                        style: GoogleFonts.montserrat(
                          color: themeController.isLightTheme ? BrandColors.kDark : BrandColors.colorWhiteAccent,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Text(
                      blog.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.raleway(
                        fontSize: 24,
                        color: themeController.isLightTheme ? BrandColors.kDark : BrandColors.colorWhiteAccent,
                        height: 1.3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    blog.description,
                    maxLines: 4,
                    style: GoogleFonts.montserrat(
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.only(
                            bottom: kDefaultPadding / 4,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: BrandColors.kDark,
                                width: 3,
                              ),
                            ),
                          ),
                          child: Text(
                            "Read More",
                            style: TextStyle(
                              color: themeController.isLightTheme ? BrandColors.kErrorColor : BrandColors.colorWhiteAccent,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: SvgPicture.asset(
                          Assets.iconsFeatherThumbsUp,
                          color: themeController.isLightTheme ? BrandColors.kDark : BrandColors.colorWhiteAccent,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          Assets.iconsFeatherMessageSquare,
                          color: themeController.isLightTheme ? BrandColors.kDark : BrandColors.colorWhiteAccent,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          Assets.iconsFeatherShare2,
                          color: themeController.isLightTheme ? BrandColors.kDark : BrandColors.colorWhiteAccent,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
