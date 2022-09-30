import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_profile/index.dart';

class AboutMemberCard extends StatefulWidget {
  final String? name;
  final String? image;
  final String? about;
  final Color? color;
  const AboutMemberCard({
    Key? key,
    this.name,
    this.image,
    this.about,
    this.color,
  }) : super(key: key);

  @override
  State<AboutMemberCard> createState() => _AboutMemberCardState();
}

class _AboutMemberCardState extends State<AboutMemberCard> {
  Duration duration = const Duration(milliseconds: 200);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      child: Obx(
        () => AnimatedContainer(
          duration: duration,
          margin: const EdgeInsets.only(top: kDefaultPadding * 3),
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 20.0),
          height: 350.0,
          width: 350.0,
          decoration: BoxDecoration(
            color: themeController.isLightTheme ? widget.color ?? BrandColors.colorBackground : BrandColors.colorDarkTheme,
            border: Border.all(
              color: themeController.isLightTheme ? Colors.transparent : BrandColors.colorWhiteAccent,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [kDefaultCardShadow],
          ),
          child: Column(
            children: <Widget>[
              Transform.translate(
                offset: const Offset(0, -55),
                child: AnimatedContainer(
                  duration: duration,
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: themeController.isLightTheme ? Colors.white : BrandColors.colorDarkTheme,
                      width: 10.0,
                    ),
                    boxShadow: [kDefaultCardShadow],
                    image: DecorationImage(
                      image: AssetImage(widget.image!),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: CustomTextWidget(
                    text: widget.about ?? "No description",
                    color: themeController.isLightTheme ? BrandColors.kCustomTextColor : BrandColors.colorLightGray,
                    fontSize: 18.0,
                    maxLines: 50,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: kDefaultPadding * 2),
              CustomTextWidget(
                text: widget.name ?? "No name",
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
